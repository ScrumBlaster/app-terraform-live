#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

dependencies {
  paths = [
    "${get_terragrunt_dir()}/../../../../../aws-sns-topic/elastic-beanstalk-notifications",
    "${get_terragrunt_dir()}/../../../../${local.vars.inputs.rds_vars.inputs.rds_cluster_name}"
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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-iam-assumable-service-role?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-iam-assumable-service-role?ref=${local.version}"
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
}

# SNS topic
dependency "sns_topic" {
  config_path = "${get_terragrunt_dir()}/../../../../../aws-sns-topic/elastic-beanstalk-notifications"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    sns_topic_arn = "MOCK-sns-topic-arn-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

dependency "rds_database" {
  config_path = "${get_terragrunt_dir()}/../../../../${local.vars.inputs.rds_vars.inputs.rds_cluster_name}"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    cluster_identifier = "cluster-idnetifier-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  use_default_name = false
  name             = "${dependency.rds_database.outputs.cluster_identifier}-${local.secret_vars.inputs.secret_name}-${local.name}"

  identifiers    = ["lambda.amazonaws.com"]
  principal_type = "Service"

  role_description = "IAM Role used by Lambda function for rotating secret"

  aws_managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]

  # inline policies
  default_inline_template_policies = {
    allow-lambda      = "policy/AllowLambda.json.tpl"
    deny-lambda       = "policy/DenyLambda.json.tpl"
    elastic-benastlak = "policy/APP-NAMEAWSElasticBeanstalk.json.tpl"
  }

  policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id,
    "sns_topic_arn", dependency.sns_topic.outputs.sns_topic_arn,
    "rds_cluster_identifier", dependency.rds_database.outputs.cluster_identifier,
    "rds_secret_name", local.secret_vars.inputs.secret_name
  )
}
