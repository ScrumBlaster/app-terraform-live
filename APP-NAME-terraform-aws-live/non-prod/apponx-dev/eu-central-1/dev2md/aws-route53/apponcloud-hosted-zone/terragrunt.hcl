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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-route53-cluster-zone?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-route53-cluster-zone?ref=${local.version}"
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

  # VPC
  #---------------------------------------------------------------------------------------------------------------------
  vpc_id  = local.vars.inputs.vpc_vars.inputs.vpc_id
  subnets = local.vars.inputs.vpc_vars.inputs.subnets
  #---------------------------------------------------------------------------------------------------------------------
  # Route53 hosted zone
  zone_name     = "${local.vars.inputs.env_vars.inputs.name}.apponx.de"
  force_destroy = true
}
