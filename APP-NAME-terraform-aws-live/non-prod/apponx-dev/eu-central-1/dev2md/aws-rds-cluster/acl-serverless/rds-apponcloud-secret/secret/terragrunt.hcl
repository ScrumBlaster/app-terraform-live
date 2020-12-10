#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

dependencies {
  paths = [
    "../lambda-rotation",
    "../kms-secret-key/kms-key",
    "${get_terragrunt_dir()}/../../../${local.vars.inputs.rds_vars.inputs.rds_cluster_name}"
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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-secret-manager?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-secret-manager?ref=${local.version}"
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

# Lambda IAM role for rotating secret
dependency "kms_secret_key" {
  config_path = "${get_terragrunt_dir()}/../kms-secret-key/kms-key"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    key_id = "arn:aws:iam::161590033340:role/infra-pc-aurora-lambda-rotate-mysql-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# Lambda IAM role for rotating secret
dependency "lambda_rotate_secret" {
  config_path = "${get_terragrunt_dir()}/../lambda-rotation"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    lambda_arn = "arn:aws:iam::161590033340:function:infra-lambda-pc-aurora-lambda-rotate-mysql-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# RDS
dependency "rds_database" {
  config_path = "${get_terragrunt_dir()}/../../../${local.vars.inputs.rds_vars.inputs.rds_cluster_name}"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    cluster_identifier = "cluster-idnetifier-MOCKED"
    endpoint           = "database-endpoint-MOCKED"
    engine             = "engine-MOCKED"
    database_name      = "database_name-MOCKED"
    db_port            = "db_port-MOCKED"
    master_username    = "master_username-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  use_default_name    = false // If true, terraform resource will use default name set in module. Set to flase if you want to name resource differently.
  name                = "${dependency.rds_database.outputs.cluster_identifier}-${local.secret_vars.inputs.secret_name}"
  kms_secret_key_id   = dependency.kms_secret_key.outputs.key_id
  rotation_lambda_arn = dependency.lambda_rotate_secret.outputs.lambda_arn
  secret_description  = "${local.vars.inputs.env_vars.inputs.name}: AWS RDS APP-NAME application database user password" // Enable creation of Superadmin users/keys (zugrifschlüsel)

  db_cluster_identifier = dependency.rds_database.outputs.cluster_identifier
  mysql_host            = dependency.rds_database.outputs.endpoint
  engine                = dependency.rds_database.outputs.engine
  mysql_dbname          = dependency.rds_database.outputs.database_name
  mysql_port            = dependency.rds_database.outputs.db_port
  mysql_username        = local.vars.inputs.rds_vars.inputs.rds_APP-NAME_user
  mysql_password        = local.vars.inputs.rds_vars.inputs.rds_APP-NAME_password
}
