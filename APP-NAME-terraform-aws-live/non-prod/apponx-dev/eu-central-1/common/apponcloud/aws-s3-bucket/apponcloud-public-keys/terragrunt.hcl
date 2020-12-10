#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

locals {
  #---------------------------------------------------------------------------------------------------------------------
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-s3-bucket?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-s3-bucket?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module
  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  # Unique resource name; This variable is needed by terraform null lable module (it's used tag variable also)

  name = local.name

  #---------------------------------------------------------------------------------------------------------------------
  # The name of the S3 bucket
  bucket = "${local.vars.inputs.account_vars.inputs.aws_account_id}-ssh-keys"

  acl                          = "private"
  force_destroy                = true // A boolean string that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable
  versioning_enabled           = true
  allow_encrypted_uploads_only = false
}
