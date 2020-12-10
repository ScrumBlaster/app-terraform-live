variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "region" {
  default     = "eu-central-1"
  description = "The primary AWS region"
}

variable "account_id" {
  default = ""
}

variable "aws_account_ids" {
  type        = map(string)
  description = "A mapping of AWS account IDs that have a Grafana role that allows Grafana to access CloudWatch metrics"

  default = {}
}

variable "whitelist_ips" {
  type        = list(string)
  description = "List of whitelisted ip addresses that can access grafana"

  default = ["0.0.0.0/0"]
}

variable "dns_zone" {
  description = "the Route 53 ZoneId"
}

variable "dns_name" {
  description = "The DNS name"
  default     = ""
}

variable "vpc_id" {
  description = "The vpc id where grafana will be deployed"
  default     = ""
}

variable "subnets" {
  description = "the subnets used for the grafana task"
  type        = list(string)
  default     = []
}

variable "lb_subnets" {
  description = "the load balancer subnets"
  type        = list(string)
  default     = []
}

variable "db_subnet_ids" {
  description = "the subnets to launch the Aurora databse"
  type        = list(string)
  default     = []
}

variable "db_instance_type" {
  description = "the instance size for the Aurora database"
  default     = "db.t2.small"
}

variable "image_url" {
  description = "the image url for the grafana image"
  default     = "grafana/grafana"
}

variable "grafana_count" {
  default = "1"
}

variable "grafana_cw_log_group_name" {
  type        = string
  description = "The name of CloudWatch Log group"
  default     = null
}

#---

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

variable "tags" {
  type        = map(string)
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
  default     = {}
}