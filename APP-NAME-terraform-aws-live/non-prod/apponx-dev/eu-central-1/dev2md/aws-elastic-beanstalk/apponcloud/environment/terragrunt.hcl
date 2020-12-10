#-----------------------------------------------------------------------------------------------------------------------
terraform {
  source = local.source
}

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

dependencies {
  paths = [
    "../application",
    "../environment/APP-NAME-ec2-sg",
    "../../../aws-elasticache/APP-NAME-redis",
    "../../../aws-iam/service-role/APP-NAME-ec2",
    "../../../aws-iam/service-role/APP-NAME-eb",
    "../../../aws-rds-cluster/${local.vars.inputs.env_vars.inputs.rds_stack}",
    "../../../aws-rds-cluster/${local.vars.inputs.env_vars.inputs.rds_stack}/rds-APP-NAME-secret/secret",
    "../../../aws-route53/APP-NAME-hosted-zone",
    "../../../aws-s3-bucket/makobis",
    "../../../aws-s3-bucket/APP-NAME/archive",
    "../../../aws-s3-bucket/APP-NAME/deployment",
    "../../../aws-s3-bucket/APP-NAME/filesystem",
    "../../../aws-s3-bucket/APP-NAME/import",
    "../../../aws-sns-topic/elastic-beanstalk-notifications",
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
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-elastic-beanstalk-environment?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-elastic-beanstalk-environment?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  # RDS
  rds_vars = read_terragrunt_config("${get_terragrunt_dir()}/../../../aws-rds-cluster/${local.vars.inputs.env_vars.inputs.rds_stack}/rds_vars.hcl")

  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())

  # Load Balancer certificate
  loadbalancer_certificate_arn = local.vars.inputs.env_vars.inputs.APP-NAME_aws_cert_id != "" ? "arn:aws:acm:eu-central-1:${local.vars.inputs.account_vars.inputs.aws_account_id}:certificate/${local.vars.inputs.env_vars.inputs.APP-NAME_aws_cert_id}" : ""
  loadbalancer_ssl_policy      = local.vars.inputs.env_vars.inputs.APP-NAME_aws_cert_id != "" ? "ELBSecurityPolicy-2016-08" : ""
  app_port                     = local.loadbalancer_certificate_arn != "" ? 443 : 80
}

