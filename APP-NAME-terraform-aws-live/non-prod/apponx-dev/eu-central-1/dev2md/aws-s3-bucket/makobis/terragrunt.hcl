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

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  # Unique resource name; This variable is used by terraform null lable module for creating tag Name and setting it's value
  name = local.name

  #---------------------------------------------------------------------------------------------------------------------
  # The name of the S3 bucket in form of {environment}.apponx.de-makobis-service
  # We use replace here because we want S3 bucket to match URL name in case environemnt name is not just one word but
  # for example two or more words separated by (-): dev, dev-init...
  bucket = "${replace("${local.vars.inputs.env_vars.inputs.name}", "-", ".")}.apponx.de-${local.name}"

  acl                          = "private"
  force_destroy                = true // A boolean string that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable
  versioning_enabled           = false
  allow_encrypted_uploads_only = false // Set to `true` to prevent uploads (S3 PUT OBJECT) of unencrypted objects to S3 bucket. Not supported by APP-NAME at the moment. Object needs to encrypted before it can be copied/moved from Ec2 to S3. It's single parameter in aws cli command: --sse aws:kms

  user_enabled = true

  default_user_inline_template_policies = {
    s3-makobis-access = "policy/ApponAllowAccessToMakobisS3Bucket.json.tpl"
  }

  user_policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id
  )

  # get_terragrunt_dir(): get_terragrunt_dir() returns the directory where the Terragrunt configuration file
  # (by default terragrunt.hcl) lives.
  #---------------------------------------------------------------------------------------------------------------------
  # get_terragrunt_dir() => makobis-service

  # path_relative_to_include(): returns the relative path between the current terragrunt.hcl file and the path specified
  # in its include block => include { path = find_in_parent_folders() } (main terragrunt.hcl).
  #---------------------------------------------------------------------------------------------------------------------
  # path_relative_to_include() => eu-central-1/dev/aws-s3-bucket/APP-NAME/makobis-service/apponx.de-makobis-service


  # split(separator, string): split produces a list by dividing a given string at all occurrences of a given separator.
  #---------------------------------------------------------------------------------------------------------------------
  # split ("/", "${path_relative_to_include()}")
  # split ("/", "eu-central-1/dev/aws-s3-bucket/APP-NAME/makobis-service/apponx.de-makobis-service") =>
  # ["eu-central-1", "dev", "aws-s3-bucket", "APP-NAME", "makobis-service", "apponx.de-makobis-service"]

  # element(list, index): element retrieves a single element from a list. The index is zero-based. This function
  # produces an error if used with an empty list.
  #---------------------------------------------------------------------------------------------------------------------
  # local.vars.inputs.env_vars.inputs.name
  # element(["eu-central-1", "dev", "aws-s3-bucket", "APP-NAME", "makobis-service", "apponx.de-makobis-service"], 1) =>
  # dev

  # replace(string, substring, replacement): replace searches a given string for another given substring, and replaces
  # each occurrence with a given replacement string.
  #---------------------------------------------------------------------------------------------------------------------
  # replace("${local.vars.inputs.env_vars.inputs.name}", "-", ".")
  # replace ("dev", "-", ".") =>
  # dev
}
