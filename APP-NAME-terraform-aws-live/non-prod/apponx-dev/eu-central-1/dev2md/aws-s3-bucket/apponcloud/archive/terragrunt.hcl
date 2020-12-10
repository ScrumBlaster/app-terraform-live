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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-s3-bucket?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-s3-bucket?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  # Unique resource name; This variable is used by terraform null lable module for creating tag Name and setting it's value
  name = "APP-NAME-${local.name}"

  #---------------------------------------------------------------------------------------------------------------------
  # The name of the S3 bucket in form of {environment}.apponx.de-archive
  bucket = "${local.vars.inputs.env_vars.inputs.name}.apponx.de-${local.name}"

  acl                          = "private"
  force_destroy                = true // A boolean string that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable
  versioning_enabled           = true
  allow_encrypted_uploads_only = false // Set to `true` to prevent uploads (S3 PUT OBJECT) of unencrypted objects to S3 bucket. Not supported by APP-NAME at the moment. Object needs to encrypted before it can be copied/moved from Ec2 to S3. It's single parameter in aws cli command: --sse aws:kms
}
