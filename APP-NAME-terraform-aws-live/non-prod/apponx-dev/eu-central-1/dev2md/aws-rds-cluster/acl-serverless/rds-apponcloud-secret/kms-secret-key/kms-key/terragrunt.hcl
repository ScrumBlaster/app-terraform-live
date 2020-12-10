#-----------------------------------------------------------------------------------------------------------------------
terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

dependencies {
  paths = [
    "../../../../../aws-iam/service-role/APP-NAME-ec2",
    "../../iam-lambda-role/lambda-rotation"
  ]
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  #---------------------------------------------------------------------------------------------------------------------
  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-kms-key?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-kms-key?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  # RDS
  rds_vars = read_terragrunt_config("${get_terragrunt_dir()}/../../../rds_vars.hcl")

  # Secret
  secret_vars = read_terragrunt_config("${get_terragrunt_dir()}/../../secret.hcl")

  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())

  alias = "alias/${local.vars.inputs.env_vars.inputs.name}-${local.vars.inputs.rds_vars.inputs.rds_cluster_name}-${local.secret_vars.inputs.secret_name}-${local.name}"
}

# APP-NAME Ec2 IAM role
dependency "iam_APP-NAME_ec2_role" {
  config_path = "${get_terragrunt_dir()}/../../../../../aws-iam/service-role/APP-NAME-ec2"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    arn = "MOCK-iam-arn-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# Lambda function
dependency "iam_lambda_rotate_secret" {
  config_path = "${get_terragrunt_dir()}/../../iam-lambda-role/lambda-rotation"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    arn = "MOCK-iam-arn-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  alias = local.alias

  name = "${local.secret_vars.inputs.secret_name}-kms-key"

  deletion_window_in_days = "7"
  description             = "The KMS key for APP-NAME Aurora MySQL database encryption"

  # ToDo: update policy principals -> more secure (to specific role)
  # Policy template
  policy_template = "policy/kms-secret.json.tpl"

  # Policy template variables
  policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id,
    "aws_iam_lambda_rotate_secret", dependency.iam_lambda_rotate_secret.outputs.arn,
    "aws_iam_APP-NAME_ec2_role_arn", dependency.iam_APP-NAME_ec2_role.outputs.arn
  )
}
