#-----------------------------------------------------------------------------------------------------------------------terraform {
terraform {
  source = local.source
}

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

dependencies {
  paths = ["../../aws-elastic-beanstalk/APP-NAME/environment"]
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  #---------------------------------------------------------------------------------------------------------------------
  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-cloudwatch-event?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-cloudwatch-event?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

dependency "elastic_beanstalk" {
  config_path = "${get_terragrunt_dir()}/../../aws-elastic-beanstalk/APP-NAME/environment"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    autoscaling_group = "MOCKED-awseb-e-v9cqtuvm6e-stack-AWSEBAutoScalingGroup-14YA6EGC1ONR9-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "true")}"
}

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------

  name        = local.name
  description = "Trigger run command event that will install jq tool needed when fetching secret from Secrets Manager because it's in JSON format"
  is_schedule = false

  #---------------------------------------------------------------------------------------------------------------------
  # Templates

  # Event pattern template - defines event responsible for triggering RunCommand
  cw_event_pattern_json_tmpl = "template/cw-event-pattern.json.tpl"

  # Target input template - defines action (script/commands to run on Ec2)
  target_input_tmpl_json = "template/cw-target-input.json.tpl"

  # Template variables
  template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id,
    "autoscaling_group_name", dependency.elastic_beanstalk.outputs.autoscaling_group
  )

  #---------------------------------------------------------------------------------------------------------------------
  # Targets - We are interested affectig only APP-NAME Ec2 instances (which are created by Elastic Beasntalk stack)

  target_tag_key    = "Stack"
  target_tag_values = ["${local.vars.inputs.stage_vars.inputs.region}/${local.vars.inputs.env_vars.inputs.name}/aws-elastic-beanstalk/APP-NAME/environment"]
}