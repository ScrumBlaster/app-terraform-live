#-----------------------------------------------------------------------------------------------------------------------
# Backend
terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

#-----------------------------------------------------------------------------------------------------------------------
# AWS SSM Document

resource "aws_ssm_document" "default" {
  count = var.enabled ? 1 : 0

  name            = var.ssm_document_name
  document_type   = var.ssm_document_type
  content         = data.template_file.ssm_document_tmpl[0].rendered
  document_format = var.ssm_document_document_format
  target_type     = var.ssm_document_target_type

  permissions = {
    type        = var.share_document_permissions_type
    account_ids = var.account_ids
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

#-----------------------------------------------------------------------------------------------------------------------
# Document template and template variables

data "template_file" "ssm_document_tmpl" {
  count = var.enabled ? 1 : 0

  template = file(var.ssm_document_tmpl_file)

  vars = {
    for var, value in var.template_vars :
    var => value
  }
}