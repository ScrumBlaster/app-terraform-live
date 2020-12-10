#-----------------------------------------------------------------------------------------------------------------------
include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

locals {
  #---------------------------------------------------------------------------------------------------------------------
  # Common stage/account variables
  stage_type = element(split("/", "${path_relative_to_include()}"), 0)
  stage_name = element(split("/", "${path_relative_to_include()}"), 1)
  region     = element(split("/", "${path_relative_to_include()}"), 2)
}

inputs = {
  stage_type = local.stage_type
  stage_name = local.stage_name
  region     = local.region

  # Secret id that contains sengrid mail server username and password (used as environment variable in EB)
  # Secret has been manually created in AWS Secrets Manager.
  sengrid_smtp_secret_id = "arn:aws:secretsmanager:eu-central-1:xxxxxxxx:secret:dev-APP-NAME-elastic-beanstalk-sengrid-smtp-server-sECFFJ"
}