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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-iam-assumable-service-role?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-iam-assumable-service-role?ref=${local.version}"
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

  principal_type = "Service"
  identifiers    = ["elasticbeanstalk.amazonaws.com"]

  # Example of attaching existing AWS policies
  # aws_managed_policy_arns = ["arn:aws:iam::aws:policy/CloudWatchLogsReadOnlyAccess", "arn:aws:iam::aws:policy/IAMReadOnlyAccess"]

  role_description = "APP-NAME Elastic BEasntak serivce role."

  # inline policies
  # template policies
  default_inline_template_policies = {
    autoscaling-access        = "policy/autoscaling-access.json.tpl"
    autoscaling-access-global = "policy/autoscaling-access-global.json.tpl"
    cfn-access                = "policy/cfn-access.json.tpl"
    cloudwatch-access         = "policy/cloudwatch-access.json.tpl"
    eb-access                 = "policy/eb-access.json.tpl"
    ec2-access                = "policy/ec2-access.json.tpl"
    ecs-access                = "policy/ecs-access.json.tpl"
    ecs-access-global         = "policy/ecs-access-global.json.tpl"
    elb-access                = "policy/elb-access.json.tpl"
    enable-ssm                = "policy/enable-ssm.json.tpl"
    s3-access                 = "policy/s3-access.json.tpl"
    s3-update-access          = "policy/s3-update-access.json.tpl"
    sns-access                = "policy/sns-access.json.tpl"
    sns-permissions           = "policy/sns-permissions.json.tpl"
    sqs-access                = "policy/sqs-access.json.tpl"
  }

  policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id,
    "sns_topic_arn", dependency.sns_topic.outputs.sns_topic_arn
  )
}
