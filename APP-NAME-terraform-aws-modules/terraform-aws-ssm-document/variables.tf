variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
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

variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "ssm_document_name" {
  type        = string
  default     = "Terraform-AWSSSMDocument"
  description = "(Required) The name of the document."
}

variable "ssm_document_type" {
  type        = string
  default     = "Command"
  description = "(Required) The type of the document. Valid document types include: Automation, Command, Package, Policy, and Session"
}

variable "ssm_document_target_type" {
  type        = string
  default     = "/AWS::EC2::Instance"
  description = "(Optional) The target type which defines the kinds of resources the document can run on. For example, /AWS::EC2::Instance. For a list of valid resource types, see AWS Resource Types Reference (http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html)"
}

variable "ssm_document_document_format" {
  type        = string
  default     = "JSON"
  description = "(Optional, defaults to JSON) The format of the document. Valid document types include: JSON and YAML"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}

variable "ssm_document_tmpl_file" {
  type        = string
  default     = null
  description = "The path to the SSM Document template file"
}

variable "template_vars" {
  type        = map(string)
  default     = {}
  description = "Template variables defined as map"
}

variable "account_ids" {
  type        = string
  default     = null
  description = "The AWS user accounts that should have access to the document. The account IDs can either be a group of account IDs or All."
}

variable "share_document_permissions_type" {
  type        = string
  default     = null
  description = "The permission type for the document. The permission type can be Share."
}