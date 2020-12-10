#-----------------------------------------------------------------------------------------------------------------------
# Common inputs for dev environments
include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

locals {
  #---------------------------------------------------------------------------------------------------------------------
  # get global and common variables
  _global_vars = read_terragrunt_config(find_in_parent_folders("_global_vars.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account_vars.hcl"))
  stage_vars   = read_terragrunt_config(find_in_parent_folders("stage_vars.hcl"))
  vpc_vars     = read_terragrunt_config(find_in_parent_folders("vpc_vars.hcl"))
  env_vars     = read_terragrunt_config("env_vars.hcl")

  # Resource specific vars
  rds_vars = read_terragrunt_config("${get_terragrunt_dir()}/aws-rds-cluster/acl-serverless/rds_vars.hcl")
}

inputs = {
  #---------------------------------------------------------------------------------------------------------------------
  # Read variables
  _global_vars = local._global_vars
  account_vars = local.account_vars
  stage_vars   = local.stage_vars
  env_vars     = local.env_vars
  vpc_vars     = local.vpc_vars
  rds_vars     = local.rds_vars
}