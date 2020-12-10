variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "region" {
  type        = string
  description = "The AWS region used in provider block"
}

variable "app_name" {
  type        = string
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
}

variable "description" {
  default     = ""
  description = "Description"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}

variable "eb_service_role" {
  type        = string
  default     = null
  description = "The ARN of an IAM service role under which the application version is deleted. Elastic Beanstalk must have permission to assume this role."
}

variable "app_version_max_count" {
  type        = string
  default     = null
  description = "The maximum number of application versions to retain"
}

variable "app_version_delete_source_from_s3" {
  type        = string
  default     = null
  description = "Set to true to delete a version's source bundle from S3 when the application version is deleted."
}

# Deploy custom app
variable "deploy_custom_app" {
  type        = bool
  default     = false
  description = "Set to true wether to deploy custom app from S3 bucket"
}

variable "app_version_name" {
  type        = string
  default     = "app-custom-deployment"
  description = "A unique name for the this Application Version"
}

variable "app_version_description" {
  type        = string
  default     = "Short description of the Application Version."
  description = "Short description of the Application Version."
}

variable "app_version_bucket" {
  type        = string
  default     = null
  description = "(Required) S3 bucket that contains the Application Version source bundle."
}

variable "app_version_key" {
  type        = string
  default     = null
  description = "(Required) S3 object that is the Application Version source bundle."
}

variable "app_version_force_delete" {
  type        = bool
  default     = false
  description = "(Optional) On delete, force an Application Version to be deleted when it may be in use by multiple Elastic Beanstalk Environments."
}