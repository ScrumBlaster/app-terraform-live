terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

#-----------------------------------------------------------------------------------------------------------------------
# Locals
locals {
  elasticache_subnet_group_name = var.elasticache_subnet_group_name != "" ? var.elasticache_subnet_group_name : join("", aws_elasticache_subnet_group.default.*.name)
}

#-----------------------------------------------------------------------------------------------------------------------
# Random id for generating unique resource names for default RDS/Aurora security group
resource "random_id" "redis_security_group" {
  keepers = {
    # Generate a new id each time we change security group description beacuse it forces security group to be recreated
    eb_security_group_desc = var.redis_security_group_description
  }
  # prefix = "prefix"
  byte_length = 8

  lifecycle {
    create_before_destroy = true
  }
}

#-----------------------------------------------------------------------------------------------------------------------
# Security group
resource "aws_security_group" "default" {
  count  = var.enabled ? 1 : 0
  vpc_id = var.vpc_id
  # name   = "${var.environment}-${var.name}"
  name        = "${var.environment}-${var.name}-${random_id.redis_security_group.b64_url}"
  description = var.redis_security_group_description

  # Ingress -> Allowed CIDR blocks
  dynamic "ingress" {
    for_each = [for cidr in var.redis_ingress_allowed_cidr_blocks : {
      from_port   = cidr.from_port
      to_port     = cidr.to_port
      protocol    = cidr.protocol
      cidr_blocks = cidr.cidr_blocks
      description = cidr.description
    }]

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  # Ingress -> Allowe Security Group ids
  dynamic "ingress" {
    for_each = [for sg in var.redis_ingress_allowed_security_groups : {
      from_port       = sg.from_port
      to_port         = sg.to_port
      protocol        = sg.protocol
      security_groups = sg.security_groups
      description     = sg.description
    }]

    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = ingress.value.security_groups
      description     = ingress.value.description
    }
  }

  # Egress -> Allowed Security Group ids
  dynamic "egress" {
    for_each = [for sg in var.redis_egress_allowed_security_groups : {
      from_port       = sg.from_port
      to_port         = sg.to_port
      protocol        = sg.protocol
      security_groups = sg.security_groups
      description     = sg.description
    }]

    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      security_groups = egress.value.security_groups
      description     = egress.value.description
    }
  }

  # Egress -> Allowed CIDR blocks
  dynamic "egress" {
    for_each = [for sg in var.redis_egress_allowed_cidr_blocks : {
      from_port   = sg.from_port
      to_port     = sg.to_port
      protocol    = sg.protocol
      cidr_blocks = sg.cidr_blocks
    }]

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

resource "aws_security_group_rule" "security_group_id_ingress" {
  count = var.enabled && length(var.security_groups) > 0 ? length(var.security_groups) : 0

  type                     = "ingress"
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "tcp"
  source_security_group_id = var.security_groups[count.index]
  security_group_id        = aws_security_group.default[0].id
}

resource "aws_elasticache_subnet_group" "default" {
  count      = var.enabled && var.elasticache_subnet_group_name == "" && length(var.subnets) > 0 ? 1 : 0
  name       = "${var.environment}-${var.name}"
  subnet_ids = var.subnets
}

resource "aws_elasticache_parameter_group" "custom" {
  count  = var.enabled && var.default_parameter_group == null ? 1 : 0
  name   = "${var.environment}-${var.name}"
  family = var.family

  dynamic "parameter" {
    for_each = var.parameter
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

resource "aws_elasticache_replication_group" "default" {
  count = var.enabled ? 1 : 0

  auth_token                    = var.auth_token
  replication_group_id          = var.replication_group_id == "" ? "${var.environment}-redis" : var.replication_group_id
  replication_group_description = "${var.environment}-${var.name}"
  node_type                     = var.instance_type
  number_cache_clusters         = var.cluster_size
  port                          = var.port
  parameter_group_name          = var.default_parameter_group != null ? var.default_parameter_group : join("", aws_elasticache_parameter_group.custom.*.name)
  availability_zones            = slice(var.availability_zones, 0, var.cluster_size)
  automatic_failover_enabled    = var.automatic_failover
  subnet_group_name             = local.elasticache_subnet_group_name
  security_group_ids            = [join("", aws_security_group.default.*.id)]
  maintenance_window            = var.maintenance_window
  notification_topic_arn        = var.notification_topic_arn
  engine_version                = var.engine_version
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  apply_immediately             = var.apply_immediately

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

#
# CloudWatch Resources
#

variable "cache_cpu_alarm" {
  type    = bool
  default = false
}

resource "aws_cloudwatch_metric_alarm" "cache_cpu" {
  count               = var.enabled && var.cache_cpu_alarm ? 1 : 0
  alarm_name          = "${var.name}-cpu-utilization"
  alarm_description   = "Redis cluster CPU utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElastiCache"
  period              = "300"
  statistic           = "Average"

  threshold = var.alarm_cpu_threshold_percent

  dimensions = {
    CacheClusterId = aws_elasticache_replication_group.default[0].id
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
  depends_on    = [aws_elasticache_replication_group.default]
}

variable "cache_memory_alarm" {
  type    = bool
  default = false
}

resource "aws_cloudwatch_metric_alarm" "cache_memory" {
  count               = var.enabled && var.cache_memory_alarm ? 1 : 0
  alarm_name          = "${var.name}-freeable-memory"
  alarm_description   = "Redis cluster freeable memory"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "FreeableMemory"
  namespace           = "AWS/ElastiCache"
  period              = "60"
  statistic           = "Average"

  threshold = var.alarm_memory_threshold_bytes

  dimensions = {
    CacheClusterId = aws_elasticache_replication_group.default[0].id
  }

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
  depends_on    = [aws_elasticache_replication_group.default]
}

locals {
  cluster_dns_name_default = "master.${var.name}"
  cluster_dns_name         = var.cluster_dns_name != "" ? var.cluster_dns_name : local.cluster_dns_name_default
}
