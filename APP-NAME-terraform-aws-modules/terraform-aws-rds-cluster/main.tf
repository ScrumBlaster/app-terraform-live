terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

#-----------------------------------------------------------------------------------------------------------------------
# Security group
resource "aws_security_group" "default" {
  count = var.enabled ? 1 : 0
  # name        = "${var.environment}-${var.name}-${random_id.rds_security_group.b64_url}"
  name_prefix = "${var.environment}-${var.name}"
  description = var.rds_security_group_description
  vpc_id      = var.vpc_id

  # Ingress -> Allowed CIDR blocks
  dynamic "ingress" {
    for_each = [for cidr in var.rds_ingress_allowed_cidr_blocks : {
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

  # Ingress -> Allowed Security Group ids
  dynamic "ingress" {
    for_each = [for sg in var.rds_ingress_allowed_security_groups : {
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
    for_each = [for sg in var.rds_egress_allowed_security_groups : {
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
    for_each = [for sg in var.rds_egress_allowed_cidr_blocks : {
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
      "Name" = "${var.environment}-${var.name}-rds"
    }
  )
}

#-----------------------------------------------------------------------------------------------------------------------
# Random id for generating uniqu final snapshot name (neded when testing and deplyoing/destroying infrastructure
# multiple times)
resource "random_id" "final_snapshot_identifier" {
  keepers = {
    # Generate a new id each time we change security group description beacuse it forces security group to be recreated
  }
  # prefix = "prefix"
  byte_length = 8

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster" "default" {
  count                               = var.enabled ? 1 : 0
  cluster_identifier                  = "${var.environment}-${var.name}"
  database_name                       = var.db_name
  master_username                     = var.admin_user
  master_password                     = var.admin_password
  port                                = var.db_port
  backup_retention_period             = var.retention_period
  preferred_backup_window             = var.is_serverless ? "" : var.cluster_backup_window
  final_snapshot_identifier           = "rds-final-${lower(var.environment)}-${lower(var.name)}-${random_id.final_snapshot_identifier.hex}"
  skip_final_snapshot                 = var.skip_final_snapshot
  apply_immediately                   = var.apply_immediately
  storage_encrypted                   = var.storage_encrypted
  kms_key_id                          = var.kms_key_arn
  snapshot_identifier                 = var.snapshot_identifier
  vpc_security_group_ids              = [aws_security_group.default[0].id]
  preferred_maintenance_window        = var.is_serverless ? "" : var.cluster_maintenance_window
  db_subnet_group_name                = join("", aws_db_subnet_group.default.*.name)
  db_cluster_parameter_group_name     = join("", aws_rds_cluster_parameter_group.default.*.name)
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  engine                              = var.engine
  engine_version                      = var.engine_version
  engine_mode                         = var.is_serverless ? "serverless" : var.engine_mode
  backtrack_window                    = var.backtrack_window

  dynamic "scaling_configuration" {
    for_each = var.is_serverless ? var.scaling_configuration : []
    content {
      auto_pause               = lookup(scaling_configuration.value, "auto_pause", null)
      max_capacity             = lookup(scaling_configuration.value, "max_capacity", null)
      min_capacity             = lookup(scaling_configuration.value, "min_capacity", null)
      seconds_until_auto_pause = lookup(scaling_configuration.value, "seconds_until_auto_pause", null)
    }
  }

  replication_source_identifier   = var.replication_source_identifier
  enabled_cloudwatch_logs_exports = var.is_serverless ? [] : var.enabled_cloudwatch_logs_exports
  deletion_protection             = var.deletion_protection

  lifecycle {
    ignore_changes = [master_password]
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

resource "aws_rds_cluster_instance" "default" {
  count = var.cluster_size

  identifier                      = "${var.environment}-${var.name}-${count.index + 1}"
  cluster_identifier              = join("", aws_rds_cluster.default.*.id)
  instance_class                  = var.instance_type
  db_subnet_group_name            = join("", aws_db_subnet_group.default.*.name)
  db_parameter_group_name         = join("", aws_db_parameter_group.default.*.name)
  publicly_accessible             = var.publicly_accessible
  engine                          = var.engine
  engine_version                  = var.engine_version
  monitoring_interval             = var.rds_monitoring_interval
  monitoring_role_arn             = var.rds_monitoring_role_arn
  performance_insights_enabled    = var.performance_insights_enabled
  performance_insights_kms_key_id = var.performance_insights_kms_key_id
  availability_zone               = element(var.availability_zones, count.index)
  preferred_maintenance_window    = var.is_serverless ? "" : var.instance_maintenance_window
  auto_minor_version_upgrade      = var.auto_minor_version_upgrade

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

resource "aws_db_subnet_group" "default" {
  count       = var.enabled ? 1 : 0
  name        = "${var.environment}-${var.name}"
  description = "Allowed subnets for DB cluster instances"
  subnet_ids  = var.subnets

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_rds_cluster_parameter_group" "default" {
  count       = var.enabled ? 1 : 0
  name        = "${var.environment}-${var.name}-cluster"
  description = "DB cluster parameter group"
  family      = var.cluster_family

  dynamic "parameter" {
    for_each = var.cluster_parameters
    content {
      apply_method = lookup(parameter.value, "apply_method", null)
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_parameter_group" "default" {
  count       = var.enabled && var.cluster_size != 0 ? 1 : 0
  name        = "${var.environment}-${var.name}"
  description = "DB instance parameter group"
  family      = var.cluster_family

  dynamic "parameter" {
    for_each = var.instance_parameters
    content {
      apply_method = lookup(parameter.value, "apply_method", null)
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

#-----------------------------------------------------------------------------------------------------------------------
# This would be possible if we would use private build server (private agent) that is allowed to communicate with our
# database instance in AWS (security group)
#
# https://www.terraform.io/docs/providers/mysql/index.html
#
# Configure the MySQL provider based on the outcome of
# creating the aws_db_instance.
/*provider "mysql" {
  endpoint = aws_rds_cluster.default[0].endpoint
  username = aws_rds_cluster.default[0].master_username
  password = aws_rds_cluster.default[0].master_password
}

resource "mysql_user" "APP-NAME" {
  user               = "APP-NAME"
  host               = "%"
  plaintext_password = "password"
}

resource "mysql_grant" "APP-NAME" {
  user       = mysql_user.APP-NAME.user
  host       = mysql_user.APP-NAME.host
  database   = var.db_name
  privileges = ["SELECT", "UPDATE"]
}*/