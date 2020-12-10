#-----------------------------------------------------------------------------------------------------------------------

include {
  path = "${find_in_parent_folders("_terragrunt.hcl")}"
}

locals {
  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())

  #-----------------------------------------------------------------------------------------------------------------------
  # RDS settings
  rds_is_serverless          = true # Select database type: serverless | RDS
  rds_cluster_instance_count = 1    # Default number of instances created in RDS cluster in case of non-serverless database [type: number]

  # If serverless, we must define and apply scaling configuration
  rds_scaling_configuration = (
    local.rds_is_serverless
    ? [{
      auto_pause               = true
      max_capacity             = 8
      min_capacity             = 1
      seconds_until_auto_pause = 300
    }]
    : []
  )
}

inputs = {
  rds_snapshot_identifier   = get_env("RDS_SNAPSHOT_IDENTIFIER", "arn:aws:rds:eu-central-1:951624267188:cluster-snapshot:rds-md-snapshot") # Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot.
  rds_cluster_name          = local.name
  rds_is_serverless         = local.rds_is_serverless                                        # RDS type: serverless | RDS
  rds_scaling_configuration = local.rds_scaling_configuration                                # If serverless, we must define and apply scaling configuration
  rds_instance_type         = "db.t3.micro"                                                  # RDS instance type (in case of non-serverless database)
  rds_cluster_size          = local.rds_is_serverless ? 0 : local.rds_cluster_instance_count # Default number of instances created in RDS cluster (in case of non-serverless database) [type: number]
  rds_db_name               = "APP-NAME"                                                   # Always use 'APP-NAME' as database name
  rds_engine                = "aurora"
  rds_engine_version        = "5.6.10a"
  rds_db_port               = "3306"

  # Initial RDS master username and master password
  rds_master_user     = "admin"
  rds_master_password = "linux253"

  # Initial APP-NAME application database user
  rds_APP-NAME_user     = "APP-NAME"
  rds_APP-NAME_password = "APP-NAME-xXx"

  rds_storage_encrypted               = true               # Specifies whether the DB cluster is encrypted (KMS)
  rds_deletion_protection             = false              # If the DB Cluster should have deletion protection enabled (set to true as safety mechanism for prod environment)
  rds_apply_immediately               = true               # Specifies whether any cluster modifications are applied immediately, or during the next maintenance window (set to false in prod stage)
  rds_monitoring_interval             = 60                 # The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance.
  rds_enabled_cloudwatch_logs_exports = ["error", "audit"] # List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace
  rds_performance_insights_enabled    = false              # Enable RDS performance insights (make sense in prod for example)
  rds_skip_final_snapshot             = false              # Default is true. Determines whether a final DB snapshot is created before the DB cluster is deleted
  rds_copy_tags_to_snapshot           = true               #  Copy all Instance tags to snapshots. Default is false
  rds_backup_retention_period         = 14                 # The days to retain backups for. Must be between 0 and 35

  rds_cluster_parameters = [
    {
      name         = "server_audit_logging"
      value        = "1"
      apply_method = "pending-reboot"
    },
    {
      name         = "server_audit_events"
      value        = "connect,query_dcl"
      apply_method = "pending-reboot"
    },
    {
      name         = "max_allowed_packet"
      value        = "64000000" // in bytes = 64MB - Recommend value from AWS docu - https://aws.amazon.com/blogs/database/best-practices-for-configuring-parameters-for-amazon-rds-for-mysql-part-3-parameters-related-to-security-operational-manageability-and-connectivity-timeout/
      apply_method = "immediate"
    }
  ]

  rds_instance_parameters = [
    {
      name         = "aurora_lab_mode"
      value        = "0"
      apply_method = "pending-reboot"
    },
    {
      name         = "max_allowed_packet"
      value        = "64000000" // in bytes = 64MB - Recommend value from AWS docu - https://aws.amazon.com/blogs/database/best-practices-for-configuring-parameters-for-amazon-rds-for-mysql-part-3-parameters-related-to-security-operational-manageability-and-connectivity-timeout/
      apply_method = "immediate"
    }
  ]
}
