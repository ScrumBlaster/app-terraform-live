variable "region" {
  type        = string
  description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee"
}

variable "eb_environment_name" {
  type        = string
  default     = null
  description = "The name of Elastic Beanstalk environment"
}

variable "aws_run_patch_baseline_cron" {
  default     = null
  type        = string
  description = "Cron expressions for running Ec2 patches -> AWS-RunPatchBaseline"
}

variable "aws_gather_software_inventory_cron" {
  default     = null
  type        = string
  description = "Cron expressions for gathering software inventory -> AWS-GatherSoftwareInventory"
}

variable "aws_update_ssm_agent_cron" {
  default     = null
  type        = string
  description = "Cron expressions for running SSM Agent updates -> AWS-UpdateSSMAgent"
}

#-----------------------------------------------------------------------------------------------------------------------
# Terraform remote state
variable "terraform_remote_state_bucket" {
  description = "The name of the S3 bucket for needed terraform state"
  type        = string
  default     = null
}

variable "aws_elastic_beanstalk_environemnt_name_remote_state_key" {
  description = "The path in the S3 bucket for the Elastic Beanstalk environmemt name Terraform state"
  type        = string
  default     = null
}

variable "terraform_remote_state_bucket_region" {
  type        = string
  default     = ""
  description = "The AWS region of terraform remote state bucket"
}