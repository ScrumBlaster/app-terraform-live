#-----------------------------------------------------------------------------------------------------------------------
terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  #---------------------------------------------------------------------------------------------------------------------
  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-security-group?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-security-group?ref=${local.version}"
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

inputs = {
  enabled = true
  #---------------------------------------------------------------------------------------------------------------------

  # VPC
  #---------------------------------------------------------------------------------------------------------------------
  vpc_id  = local.vars.inputs.vpc_vars.inputs.vpc_id
  subnets = local.vars.inputs.vpc_vars.inputs.subnets

  name = "${local.vars.inputs.rds_vars.inputs.rds_cluster_name}-${local.secret_vars.inputs.secret_name}-Lambda"
  #---------------------------------------------------------------------------------------------------------------------

  # VPC
  #---------------------------------------------------------------------------------------------------------------------
  vpc_id  = local.vars.inputs.vpc_vars.inputs.vpc_id

  ec2_security_group_description = "Security group for Lambda function responsible for rotating secret"

  revoke_rules_on_delete = true

  # Allow SSH for JumpServer security group as ingress
  ec2_egress_allowed_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all egrees"
    }
  ]
}