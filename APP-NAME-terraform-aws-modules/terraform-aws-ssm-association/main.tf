terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

#-----------------------------------------------------------------------------------------------------------------------
# Locals
locals {
  eb_environment_name = (
    # var.kms_key_arn == null # storage_encrypted
    var.eb_environment_name == null # storage_encrypted
    ? data.terraform_remote_state.aws_elastic_beanstalk_environemnt_name[0].outputs.name
    : var.eb_environment_name
  )
}

resource "aws_ssm_association" "run_patch_baseline" {
  name = "AWS-RunPatchBaseline"

  parameters = {
    Operation = "Scan"
  }

  # schedule_expression = "cron(0 0/2 * * ? *)"
  schedule_expression = var.aws_run_patch_baseline_cron != null ? var.aws_run_patch_baseline_cron : "cron(0 0/2 * * ? *)"

  targets {
    key    = "tag:elasticbeanstalk:environment-name"
    values = [local.eb_environment_name]
  }
}

resource "aws_ssm_association" "gather_software_inventory" {
  name = "AWS-GatherSoftwareInventory"

  # schedule_expression = "cron(0 0/12 * * ? *)"
  schedule_expression = var.aws_gather_software_inventory_cron != null ? var.aws_gather_software_inventory_cron : "cron(0 0/12 * * ? *)"

  targets {
    key    = "tag:elasticbeanstalk:environment-name"
    values = [local.eb_environment_name]
  }
}

resource "aws_ssm_association" "update_ssm_agent" {
  name = "AWS-UpdateSSMAgent"

  # schedule_expression = "cron(0 0/4 * * ? *)"
  schedule_expression = var.aws_update_ssm_agent_cron != null ? var.aws_update_ssm_agent_cron : "cron(01 05 ? * * *)"

  targets {
    key    = "tag:elasticbeanstalk:environment-name"
    values = [local.eb_environment_name]
  }
}

