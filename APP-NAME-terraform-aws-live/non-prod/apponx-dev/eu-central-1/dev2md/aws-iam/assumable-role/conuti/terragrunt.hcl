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

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  name = local.name

  principal_type = "AWS"
  identifiers    = ["arn:aws:iam::${local.vars.inputs._global_vars.inputs.aws_root_account_id}:root"] // Allow users from apponx account to assume role

  role_description = "Konuti assumable role"

  aws_managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",           // Provides read only access to Amazon EC2 via the AWS Management Console.
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkReadOnlyAccess", // Provides read only access to AWS Elastic Beanstalk via the AWS Management Console.
    "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess",           // Provides read only access to Amazon RDS via the AWS Management Console.
    # "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"           // Provides full access to the Cloudwatch Logs
  ]

  # inline policies
  default_inline_template_policies = {
    APP-NAME-s3-buckets-access        = "policy/ApponAllowAccessToAPP-NAMES3BucketsPolicy.json.tpl",
    APP-NAME-session-manager-access   = "policy/ApponAllowAccessToAWSSystemManagerSessionManager.json.tpl",
    APP-NAME-secret-manager-access    = "policy/ApponAllowAccessToAWSSecretManager.json.tpl",
    APP-NAME-elastic-beanstalk-access = "policy/ApponAllowAccessToElasticBeanstalk.json.tpl",
  }

  #---------------------------------------------------------------------------------------------------------------------
  # Policy template variables. Note tag_key and tag_value; policy will allow session on resources which are tagged with
  # specific tag and value. In this case tag shoud be "Stack" and value shoud be path to the Elastic Beanstalk evironmnet
  # because we want to enable AWS Session Manager on Ec2 that was created/deployed by Beanstalk.
  policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id,
    "tag_key", "Stack",
    "tag_value", "${local.vars.inputs.stage_vars.inputs.region}/${local.vars.inputs.env_vars.inputs.name}/aws-elastic-beanstalk/APP-NAME/environment"
  )
}