locals {

  /*task_definition_template = {
    task_grafana = "task_definitions/grafana.json"
  }*/

  task_definition_variables = map(
    "region", var.region,
    "image_url", var.image_url,
    "log_group_region", var.region,
    "log_group_name", aws_cloudwatch_log_group.grafana.name,
    "GF_SERVER_ROOT_URL", "http://${var.dns_name}",
    "GF_LOG_LEVEL", "INFO",
    "GF_INSTALL_PLUGINS", "grafana-worldmap-panel,grafana-clock-panel,jdbranham-diagram-panel,natel-plotly-panel",
    "GF_DATABASE_USER", "root",
    "GF_DATABASE_TYPE", "mysql",
    "GF_DATABASE_HOST", "${aws_rds_cluster.grafana.endpoint}:3306",
    "GF_DATABASE_PASSWORD", data.aws_ssm_parameter.rds_master_password.arn,
    "GF_SECURITY_ADMIN_PASSWORD", data.aws_ssm_parameter.grafana_admin_password.arn,
    "GF_SMTP_ENABLED", "true",
    "GF_SMTP_HOST", "smtp.sendgrid.net",
    "GF_SMTP_USER", "adminTest",
    "GF_SMTP_PASSWORD", data.aws_ssm_parameter.smtp_user_password.arn
  )
}
