variable "region" {
  type        = string
  description = "The AWS region used in provider block"
}

variable "enabled" {
  type        = string
  description = "Set to `false` to prevent the module from creating any resources"
  default     = "true"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name (e.g. `app` or `chamber`)"
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "aws_services" {
  # type        = string
  type        = list(string)
  default     = null
  description = "AWS service that are allowed to perform actions granted on your behalf. Example value: 'ec2.amazonaws.com'"
}

variable "role_description" {
  type        = string
  description = "The description of the IAM role that is visible in the IAM role manager"
  default     = "The description of the IAM role that is visible in the IAM role manager"
}

/*variable "policy_description" {
  type        = string
  description = "The description of the IAM policy that is visible in the IAM policy manager"
  default     = "The description of the IAM policy that is visible in the IAM policy manager"
}*/

variable "max_session_duration" {
  default     = 3600
  description = "The maximum session duration (in seconds) for the role. Can have a value from 1 hour to 12 hours"
}

variable "aws_managed_policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  default     = []
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

variable "instance_profile_role" {
  type        = bool
  default     = false
  description = "If set to true it will create Ec2 instance profile role"
}

variable "instance_profile_role_name" {
  type        = string
  default     = "dev-InstanceProfileRole"
  description = "If set it the name will be used instead using null_label module. Note: There is limit of 64 char in the name"
}

variable "principal_type" {
  type        = string
  default     = null
  description = "Set to true if you want to create assuamable role for principal type AWS (account, user, role...). Opposite from service role."
}

variable "identifiers" {
  type        = list(string)
  default     = null
  description = "Set to true if you want to create assuamable role for principal type AWS (account, user, role...). Opposite from service role."
}

variable "use_default_name" {
  type        = bool
  default     = true
  description = "If true, terraform resource will use default name set in module. Set to flase if you want to name resource differently."
}