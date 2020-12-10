#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

dependencies {
  paths = [
    "./rds-APP-NAME-secret/lambda-rotation/lambda-rotate-secret-sg",
    "./rds-master-secret/lambda-rotation/lambda-rotate-secret-sg",
    "../../aws-kms/APP-NAME-rds-key",
    "../../aws-iam/service-role/APP-NAME-rds-monitoring",
    "../../aws-elastic-beanstalk/APP-NAME/environment/APP-NAME-ec2-sg",
    "../../../common/phpmyadmin"
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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-rds-cluster?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-rds-cluster?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  # rds settings and variables
  rds_vars = read_terragrunt_config("${get_terragrunt_dir()}/rds_vars.hcl")

  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

#-----------------------------------------------------------------------------------------------------------------------
# I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
# terragrunt apply --terragrunt-source ../../../modules//app
# Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing

# RDS KMS
dependency "rds_kms_key" {
  config_path = "${get_terragrunt_dir()}/../../aws-kms/APP-NAME-rds-key"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    key_arn = "kms-key-id-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# RDS IAM monitoring role
dependency "iam_rds_monitoring_role" {
  config_path = "${get_terragrunt_dir()}/../../aws-iam/service-role/APP-NAME-rds-monitoring"

  mock_outputs = {
    arn = "arn-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

dependency "phpMyAdmin_ec2" {
  config_path = "${get_terragrunt_dir()}/../../../common/phpmyadmin"

  mock_outputs = {
    ec2_security_group_id = "MOCK-sg-0e0c80183a8f96a03-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# APP-NAME Ec2 security group
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

# Lambda function rotate powecloud secret security group
dependency "lambda_rotate_APP-NAME_secret_sg" {
  config_path = "${get_terragrunt_dir()}/rds-APP-NAME-secret/lambda-rotation/lambda-rotate-secret-sg"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    security_group_id = "lambda-rotate-APP-NAME-secret-sg-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# Lambda function rotate master secret security group
dependency "lambda_rotate_master_secret_sg" {
  config_path = "${get_terragrunt_dir()}/rds-master-secret/lambda-rotation/lambda-rotate-secret-sg"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    security_group_id = "lambda-rotate-master-secret-sg-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

inputs = {
  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  name = local.name

  # VPC
  #---------------------------------------------------------------------------------------------------------------------
  vpc_id             = local.vars.inputs.vpc_vars.inputs.vpc_id
  subnets            = local.vars.inputs.vpc_vars.inputs.subnets
  availability_zones = local.vars.inputs.vpc_vars.inputs.availability_zones

  #---------------------------------------------------------------------------------------------------------------------
  # Dependencies

  kms_key_arn             = dependency.rds_kms_key.outputs.key_arn
  rds_monitoring_role_arn = dependency.iam_rds_monitoring_role.outputs.arn

  #---------------------------------------------------------------------------------------------------------------------
  # RDS
  is_serverless                   = local.vars.inputs.rds_vars.inputs.rds_is_serverless
  snapshot_identifier             = local.vars.inputs.rds_vars.inputs.rds_snapshot_identifier
  cluster_identifier              = local.vars.inputs.rds_vars.inputs.rds_cluster_name
  scaling_configuration           = local.vars.inputs.rds_vars.inputs.rds_scaling_configuration
  instance_type                   = local.vars.inputs.rds_vars.inputs.rds_instance_type
  cluster_size                    = local.vars.inputs.rds_vars.inputs.rds_cluster_size
  engine                          = local.vars.inputs.rds_vars.inputs.rds_engine
  engine_version                  = local.vars.inputs.rds_vars.inputs.rds_engine_version
  db_name                         = local.vars.inputs.rds_vars.inputs.rds_db_name
  db_port                         = local.vars.inputs.rds_vars.inputs.rds_db_port
  admin_user                      = local.vars.inputs.rds_vars.inputs.rds_master_user
  admin_password                  = local.vars.inputs.rds_vars.inputs.rds_master_password
  storage_encrypted               = local.vars.inputs.rds_vars.inputs.rds_storage_encrypted
  deletion_protection             = local.vars.inputs.rds_vars.inputs.rds_deletion_protection
  apply_immediately               = local.vars.inputs.rds_vars.inputs.rds_apply_immediately
  rds_monitoring_interval         = local.vars.inputs.rds_vars.inputs.rds_monitoring_interval
  enabled_cloudwatch_logs_exports = local.vars.inputs.rds_vars.inputs.rds_enabled_cloudwatch_logs_exports
  performance_insights_enabled    = local.vars.inputs.rds_vars.inputs.rds_performance_insights_enabled
  skip_final_snapshot             = local.vars.inputs.rds_vars.inputs.rds_skip_final_snapshot
  copy_tags_to_snapshot           = local.vars.inputs.rds_vars.inputs.rds_copy_tags_to_snapshot
  retention_period                = local.vars.inputs.rds_vars.inputs.rds_backup_retention_period

  # List of DB cluster/instance parameters to apply
  cluster_parameters  = local.vars.inputs.rds_vars.inputs.rds_cluster_parameters
  instance_parameters = local.vars.inputs.rds_vars.inputs.rds_instance_parameters

  #---------------------------------------------------------------------------------------------------------------------
  # Security group

  rds_security_group_description = "Security Group of RDS/Aurora"

  rds_ingress_allowed_security_groups = [
    {
      from_port       = 3306
      to_port         = 3306
      protocol        = "TCP"
      security_groups = ["${dependency.phpMyAdmin_ec2.outputs.ec2_security_group_id}"]
      description     = "Traffic from phpMyAdmin security group"
    },
    {
      from_port       = 3306
      to_port         = 3306
      protocol        = "TCP"
      security_groups = ["${dependency.eb_APP-NAME_ec2_sg.outputs.security_group_id}"]
      description     = "Traffic from APP-NAME Ec2 security group"
    },
    {
      from_port       = 3306
      to_port         = 3306
      protocol        = "TCP"
      security_groups = ["${dependency.lambda_rotate_APP-NAME_secret_sg.outputs.security_group_id}"]
      description     = "Allow Lambda function to perform rotate secret operation for APP-NAME database user"
    },
    {
      from_port       = 3306
      to_port         = 3306
      protocol        = "TCP"
      security_groups = ["${dependency.lambda_rotate_master_secret_sg.outputs.security_group_id}"]
      description     = "Allow Lambda function to perform rotate secret operation for master admin database user"
    },
    # Allow ingress from OpenVPN client security group
    {
      from_port       = 3306
      to_port         = 3306
      protocol        = "TCP"
      security_groups = ["${local.vars.inputs._global_vars.inputs.aws_vpn_client_sg_id}"]
      description     = "Traffic from VPN client security group"
    }
  ]
}