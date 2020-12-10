#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

dependencies {
  paths = [
    "../../../aws-sns-topic/elastic-beanstalk-notifications"
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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-iam-system-user?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-iam-system-user?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

# SNS topic
dependency "sns_topic" {
  config_path = "${get_terragrunt_dir()}/../../../aws-sns-topic/elastic-beanstalk-notifications"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    sns_topic_arn = "MOCK-sns-topic-arn-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  name = local.name

  #---------------------------------------------------------------------------------------------------------------------
  # Customer managed policy
  iam_policy = true

  policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id,
    "sns_topic_arn", dependency.sns_topic.outputs.sns_topic_arn
  )

  customer_managed_template_policies = {
    allow-APP-NAME-cloudformation       = "policy/AllowAPP-NAMECloudFormation.json.tpl"
    allow-APP-NAME-cloudwatch-logs      = "policy/AllowAPP-NAMECloudWatchLogs.json.tpl"
    allow-APP-NAME-ec2                  = "policy/AllowAPP-NAMEEc2.json.tpl"
    allow-APP-NAME-iam                  = "policy/AllowAPP-NAMEIAM.json.tpl"
    allow-APP-NAME-s3                   = "policy/AllowAPP-NAMES3.json.tpl"
    allow-APP-NAME-sns                  = "policy/AllowAPP-NAMESNS.json.tpl"
    deny-APP-NAME-autosclaing           = "policy/DenyAPP-NAMEAutoscaling.json.tpl"
    deny-APP-NAME-ec2                   = "policy/DenyAPP-NAMEEc2.json.tpl"
    deny-APP-NAME-elastic-loadbalancing = "policy/DenyAPP-NAMEElasticLoadBalancing.json.tpl"
    APP-NAME-elastic-beanstalk          = "policy/APP-NAMEAWSElasticBeanstalk.json.tpl"
  }
}
