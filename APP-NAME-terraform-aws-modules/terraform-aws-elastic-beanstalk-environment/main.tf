terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

#-----------------------------------------------------------------------------------------------------------------------
# Full list of options:
# http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html#command-options-general-elasticbeanstalkmanagedactionsplatformupdate
resource "aws_elastic_beanstalk_environment" "default" {
  count                  = var.enabled ? 1 : 0
  name                   = "${var.environment}-${var.name}"
  application            = var.eb_application
  description            = var.description
  tier                   = var.tier
  template_name          = aws_elastic_beanstalk_configuration_template.default[0].name
  wait_for_ready_timeout = var.wait_for_ready_timeout
  version_label          = var.app_version_label

  tags = merge(
    var.tags,
    var.environment_tags,
  )
}

#-----------------------------------------------------------------------------------------------------------------------
# Random id for generating unique resource names for default Elastic Beasntalk Configuration template
resource "random_id" "update_environment_trigger" {
  keepers = {
    # Generate a new id each time there is change in Elastic Beanstalk settings when we want update solution stack
    # configuration.

    # Inappropriate value for attribute "keepers": element "eb_configuration_template": string required.
    # eb_configuration_template = local.elastic_beanstalk_settings
    # That's why <<EOF

    eb_configuration_template = <<EOF
      %{~for set in local.elastic_beanstalk_settings}
        Namespace: ${set.namespace}
        Name:      ${set.name}
        Value:     ${set.value}
      %{~endfor}

      %{~for set in local.asg_start_eb_settings_list}
        Namespace: ${set.namespace}
        Name:      ${set.name}
        Value:     ${set.value}
        Resource:  ${set.resource}
      %{~endfor}

      %{~for set in local.asg_stop_eb_settings_list}
        Namespace: ${set.namespace}
        Name:      ${set.name}
        Value:     ${set.value}
        Resource:  ${set.resource}
      %{~endfor}
      EOF

    solution_stack_changed = var.solution_stack_name
  }
  # prefix = "prefix"
  byte_length = 8

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  random_id = random_id.update_environment_trigger.b64_url
}

