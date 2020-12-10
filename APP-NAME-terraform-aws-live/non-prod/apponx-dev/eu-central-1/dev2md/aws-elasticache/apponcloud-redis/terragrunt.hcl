#-----------------------------------------------------------------------------------------------------------------------
terraform {
  source = local.source
}

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

dependencies {
  paths = ["../../aws-elastic-beanstalk/APP-NAME/environment/APP-NAME-ec2-sg"]
}

# Ec2 security group
dependency "eb_APP-NAME_ec2_sg" {
  config_path = "${get_terragrunt_dir()}/../../aws-elastic-beanstalk/APP-NAME/environment/APP-NAME-ec2-sg"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    security_group_id = "MOCK-sg-eb_APP-NAME_ec2_sg-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  #---------------------------------------------------------------------------------------------------------------------
  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-elasticache-redis?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-elasticache-redis?ref=${local.version}"
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

  # VPC
  #---------------------------------------------------------------------------------------------------------------------
  vpc_id  = local.vars.inputs.vpc_vars.inputs.vpc_id
  subnets = local.vars.inputs.vpc_vars.inputs.subnets
  #---------------------------------------------------------------------------------------------------------------------
  name = local.name

  #---------------------------------------------------------------------------------------------------------------------
  # Elasticache cluster
  cluster_dns_name = "master.elasticache"
  instance_type    = "cache.t2.micro" // Performance: 1vCPU 0,555GiB | Network performance: Low to Moderate | Price Per Hour: $0,019
  # instance_type              = "cache.t2.small" // Performance: 1vCPU 1.55GiB | Network performance: Low to Moderate | Price Per Hour: $0.038
  # instance_type              = "cache.t2.medium" // Performance: 2vCPU 3.22GiB | Network performance: Low to Moderate | Price Per Hour: $0.078
  replication_group_id       = "${local.vars.inputs.env_vars.inputs.name}-pc"
  cluster_size               = 1
  default_parameter_group    = "default.redis5.0"
  engine_version             = "5.0.5"
  at_rest_encryption_enabled = true
  # automatic_failover = true // Automatic failover (Not available for T1/T2 instances)
  transit_encryption_enabled = false // it's used in combination with auth_token
  apply_immediately          = true

  #---------------------------------------------------------------------------------------------------------------------
  # Security group rules
  redis_security_group_description = "Security Group of Redis nodes"

  redis_ingress_allowed_security_groups = [
    {
      from_port       = 6379
      to_port         = 6379
      protocol        = "TCP"
      security_groups = ["${dependency.eb_APP-NAME_ec2_sg.outputs.security_group_id}"]
      description     = "Allow traffic from application server (Ec2) security group"
    }
  ]
}
