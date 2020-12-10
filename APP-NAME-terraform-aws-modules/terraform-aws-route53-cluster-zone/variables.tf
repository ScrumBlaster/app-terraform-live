variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating or accessing any resources"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
}

variable "region" {
  type        = string
  description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee"
}

variable "name" {
  type        = string
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "zone_name" {
  type        = string
  default     = null
  description = "Zone name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to associte hosted zone with"
}

/*variable "parent_zone_id" {
  type        = string
  default     = ""
  description = "ID of the hosted zone to contain this record  (or specify `parent_zone_name`)"
}*/

/*variable "parent_zone_name" {
  type        = string
  default     = ""
  description = "Name of the hosted zone to contain this record (or specify `parent_zone_id`)"
}*/

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map('BusinessUnit','XYZ')"
}
