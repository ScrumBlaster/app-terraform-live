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
  description = "Name of the application"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "zone_id" {
  type = string
  # default     = ""
  default     = null
  description = "Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the DB master and replicas"
}

variable "security_groups" {
  type        = list(string)
  default     = []
  description = "List of security groups to be allowed to connect to the DB instance"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to create the cluster in (e.g. `vpc-a22222ee`)"
}

variable "subnets" {
  type        = list(string)
  description = "List of VPC subnet IDs"
}

variable "instance_type" {
  type        = string
  default     = "db.t2.small"
  description = "Instance type to use"
}

variable "cluster_size" {
  type        = number
  default     = null
  description = "Number of DB instances to create in the cluster"
}

variable "snapshot_identifier" {
  type        = string
  default     = ""
  description = "Specifies whether or not to create this cluster from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "db_port" {
  type        = number
  default     = 3306
  description = "Database port"
}

variable "admin_user" {
  type        = string
  default     = "admin"
  description = "(Required unless a snapshot_identifier is provided) Username for the master DB user"
}

variable "admin_password" {
  type        = string
  default     = ""
  description = "(Required unless a snapshot_identifier is provided) Password for the master DB user"
}

variable "retention_period" {
  type        = number
  default     = 7
  description = "Number of days to retain backups for"
}

variable "cluster_backup_window" {
  type        = string
  default     = "00:30-01:15"
  description = "Daily time range during which the backups happen"
}

variable "cluster_maintenance_window" {
  type        = string
  default     = "sat:02:00-sat:03:00"
  description = "Weekly time range during which system maintenance can occur, in UTC"
}

variable "instance_maintenance_window" {
  type        = string
  default     = "sat:03:00-sat:04:00"
  description = "Weekly time range during which system maintenance can occur, in UTC"
}

variable "cluster_parameters" {
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))
  default     = []
  description = "List of DB cluster parameters to apply"
}

variable "instance_parameters" {
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))
  default     = []
  description = "List of DB instance parameters to apply"
}

variable "cluster_family" {
  type        = string
  default     = "aurora5.6"
  description = "The family of the DB cluster parameter group"
}

variable "engine" {
  type        = string
  default     = "aurora"
  description = "The name of the database engine to be used for this DB cluster. Valid values: `aurora`, `aurora-mysql`, `aurora-postgresql`"
}

variable "engine_mode" {
  type        = string
  default     = "provisioned"
  description = "The database engine mode. Valid values: `parallelquery`, `provisioned`, `serverless`"
}

variable "engine_version" {
  type        = string
  default     = ""
  description = "The version number of the database engine to use"
}

variable "scaling_configuration" {
  type = list(object({
    auto_pause               = bool
    max_capacity             = number
    min_capacity             = number
    seconds_until_auto_pause = number
  }))
  default     = []
  description = "List of nested attributes with scaling properties. Only valid when `engine_mode` is set to `serverless`"
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "List of CIDR blocks allowed to access the cluster"
}

variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "enable_secret_manager" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "publicly_accessible" {
  type        = bool
  description = "Set to true if you want your cluster to be publicly accessible (such as via QuickSight)"
  default     = false
}

variable "storage_encrypted" {
  type        = bool
  description = "Specifies whether the DB cluster is encrypted. The default is `false` for `provisioned` `engine_mode` and `true` for `serverless` `engine_mode`"
  default     = false
}

variable "kms_key_arn" {
  type        = string
  description = "The ARN for the KMS encryption key. When specifying `kms_key_arn`, `storage_encrypted` needs to be set to `true`"
  default     = null
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  default     = true
}

variable "deletion_protection" {
  type        = bool
  description = "If the DB instance should have deletion protection enabled"
  default     = false
}

variable "apply_immediately" {
  type        = bool
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window"
  default     = true
}

variable "iam_database_authentication_enabled" {
  type        = bool
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  default     = false
}

variable "rds_monitoring_interval" {
  type        = number
  description = "Interval in seconds that metrics are collected, 0 to disable (values can only be 0, 1, 5, 10, 15, 30, 60)"
  default     = 0
}

variable "rds_monitoring_role_arn" {
  type        = string
  default     = null
  description = "The ARN for the IAM role that can send monitoring metrics to CloudWatch Logs"
}

variable "replication_source_identifier" {
  type        = string
  description = "ARN of a source DB cluster or DB instance if this DB cluster is to be created as a Read Replica"
  default     = ""
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to cloudwatch. The following log types are supported: audit, error, general, slowquery"
  default     = []
}

variable "performance_insights_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable Performance Insights"
}

