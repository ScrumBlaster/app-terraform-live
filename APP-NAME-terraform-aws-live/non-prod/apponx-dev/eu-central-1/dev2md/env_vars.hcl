#-----------------------------------------------------------------------------------------------------------------------
locals {
  env_name = basename(get_terragrunt_dir())
}

inputs = {

  name = local.env_name
  # Source: Modules - set either version ("vX.Y.Z") or specific git branch ("dev", "feat-branch", "fix", etc...)
  version = "marko"

  # Elastic Beanstalk
  #---------------------------------------------------------------------------------------------------------------------
  # Elastic Beanstalk - aws-elastic-beanstalk/APP-NAME/environment/terragrunt.hcl

  eb_solution_stack_name    = "64bit Amazon Linux 2018.03 v2.9.9 running PHP 7.1" # Check for available Elastic Beanstalk soulution stacks: aws --region eu-central-1 elasticbeanstalk list-available-solution-stacks | grep 7.1
  phpini_memory             = "128M"                                              # Amount of memory allocated to the PHP environment
  rds_stack                 = "acl-serverless"                                    # RDS - which RDS stack will Elastic Beasntalk use - <environment>/aws/rds-cluster/<rds_stack>
  APP-NAME_aws_cert_id    = ""                                                  # AWS Certificate Manager Identifiers (Load Balancer SSL certificate ARN). The certificate must be present in AWS Certificate Manager. If there is no certificate to apply leave eampty string.
  default_ec2_instance_type = "t3.micro"                                          # Or set as environment variable: export TF_VAR_aws_ec2_instance_type=
  root_volume_size          = "16"                                                # Ec2 instance EBS volume size

  # Elastic Beanstalk Umgebungsvariablen - for more info checkout docs/aws-elastic-beanstalk
  # Map of Elastic Beanstalk environment variables that will be merged with other dependency EB environemnt variables -> env_vars_custom
  eb_env_vars = map(
    "DEBUG_DEV", "1",
    "DEBUG", "1",
    "IS_DEV", "1",
    "CW_C_LEVEL", "INFO",
    "CW_M_LEVEL", "INFO",
    "DAILY_C_LEVEL", "INFO",
    "ENVIRONMENT_NAME", "TEST001", # Environment name that will be set in APP-NAME so it knows which Digital Layer (DL) environment to use and communicate with. If left empty it defaults to prod
    "FS_DEFAULT", "s3",
    "FS_INITIAL", "s3",
    "IS_LIVE", "0", // Produktivsystem on/off
    "AR_DEFAULT", "endia",
    "AR_S3_BUCKET", "archive",
    "VENDOR_MODULES", "announcement,revenue,kwk",
    "RDS_PORT", "3306",
    "PC_PRIVILEGED_SUBNETS", "[\\\"10.1.0.243/32\\/21\\\"]", // Superadmin feature - Expects as JSON-Array
    "SA_STRICT", "0",                                        // Force superadminlogin with keys
    "SA_STRICT_PREP", "1",                                   // Enable creation of Superadmin users/keys (zugrifschlüsel)
    "SOFT_MAINTENANCE", "0",                                 // Disable all user login except for SUPERADMIN user
    "MAIL_SERVER", "smtp.sendgrid.net",
    "MAIL_SERVER_PORT", "587",
    "MAIL_USER_ADDRESS", "noreply@appon-cloud.de",
    "MAIL_USER_NAME", "APP-NAME Mailing"
  )
}