# Application
dependency "application" {
  config_path = "${get_terragrunt_dir()}/../application"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    app_name = "app_name-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# Ec2 security group
dependency "eb_APP-NAME_ec2_sg" {
  config_path = "${get_terragrunt_dir()}/APP-NAME-ec2-sg"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    security_group_id = "MOCK-sg-eb_APP-NAME_ec2_sg-MOCK"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# Elasticache
dependency "elasticache" {
  config_path = "${get_terragrunt_dir()}/../../../aws-elasticache/APP-NAME-redis/hosted-zone-records/elasticache/master"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    hostname = "host-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# S3 Bucket - Filesystem
dependency "filesystem_s3_bucket" {
  config_path = "${get_terragrunt_dir()}/../../../aws-s3-bucket/APP-NAME/filesystem"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    bucket_id = "host-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# RDS
dependency "rds" {
  config_path = "${get_terragrunt_dir()}/../../../aws-rds-cluster/${local.vars.inputs.env_vars.inputs.rds_stack}"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    database_name = "database-name-MOCKED"
    endpoint      = "endpoint-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# RDS hostname
dependency "rds_hostname" {
  config_path = "${get_terragrunt_dir()}/../../../aws-rds-cluster/${local.vars.inputs.env_vars.inputs.rds_stack}/hosted-zone-records/rds/master"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    hostname = "hostname-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# Secret
dependency "rds_APP-NAME_secret" {
  config_path = "${get_terragrunt_dir()}/../../../aws-rds-cluster/${local.vars.inputs.env_vars.inputs.rds_stack}/rds-APP-NAME-secret/secret"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    secret_id = "secret_id-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# Ec2 IAM service role
dependency "iam_ec2_service_role" {
  config_path = "${get_terragrunt_dir()}/../../../aws-iam/service-role/APP-NAME-ec2"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    ec2_instance_profile_role_name = "ec2_instance_profile_role_name-MOCKED"
    id                             = "id-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# EB IAM service role
dependency "iam_eb_service_role" {
  config_path = "${get_terragrunt_dir()}/../../../aws-iam/service-role/APP-NAME-eb"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    name = "name-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
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

dependency "rotation_lambda" {
  config_path = "${get_terragrunt_dir()}/../../../aws-rds-cluster/${local.vars.inputs.env_vars.inputs.rds_stack}/rds-APP-NAME-secret/lambda-rotation"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    lambda_arn = "MOCKED-Lambda-ARN"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

inputs = {
  enabled = true
  #---------------------------------------------------------------------------------------------------------------------

  # VPC
  #---------------------------------------------------------------------------------------------------------------------
  vpc_id  = local.vars.inputs.vpc_vars.inputs.vpc_id
  subnets = local.vars.inputs.vpc_vars.inputs.subnets

  rotate_secret = true
  rotation_lambda_arn = dependency.rotation_lambda.outputs.lambda_arn

  #---------------------------------------------------------------------------------------------------------------------
  name = "APP-NAME"

  # VPC
  #---------------------------------------------------------------------------------------------------------------------
  vpc_id          = local.vars.inputs.vpc_vars.inputs.vpc_id
  private_subnets = local.vars.inputs.vpc_vars.inputs.private_subnets
  public_subnets  = local.vars.inputs.vpc_vars.inputs.public_subnets

  #---------------------------------------------------------------------------------------------------------------------
  # Load Balancer certificates
  # https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html
  loadbalancer_certificate_arn = local.loadbalancer_certificate_arn
  loadbalancer_ssl_policy      = local.loadbalancer_ssl_policy

  #---------------------------------------------------------------------------------------------------------------------
  # Dependencies
  eb_application        = dependency.application.outputs.app_name
  ec2_service_role_id   = dependency.iam_ec2_service_role.outputs.id
  ec2_service_role_name = dependency.iam_ec2_service_role.outputs.ec2_instance_profile_role_name
  eb_service_role_name  = dependency.iam_eb_service_role.outputs.name

  #---------------------------------------------------------------------------------------------------------------------
  # Beanstalk solution stack name
  solution_stack_name = local.vars.inputs.env_vars.inputs.eb_solution_stack_name

  # Amount of memory allocated to the PHP environment
  phpini_memory = local.vars.inputs.env_vars.inputs.phpini_memory

  #---------------------------------------------------------------------------------------------------------------------
  # Enable managed platform updates. When you set this to true, you must also specify a `PreferredStartTime` and `UpdateLevel`
  enable_managed_actions = false // Disable manged updates because APP-NAME is not compatible yet with PHP 7.2, avoid any update errors

  #---------------------------------------------------------------------------------------------------------------------
  # Load Balancer settings
  environment_type              = "LoadBalanced"
  loadbalancer_type             = "application"
  elb_scheme                    = "public"
  cross_zone                    = true
  connection_draining_enabled   = "true"
  connection_draining_timeout   = "30"
  stickiness_enabled            = false   // Disable stickines, otherwise SOAP-Call from external host (customer portal i.e.) to APP-NAME server is rejected for some reason
  stickiness_lb_cookie_duration = "86400" // Lifetime, in seconds, of the sticky session cookies | 86400 = one day

  #---------------------------------------------------------------------------------------------------------------------
  # Beanstalk Environment update settings
  deployment_policy = "RollingWithAdditionalBatch" # RollingWithAdditionalBatch | Immutable | Rolling
  batch_size_type   = "Percentage"
  batch_size        = "100"

  #---------------------------------------------------------------------------------------------------------------------
  # Beanstalk Configuration updates
  rolling_update_enable   = true // If true, enables rolling updates for an environment.
  rolling_update_type     = "Immutable"
  updating_min_in_service = "1" // Minimum count of instances up during update
  updating_max_batch      = "2" // Maximum count of instances up during update

  #---------------------------------------------------------------------------------------------------------------------
  # Healtcheck settings
  application_port             = "80"
  instance_protocol            = "HTTP"
  healthcheck_url              = "/" // "/health" For APP-NAME app
  healthcheck_success_treshold = "Ok"
  ignore_health_check          = true

  #---------------------------------------------------------------------------------------------------------------------
  # Logs and monitoring settings
  enhanced_reporting_enabled = true
  enable_stream_logs         = true
  logs_delete_on_terminate   = true
  logs_retention_in_days     = "30"
  monitoring_interval        = "1"

  #---------------------------------------------------------------------------------------------------------------------
  # Ec2 settings aws:autoscaling:launchconfiguration
  instance_type               = "${get_env("TF_VAR_aws_ec2_instance_type", "${local.vars.inputs.env_vars.inputs.default_ec2_instance_type}")}"
  associate_public_ip_address = "false"
  keypair                     = ""

  #---------------------------------------------------------------------------------------------------------------------
  # EBS settings
  root_volume_size = local.vars.inputs.env_vars.inputs.root_volume_size
  root_volume_type = "gp2"


  #---------------------------------------------------------------------------------------------------------------------
  # Autoscaling settings: aws:autoscaling:trigger
  autoscale_min             = "1"
  autoscale_max             = "1"
  autoscale_breach_duration = "5"
  autoscale_lower_increment = "-1"
  autoscale_lower_bound     = "20"
  autoscale_measure_name    = "CPUUtilization"
  autoscale_period          = "5"
  autoscale_statistic       = "Average"
  autoscale_unit            = "Percent"
  autoscale_upper_increment = "1"
  autoscale_upper_bound     = "80"

  # aws:autoscaling:asg
  as_availability_zones = "Any 3"

  #---------------------------------------------------------------------------------------------------------------------
  # Namespace: aws:autoscaling:scheduledaction
  # Specify start and end times in UTC

  # ScheduledScaleUp
  asg_start_schedule_max_size         = "1"
  asg_start_schedule_min_size         = "1"
  asg_start_schedule_desired_capacity = "1"
  asg_start_schedule_recurrence       = "0 7 * * MON-FRI"
  asg_start_schedule_suspend          = "false" // Set to true to deactivate a recurrent scheduled action temporarily. Valid values true | false

  # ScheduledScaleDown
  asg_stop_schedule_max_size         = "0"
  asg_stop_schedule_min_size         = "0"
  asg_stop_schedule_desired_capacity = "0"
  asg_stop_schedule_recurrence       = "0 16 * * MON-FRI"
  asg_stop_schedule_suspend          = "false" // Set to true to deactivate a recurrent scheduled action temporarily. Valid values true | false

  #---------------------------------------------------------------------------------------------------------------------
  # S3 Load balance logging bucket
  force_destroy = true // Destroy S3 bucket for load balancer logs

  #---------------------------------------------------------------------------------------------------------------------
  # Map of custom Elastic Beanstalk environment variables ToDo: put document with all beanstalk environment in wiki and put here link to wiki

  # Mail server username and password
  sengrid_smtp_secret_id = local.vars.inputs.stage_vars.inputs.sengrid_smtp_secret_id
  # RDS APP-NAME secret id
  rds_APP-NAME_secret_id = dependency.rds_APP-NAME_secret.outputs.secret_id

  env_vars_custom = merge(
    map(
      "PC_HOST", "https://${local.vars.inputs.env_vars.inputs.name}.apponx.de", // APP-NAME host (URL)
      "EC_HOST", "tcp://${dependency.elasticache.outputs.hostname}",
      "IMPORT_S3_BUCKET", "${local.vars.inputs.env_vars.inputs.name}.apponx.de-import",
      "FS_S3_BUCKET", dependency.filesystem_s3_bucket.outputs.bucket_id,
      "RDS_DB_NAME", dependency.rds.outputs.database_name,
      "RDS_HOSTNAME", dependency.rds_hostname.outputs.hostname,
      "RDS_USERNAME", local.vars.inputs.rds_vars.inputs.rds_APP-NAME_user,
      "RDS_STACK", local.vars.inputs.env_vars.inputs.rds_stack,
    ),
    local.vars.inputs.env_vars.inputs.eb_env_vars
  )

  #---------------------------------------------------------------------------------------------------------------------
  # Notifications: SNS topic
  notification_protocol  = "email"
  notification_endpoint  = "marko.dujmovic@appon.net"
  notification_topic_arn = dependency.sns_topic.outputs.sns_topic_arn

  #---------------------------------------------------------------------------------------------------------------------
  # Autoscaling Security group settings

  eb_ec2_security_group_id = dependency.eb_APP-NAME_ec2_sg.outputs.security_group_id

  #---------------------------------------------------------------------------------------------------------------------
  # Load Balancer security group settings
  elb_security_group_description = "Load Balancer manged security group"

  # Load Balancer security group settings
  elb_ingress_allowed_cidr_blocks = [
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.APP-NAME_service_node_nat_gateway_ips}"
      description = "APP-NAME-ServiceNodes-(Tarifeserver)"
    },
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.appon_stuttgart_cidrs}"
      description = "appon-Stuttgart-HTTPS"
    },
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.APP-NAME_gateway_ips}"
      description = "APP-NAME-Gateway-HTTPS"
    },
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.dl_dev_customerdata_service_proxy_ips}"
      description = "Azure - DEV Digital Layer Customerdata Service Proxy"
    },
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.dl_dev_metering_service_proxy_ips}"
      description = "Azure - DEV Digital Layer Metering Service Proxy"
    },
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.dl_dev_APP-NAME_service_proxy_ips}"
      description = "Azure - DEV Digital Layer APP-NAME Service Proxy"
    },
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.k8s_cluster_ip}"
      description = "Kubernetes-Cluster-IP"
    },
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.aws_vpn_client_nat_gateway_ips}"
      description = "Traffic from NAT Gateway - VPN Client AWS Account: ${local.vars.inputs._global_vars.inputs.aws_vpn_client_account_id}"
    },
    {
      from_port   = local.app_port
      to_port     = local.app_port
      protocol    = "TCP"
      cidr_blocks = "${local.vars.inputs._global_vars.inputs.APP-NAME_rlm_service_ip}"
      description = "Traffic from APP-NAME - RLM service: http://rlm-dev.eu-west-1.elasticbeanstalk.com/"
    }
  ]

  elb_egress_allowed_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow outbound traffic"
    }
  ]

  environment_tags = map(
    "RDS_SECRET_ID", dependency.rds_APP-NAME_secret.outputs.secret_id,
    "RDS_STACK", local.vars.inputs.env_vars.inputs.rds_stack
  )
}