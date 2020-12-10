variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "region" {
  type        = string
  description = "The AWS region used in provider block"
}

variable "aws_account_id" {
  type        = number
  default     = null
  description = "The AWS account id used in defining IAM role and policies"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "description" {
  type        = string
  default     = ""
  description = "Short description of the Cloudwatch rule"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}

#-----------------------------------------------------------------------------------------------------------------------

variable "rule_is_enabled" {
  type        = bool
  default     = true
  description = "Enable or disble the CW rule"
}

variable "cw_event_pattern_json_tmpl" {
  type        = string
  default     = null
  description = "The path to the CloudWatch event pattern JSON file"
}

variable "cw_event_pattern_tmpl_json_vars" {
  type        = map(string)
  default     = {}
  description = "Template variables defined as map"
}

variable "template_vars" {
  type        = map(string)
  default     = {}
  description = "Template variables defined as map"
}

variable "target_input_tmpl_json" {
  type        = string
  default     = null
  description = "Path to the target input template file."
}

variable "target_input_tmpl_json_vars" {
  type        = string
  default     = null
  description = "Target input template file variables"
}

variable "is_schedule" {
  type        = bool
  default     = false
  description = "If set to true use schedule expression, else if set to false event_pattern must be defined."
}

variable "schedule_expression" {
  type        = string
  default     = ""
  description = "Required, if event_pattern isn't specified) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes)"
}

variable "target_tag_key" {
  type        = string
  default     = null
  description = "Can be only tag:tag-key"
}

variable "target_tag_values" {
  type        = list(string)
  default     = null
  description = "Values is a list of tag values"
}