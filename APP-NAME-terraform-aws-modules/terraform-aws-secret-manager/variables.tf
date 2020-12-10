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
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
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

variable "secret_description" {
  description = "This field is the description for the secret manager object"
  default     = "secret manager for mysql/aurora"
}

variable "engine" {
  description = "Database engine"
}

variable "mysql_username" {
  description = "The MySQL/Aurora username you chose during RDS creation or another one that you want to rotate"
}

variable "mysql_dbname" {
  description = "The Database name inside your RDS"
}

variable "mysql_host" {
  description = "The RDS endpoint to connect to your database"
}

variable "mysql_password" {
  description = "The password that you want to rotate, this will be changed after the creation"
}

variable "mysql_port" {
  default     = 3306
  description = "In case you don't have your MySQL on default port and you need to change it"
}

variable "db_cluster_identifier" {
  description = "The RDS Identifier in the webconsole"
}

variable "kms_secret_key_id" {
  type        = string
  default     = null
  description = "The id of KMS key used to encrypt secret."
}

variable "rotation_lambda_arn" {
  type        = string
  default     = null
  description = "The ARN of Lambda function used for rotating secret"
}

variable "use_default_name" {
  type        = bool
  default     = true
  description = "If true, terraform resource will use default name set in module. Set to flase if you want to name resource differently."
}

# Define rotation days as list of number so we enable or disable rotation_rules using dynmaic block arguments.
variable "rotation_days" {
  type        = number
  description = "Specifies the number of days between automatic scheduled rotations of the secret. Set to 0 to disable rotation. NOTE: Configuring rotation causes the secret to rotate once as soon as you store the secret. "
  default     = null
}

variable "enable_secret_rotation" {
  type        = bool
  default     = false
  description = "Set to true in order to enable secret rotation. It's used in combination with rotation_days variable."
}