#-----------------------------------------------------------------------------------------------------------------------
# Configuration template
resource "aws_elastic_beanstalk_configuration_template" "default" {
  count = var.enabled ? 1 : 0
  # Beacuse random_id is part of Configuration template name, each time when random_id change it's value it will force Elastic
  # Beanstalk to recreate template, update environment accordingly
  name                = "${var.environment}-${var.name}-config-template-${local.random_id}"
  application         = var.eb_application
  solution_stack_name = var.solution_stack_name

  #----------------------------------------------
  # Example of how to use "Dynamic Nested Blocks"
  dynamic "setting" {
    for_each = [for sett in local.elastic_beanstalk_settings : {
      namespace = sett.namespace
      name      = sett.name
      value     = sett.value
    }]

    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
    }
  }

  dynamic "setting" {
    for_each = [for sett in local.asg_start_eb_settings_list : {
      namespace = sett.namespace
      name      = sett.name
      value     = sett.value
      resource  = sett.resource
    } if sett.value != ""]

    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
      resource  = setting.value.resource
    }
  }

  dynamic "setting" {
    for_each = [for sett in local.asg_stop_eb_settings_list : {
      namespace = sett.namespace
      name      = sett.name
      value     = sett.value
      resource  = sett.resource
    } if sett.value != ""]

    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
      resource  = setting.value.resource
    }
  }

  dynamic "setting" {
    for_each = [for sett in local.env_vars_rds_list : {
      namespace = sett.namespace
      name      = sett.name
      value     = sett.value
    } if sett.value != ""]

    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
    }
  }

  dynamic "setting" {
    for_each = [for sett in local.env_vars_mail_server_list : {
      namespace = sett.namespace
      name      = sett.name
      value     = sett.value
    } if sett.value != ""]

    content {
      namespace = setting.value.namespace
      name      = setting.value.name
      value     = setting.value.value
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [random_id.update_environment_trigger]
}

#-----------------------------------------------------------------------------------------------------------------------
#
resource "aws_ssm_activation" "ec2" {
  name               = "${var.environment}-${var.name}-ssm"
  iam_role           = var.ec2_service_role_id
  registration_limit = var.autoscale_max
}

#-----------------------------------------------------------------------------------------------------------------------
# Load Balancer

# Random id for generating unique resource names for default Load Balancer security group
resource "random_id" "elb_security_group" {
  keepers = {
    # Generate a new id each time we change security group description beacuse it forces security group to be recreated
    elb_security_group_desc = var.elb_security_group_description
  }
  # prefix = "prefix"
  byte_length = 8

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "elb" {
  name        = "${var.environment}-${var.name}-elb-${random_id.elb_security_group.b64_url}" # ToDo: Shoud use name_prefix instead radnom id generator
  description = var.elb_security_group_description

  vpc_id = var.vpc_id

  # Ingress -> Allowed CIDR blocks
  dynamic "ingress" {
    for_each = [for cidr in var.elb_ingress_allowed_cidr_blocks : {
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
    for_each = [for sg in var.elb_ingress_allowed_security_groups : {
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
    for_each = [for sg in var.elb_egress_allowed_security_groups : {
      from_port       = sg.from_port
      to_port         = sg.to_port
      protocol        = sg.protocol
      security_groups = sg.security_groups
      # description     = sg.description
    }]

    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      security_groups = egress.value.security_groups
      # description     = egress.value.description
    }
  }

  # Egress -> Allowed CIDR blocks
  dynamic "egress" {
    for_each = [for sg in var.elb_egress_allowed_cidr_blocks : {
      from_port   = sg.from_port
      to_port     = sg.to_port
      protocol    = sg.protocol
      cidr_blocks = sg.cidr_blocks
      description = sg.description
    }]

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = egress.value.description
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  # tags = var.tags
  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}-load-balancer"
    }
  )
}

data "aws_elb_service_account" "main" {}

data "aws_iam_policy_document" "elb_logs" {
  statement {
    sid = ""

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.environment}-${var.name}-elb-logs/*",
    ]

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.main.arn]
    }

    effect = "Allow"
  }
}

# ToDo: Think about using s3 module here
resource "aws_s3_bucket" "elb_logs" {
  # bucket        = var.environment != null ? "${var.environment}-${var.name}-elb-logs" : "${var.name}-elb-logs"
  bucket        = "${var.environment}-${var.name}-elb-logs"
  acl           = "private"
  force_destroy = var.force_destroy
  policy        = data.aws_iam_policy_document.elb_logs.json

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  dynamic "lifecycle_rule" {

    for_each = var.s3_lifecycle_rules

    content {
      id      = lifecycle_rule.value.id
      prefix  = lifecycle_rule.value.prefix
      enabled = lifecycle_rule.value.enabled

      abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days

      dynamic "expiration" {
        for_each = lifecycle_rule.value.expiration

        content {
          days = expiration.value.days
          date = expiration.value.date

          expired_object_delete_marker = expiration.value.expired_object_delete_marker
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lifecycle_rule.value.noncurrent_version_expiration

        content {
          days = noncurrent_version_expiration.value.days
        }
      }
    }
  }
}

# Rotate secret
# ToDo: Activate maintenance mode (set LB listener rule) before rotating secret
resource "null_resource" "secret" {
  count = var.rotate_secret ? 1 : 0

  provisioner "local-exec" {
    #-------------------------------------------------------------------------------------------------------------------
    # Once EB environment was successfully deployed, rotate secret for database application user -> APP-NAME

    interpreter = ["/bin/bash", "-c"]
    command     = <<EOF

      if [[ -z "$TERRAGRUNT_IAM_ROLE" ]]; then

        echo "You didn't export any IAM role that Terragrunt can assume, aws_iam_role defined in 'common.hcl' will be used."

        # Rotate secret
        echo "Rotating secret..."
        aws --region ${var.region} secretsmanager rotate-secret \
            --secret-id ${var.rds_APP-NAME_secret_id} \
            --rotation-lambda-arn ${var.rotation_lambda_arn}
      fi
    EOF
  }

  depends_on = [aws_elastic_beanstalk_environment.default]
}