#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-kms-key?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-kms-key?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module

  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())

  # KMS alias
  alias = "alias/${local.vars.inputs.env_vars.inputs.name}-${local.name}"
}

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------

  # name  = local.name
  alias = local.alias

  deletion_window_in_days = "7"
  description             = "The KMS key for APP-NAME EBS encryption"

  # ToDo: update policy principals -> more secure (to specific role)
  #---------------------------------------------------------------------------------------------------------------------
  # Policy template
  policy_template = "policy/kms-ebs.json.tpl"

  # Policy template variables
  policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id
  )
}
