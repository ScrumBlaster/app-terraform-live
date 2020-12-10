#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

dependencies {
  paths = ["../../APP-NAME-public-keys"]
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-s3-bucket-object?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-s3-bucket-object?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------

  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

dependency "s3_bucket" {
  config_path = "${get_terragrunt_dir()}/../"

  mock_outputs = {
    bucket_id = "MOCK-APP-NAME-public-keys3-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------

  bucket_id = dependency.s3_bucket.outputs.bucket_id

  file_list = [
    "keys/m.dujmovic"
  ]
}
