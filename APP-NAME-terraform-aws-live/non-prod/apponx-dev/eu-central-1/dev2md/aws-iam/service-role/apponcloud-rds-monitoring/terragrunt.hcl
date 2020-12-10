#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  #---------------------------------------------------------------------------------------------------------------------
  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-iam-assumable-service-role?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-iam-assumable-service-role?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  name = local.name

  principal_type = "Service"
  identifiers    = ["monitoring.rds.amazonaws.com"]

  role_description = "IAM RDS mointoring role from APP-NAME RDS database"

  # inline policies
  default_inline_template_policies = {
    rds-enhanced-monitoring-role = "policy/rds-enhanced-monitoring-role.json.tpl"
  }

  policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id
  )
}
