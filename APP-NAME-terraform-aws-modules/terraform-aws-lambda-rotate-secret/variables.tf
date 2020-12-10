variable "region" {
  type        = string
  description = "The AWS region used in provider block"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-pro Ad', 'UAT'"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `{ BusinessUnit = \"XYZ\" }`"
}

variable "use_default_name" {
  type        = bool
  default     = true
  description = "If true, terraform resource will use default name set in module. Set to flase if you want to name resource differently."
}

variable "iam_lambda_rotation_arn" {
  type        = string
  default     = null
  description = "The ARN of IAM role whic will lambda function use"
}

variable "subnets" {
  type        = list(string)
  description = "The subnets where the Lambda Function will be run"
}

variable "filename" { default = "rotate-secret-mysql" }

variable "lambda_function_timeout" {
  type        = number
  default     = 900
  description = "Lambda function timeout in seconds"
}

variable "elastic_beanstalk_environment_id" {
  type        = string
  default     = null
  description = "The id of Elastic Beanstalk environment. After secret has been rotated, EB environment will be updated."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "The id of VPC"
}

variable "lambda_security_group_ids" {
  type        = list(string)
  default     = null
  description = "List of security group ids to attach to lambda function"
}

variable "lambda_test_mode" {
  type        = bool
  default     = false
  description = "When enabled, lambda_function_test.py will be used."
}

variable "enable_automatic_rotation" {
  type        = bool
  default     = false
  description = "Set to true if you want to enable automatic rotation after rotating secret. Set to false if you want to disable automatic rotation after rotating secret"
}