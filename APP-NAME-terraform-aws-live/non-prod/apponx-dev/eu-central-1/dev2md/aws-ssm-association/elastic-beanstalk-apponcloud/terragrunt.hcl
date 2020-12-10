#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

dependencies {
  paths = ["../../aws-elastic-beanstalk/APP-NAME/environment"]
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  #---------------------------------------------------------------------------------------------------------------------
  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-ssm-association?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-ssm-association?ref=${local.version}"
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
  aws_elastic_beanstalk_environemnt_name_remote_state_key = "${local.vars.inputs.stage_vars.inputs.region}/${local.vars.inputs.env_vars.inputs.name}/aws-elastic-beanstalk/APP-NAME/environment/terraform.tfstate"

  aws_run_patch_baseline_cron = "cron(01 15 ? * * *)"
  aws_update_ssm_agent_cron   = "cron(01 05 ? * * *)"
}
