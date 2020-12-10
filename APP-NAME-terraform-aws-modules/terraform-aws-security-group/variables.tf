variable "region" {
  type = string
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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "ec2_security_group_description" {
  type        = string
  default     = "Allow inbound traffic from provided Security Groups and CIDR blocks"
  description = "Description for Elastic Beanstalk security group"
}

variable "ec2_ingress_allowed_security_groups" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
    description     = string
  }))
  default     = []
  description = "Define allowed security group ids as list of objects that will be used as ingress rule"
}

variable "ec2_ingress_allowed_cidr_blocks" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default     = []
  description = "Define allowed cidr blocks as list of objects that will be used as security group ingress rule"
}

variable "ec2_egress_allowed_security_groups" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
    description     = string
  }))
  default     = []
  description = "Define allowed security group ids as list of objects that will be used as security group egress rule"
}

variable "ec2_egress_allowed_cidr_blocks" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }]
  description = "Define allowed cidr blocks as list of objects that will be used as security group egress rule"
}

variable "vpc_id" {
  description = "ID of the VPC in which to provision the AWS resources"
}

variable "revoke_rules_on_delete" {
  type        = bool
  default     = false
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself."
}

variable "use_default_name" {
  type        = bool
  default     = true
  description = "If true, terraform resource will use default name set in module. Set to flase if you want to name resource differently."
}