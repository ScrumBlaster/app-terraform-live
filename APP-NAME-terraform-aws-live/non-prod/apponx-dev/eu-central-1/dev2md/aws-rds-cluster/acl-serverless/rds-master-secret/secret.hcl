#-----------------------------------------------------------------------------------------------------------------------
include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

locals {
  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

inputs = {
  secret_name = local.name
}
