# Get's the value of RDS password from secret by providing secret id
data "aws_secretsmanager_secret_version" "rds_password" {
  count     = var.rds_APP-NAME_secret_id != null ? 1 : 0
  secret_id = var.rds_APP-NAME_secret_id
}

# Get's username and password from sengrid smptp mail server from secret by providing its secret id
data "aws_secretsmanager_secret_version" "sengrid_smtp_secret" {
  count     = local.sengrid_smtp_secret_id != null ? 1 : 0
  secret_id = local.sengrid_smtp_secret_id
}

locals {

  #---------------------------------------------------------------------------------------------------------------------
  # Create one list from eb_settings and eb_environment_variables so we can pass this to configuration template
  elastic_beanstalk_settings = concat(local.eb_settings, local.env_vars_custom)
  /*elastic_beanstalk_rds_env_settings         = concat(local.env_vars_rds_list)
  elastic_beanstalk_mail_server_env_settings = concat(local.env_vars_mail_server_list)*/

  #---------------------------------------------------------------------------------------------------------------------
  # Custom Elastic Beanstalk environment variables setting
  env_vars_custom = [
    for key, value in var.env_vars_custom :
    {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = key,
      value     = value
    }
  ]

  #---------------------------------------------------------------------------------------------------------------------
  # Elastic Beanstalk environment (sensitive) variables that we want to get dynamically and not hard code them

  env_vars_mail_server_list = [
    for key, value in local.env_vars_mail_server_map :
    {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = key,
      value     = value
    }
    if key != null && value != null
  ]

  env_vars_mail_server_map = map(
    "MAIL_USER", local.sengrid_smtp_username != null ? local.sengrid_smtp_username : var.sengrid_smtp_username,
    "MAIL_USER_PASSWORD", local.sengrid_smtp_password != null ? local.sengrid_smtp_password : var.sengrid_smtp_password,
  )

  env_vars_rds_list = [
    for key, value in local.env_vars_rds_map :
    {
      namespace = "aws:elasticbeanstalk:application:environment"
      name      = key,
      value     = value
    }
    if key != null && value != null
  ]

  env_vars_rds_map = map(
    "RDS_PASSWORD", local.rds_password
  )

  ###================================== aws:autoscaling:scheduledaction =============================================###

  # Start insatnce(s)
  #---------------------------------------------------------------------------------------------------------------------
  asg_start_eb_settings_list = [
    for key, value in local.asg_start_eb_settings_map :
    {
      namespace = "aws:autoscaling:scheduledaction"
      name      = key,
      value     = value
      resource  = "ScheduledScaleUp"
  } if value != ""]

  asg_start_eb_settings_map = map(
    "StartTime", var.asg_start_schedule_start_time,
    "EndTime", var.asg_start_schedule_end_time,
    "MaxSize", var.asg_start_schedule_max_size,
    "MinSize", var.asg_start_schedule_min_size,
    "DesiredCapacity", var.asg_start_schedule_desired_capacity,
    "Recurrence", var.asg_start_schedule_recurrence,
    "Suspend", var.asg_start_schedule_suspend,
  )

  # Stop instance(s)
  #---------------------------------------------------------------------------------------------------------------------
  asg_stop_eb_settings_list = [
    for key, value in local.asg_stop_eb_settings_map :
    {
      namespace = "aws:autoscaling:scheduledaction"
      name      = key,
      value     = value
      resource  = "ScheduledScaleDown"
  } if value != ""]

  asg_stop_eb_settings_map = map(
    "StartTime", var.asg_stop_schedule_stop_time,
    "EndTime", var.asg_stop_schedule_end_time,
    "MaxSize", var.asg_stop_schedule_max_size,
    "MinSize", var.asg_stop_schedule_min_size,
    "DesiredCapacity", var.asg_stop_schedule_desired_capacity,
    "Recurrence", var.asg_stop_schedule_recurrence,
    "Suspend", var.asg_stop_schedule_suspend,
  )

  ###================================================================================================================###

  sengrid_smtp_secret_id = var.sengrid_smtp_secret_id != null ? var.sengrid_smtp_secret_id : null

  sengrid_smtp_username = (
    var.sengrid_smtp_secret_id != null
    ? jsondecode(data.aws_secretsmanager_secret_version.sengrid_smtp_secret[0].secret_string)["username"]
    : null
  )

  sengrid_smtp_password = (
    var.sengrid_smtp_secret_id != null
    ? jsondecode(data.aws_secretsmanager_secret_version.sengrid_smtp_secret[0].secret_string)["password"]
    : null
  )

  rds_password = (
    var.rds_APP-NAME_secret_id != null
    ? jsondecode(data.aws_secretsmanager_secret_version.rds_password[0].secret_string)["password"]
    : var.rds_password
  )
}