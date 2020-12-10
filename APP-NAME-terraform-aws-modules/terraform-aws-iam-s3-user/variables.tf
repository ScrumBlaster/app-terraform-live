variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

variable "region" {
  type        = string
  description = "The AWS region used in provider block"
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

variable "name" {
  type        = string
  description = "Application or solution name (e.g. `app`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Destroy even if it has non-Terraform-managed IAM access keys, login profiles or MFA devices"
}

variable "path" {
  type        = string
  default     = "/"
  description = "Path in which to create the user"
}

variable "default_inline_policies" {
  type        = map(string)
  description = "Map of service name as key and a list of ARNs to allow assuming the role as value. e.g. default_inline_policies = {ec2-access = `policy/ec2.json` s3-bucket = `policy/s3.json`}"
  default     = {}
}

variable "policy_template" {
  type    = string
  default = null
}

variable "policy_template_name" {
  type    = string
  default = null
}

variable "policy_template_vars" {
  type    = map(string)
  default = {}
}

variable "default_inline_template_policies" {
  type        = map(string)
  description = "Map of service name as key and a list of ARNs to allow assuming the role as value. e.g. default_inline_policies = {ec2-access = `policy/ec2.json` s3-bucket = `policy/s3.json`}"
  default     = {}
}