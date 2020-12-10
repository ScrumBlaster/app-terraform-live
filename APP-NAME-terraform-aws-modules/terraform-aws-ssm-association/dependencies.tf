#-----------------------------------------------------------------------------------------------------------------------
# Module dependencies

# ToDo: Use dependencies via terragrunt depdnecy {}
#-----------------------------------------------------------------------------------------------------------------------
# Elastic Beanstalk environment name
data "terraform_remote_state" "aws_elastic_beanstalk_environemnt_name" {
  # count = var.storage_encrypted == true ? 1 : 0
  count = var.eb_environment_name == null ? 1 : 0
  # count = 0

  backend = "s3"

  config = {
    bucket = var.terraform_remote_state_bucket
    key    = var.aws_elastic_beanstalk_environemnt_name_remote_state_key
    region = var.terraform_remote_state_bucket_region
  }
}