variable "performance_insights_kms_key_id" {
  type        = string
  default     = ""
  description = "The ARN for the KMS key to encrypt Performance Insights data. When specifying `performance_insights_kms_key_id`, `performance_insights_enabled` needs to be set to true"
}

variable "autoscaling_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable cluster autoscaling"
}

variable "autoscaling_policy_type" {
  type        = string
  default     = "TargetTrackingScaling"
  description = "Autoscaling policy type. `TargetTrackingScaling` and `StepScaling` are supported"
}

variable "autoscaling_target_metrics" {
  type        = string
  default     = "RDSReaderAverageCPUUtilization"
  description = "The metrics type to use. If this value isn't provided the default is CPU utilization"
}

variable "autoscaling_target_value" {
  type        = number
  default     = 75
  description = "The target value to scale with respect to target metrics"
}

variable "autoscaling_scale_in_cooldown" {
  type        = number
  default     = 300
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling down activity can start. Default is 300s"
}

variable "autoscaling_scale_out_cooldown" {
  type        = number
  default     = 300
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling up activity can start. Default is 300s"
}

variable "autoscaling_min_capacity" {
  type        = number
  default     = 1
  description = "Minimum number of instances to be maintained by the autoscaler"
}

variable "autoscaling_max_capacity" {
  type        = number
  default     = 5
  description = "Maximum number of instances to be maintained by the autoscaler"
}

/*variable "instance_availability_zone" {
  type        = string
  default     = ""
  description = "Optional parameter to place cluster instances in a specific availability zone. If left empty, will place randomly"
}*/

variable "availability_zones" {
  type        = list(string)
  default     = []
  description = "Optional parameter to place cluster instances in a specific availability zone. If left empty, will place randomly"
}

/*variable "aws_azs" {
  type        = list(string)
  default     = null
  description = "Optional parameter to place cluster instances in a specific availability zone. If left empty, will place randomly"
}*/

variable "cluster_dns_name" {
  type        = string
  description = "Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `master.var.name`"
  default     = ""
}

variable "reader_dns_name" {
  type        = string
  description = "Name of the reader endpoint CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `replicas.var.name`"
  default     = ""
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "Copy all Cluster tags to snapshots. Default is false"
  default     = false
}

variable "rds_security_group_description" {
  type        = string
  description = "The description of RDS security group"
  default     = "Allow inbound traffic from Security Groups and CIDRs"
}

variable "rds_ingress_allowed_security_groups" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
    description     = string
  }))
  default     = []
  description = "Define allowed security group ids as list of objects that will be used as ingress rule defined for Autoscaling Launch Configuration security group."
}

variable "rds_ingress_allowed_cidr_blocks" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default     = []
  description = "Define allowed cidr blocks as list of objects that will be used as ingress rule defined in Autoscaling Launch Configuration security group."
}

variable "rds_egress_allowed_security_groups" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    security_groups = list(string)
  }))
  default     = []
  description = "Define allowed security group ids as list of objects that will be used as egress rule defined in Autoscaling Launch Configuration security group."
}

variable "rds_egress_allowed_cidr_blocks" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
  description = "Define allowed cidr blocks as list of objects that will be used as egress rule defined for Autoscaling Launch Configuration security group."
}

variable "eb_env_id" {
  description = "Elastic Benastalk environment id. "
  type        = string
  default     = null
}

variable "option_name_rds_password" {
  description = "Elastic Beanstalk option name for database password environment variable (Namespace=aws:elasticbeanstalk:application:environment,OptionName=$OPTION_NAME_RDS_PASSWORD,Value=$RDS_PASSWORD)"
  type        = string
  default     = null
}

#-----------------------------------------------------------------------------------------------------------------------
# Aurora Serverless:
#
# - local.cluster_instance_count needs to be set to '0'; Because serverless is not like cluster that we can manage,
#   there are no cluster instances
# - Because there are no cluster instances we can't define also the following properties (define them as empty string ""):
#     - cluster_backup_window       = ""
#     - cluster_maintenance_window  = ""
#     - nstance_maintenance_window  = ""
#
# - we need to set scaling_configuration variable in case of going serverless

variable "is_serverless" {
  type        = bool
  default     = false
  description = "If set to true: variable 'engine_mode' will be set to 'serverless' (Aurora Serverless) | variable 'cluster_size' will be set to '0'"
}

variable "auto_minor_version_upgrade" {
  type        = bool
  default     = true
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default true."
}

variable "backtrack_window" {
  type        = number
  default     = 0
  description = "Only available for aurora engine currently. The target backtrack window, in seconds. To disable backtracking, set this value to 0. Defaults to 0. Must be between 0 and 259200"
}