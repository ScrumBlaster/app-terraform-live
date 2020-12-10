#-----------------------------------------------------------------------------------------------------------------------
# Backend
terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_elastic_beanstalk_application" "default" {
  count       = var.enabled ? 1 : 0
  name        = var.app_name
  description = var.description

  appversion_lifecycle {
    service_role          = var.eb_service_role
    max_count             = var.app_version_max_count
    delete_source_from_s3 = var.app_version_delete_source_from_s3
  }

  tags = merge(
    var.tags
  )
}

resource "aws_elastic_beanstalk_application_version" "default" {
  count        = var.enabled && var.deploy_custom_app == true ? 1 : 0
  name         = var.app_version_name
  application  = aws_elastic_beanstalk_application.default[0].name
  description  = var.app_version_description
  bucket       = var.app_version_bucket
  key          = var.app_version_key
  force_delete = var.app_version_force_delete

  # tags = module.label.tags
  tags = merge(
    var.tags,
    # var.application_tags,
  )
}
