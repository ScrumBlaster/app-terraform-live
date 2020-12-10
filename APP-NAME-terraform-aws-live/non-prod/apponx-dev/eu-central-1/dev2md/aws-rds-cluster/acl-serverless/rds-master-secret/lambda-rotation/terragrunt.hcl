#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

dependencies {
  paths = [
    "../lambda-rotation/lambda-rotate-secret-sg",
    "../iam-lambda-role/lambda-rotation"
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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-lambda-rotate-secret?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-lambda-rotate-secret?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  # RDS
rds_vars = read_terragrunt_config("${get_terragrunt_dir()}/../../rds_vars.hcl")

  # Secret
  secret_vars = read_terragrunt_config("${get_terragrunt_dir()}/../secret.hcl")

  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

# Lambda security group
dependency "lambda_rotate_secret_sg" {
  config_path = "${get_terragrunt_dir()}/lambda-rotate-secret-sg"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    security_group_id = "MOCK-sg-eb_APP-NAME_ec2_sg-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# Lambda IAM role for rotating secret
dependency "iam_lambda_secret_rotation_role" {
  config_path = "${get_terragrunt_dir()}/../iam-lambda-role/lambda-rotation"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    arn = "arn:aws:iam::161590033340:role/infra-pc-aurora-lambda-rotate-mysql-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

inputs = {
  enabled = true
  #---------------------------------------------------------------------------------------------------------------------

  # VPC
  #---------------------------------------------------------------------------------------------------------------------
  vpc_id  = local.vars.inputs.vpc_vars.inputs.vpc_id
  subnets = local.vars.inputs.vpc_vars.inputs.subnets

  #---------------------------------------------------------------------------------------------------------------------
  lambda_test_mode          = false // When enabled, lambda_function_test.py will be used. (defaults to flase)
  use_default_name          = false
  name                      = "${local.vars.inputs.env_vars.inputs.name}-${local.vars.inputs.rds_vars.inputs.rds_cluster_name}-${local.secret_vars.inputs.secret_name}-${local.name}"
  lambda_function_timeout   = 900 // 30min
  lambda_security_group_ids = ["${dependency.lambda_rotate_secret_sg.outputs.security_group_id}"]

  # Lambda IAM arn
  iam_lambda_rotation_arn = dependency.iam_lambda_secret_rotation_role.outputs.arn

  # Enable automatic rotation (used by Lambda function as environment variable)
  enable_automatic_rotation = true
}
