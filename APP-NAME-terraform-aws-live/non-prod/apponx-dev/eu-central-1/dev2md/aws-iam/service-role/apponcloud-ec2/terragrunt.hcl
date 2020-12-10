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

  instance_profile_role_name = "${local.vars.inputs.env_vars.inputs.name}-${local.name}-InstanceProfileRole"
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  name = local.name

  identifiers                = ["ec2.amazonaws.com", "ssm.amazonaws.com"]
  principal_type             = "Service"
  instance_profile_role      = true
  instance_profile_role_name = local.instance_profile_role_name

  # Attach AWS managed policy
  aws_managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]

  role_description = "APP-NAME IAM Ec2 instance profile role."

  # inline policies
  default_inline_template_policies = {
    cloudwatch-access     = "policy/cloudwatch-access.json.tpl"
    ec2-access            = "policy/ec2-access.json.tpl"
    enable-ssm            = "policy/enable-ssm.json.tpl"
    s3-access             = "policy/s3-access.json.tpl"
    secret-manager-access = "policy/secret-manager-access.json.tpl"
  }

  policy_template_vars = map(
    "env", local.vars.inputs.env_vars.inputs.name,
    "aws_region", local.vars.inputs.stage_vars.inputs.region,
    "aws_account_id", local.vars.inputs.account_vars.inputs.aws_account_id
  )

}
