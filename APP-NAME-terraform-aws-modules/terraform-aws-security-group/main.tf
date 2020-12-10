terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

#-----------------------------------------------------------------------------------------------------------------------
# Random id for generating unique resource names for security group

resource "aws_security_group" "default" {
  name_prefix = var.use_default_name ? "${var.environment}-${var.name}" : var.name
  description = var.ec2_security_group_description

  vpc_id = var.vpc_id

  revoke_rules_on_delete = var.revoke_rules_on_delete

  # Ingress -> Allowed CIDR blocks
  dynamic "ingress" {
    for_each = [for cidr in var.ec2_ingress_allowed_cidr_blocks : {
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
    for_each = [for sg in var.ec2_ingress_allowed_security_groups : {
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
    for_each = [for sg in var.ec2_egress_allowed_security_groups : {
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
    for_each = [for sg in var.ec2_egress_allowed_cidr_blocks : {
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

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}