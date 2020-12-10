data "aws_ssm_parameter" "rds_master_password" {
  name            = "/grafana/GF_DATABASE_PASSWORD"
  with_decryption = "true"
}

data "aws_ssm_parameter" "grafana_admin_password" {
  name            = "/grafana/GF_SECURITY_ADMIN_PASSWORD"
  with_decryption = "true"
}

data "aws_ssm_parameter" "smtp_user_password" {
  name            = "/grafana/GF_SMTP_PASSWORD"
  with_decryption = "true"
}

/*resource "aws_ssm_parameter" "GF_SERVER_ROOT_URL" {
  name  = "/grafana/GF_SERVER_ROOT_URL"
  type  = string
  value = "http://${var.dns_name}"
}

resource "aws_ssm_parameter" "GF_LOG_LEVEL" {
  name  = "/grafana/GF_LOG_LEVEL"
  type  = string
  value = "INFO"
}

resource "aws_ssm_parameter" "GF_INSTALL_PLUGINS" {
  name  = "/grafana/GF_INSTALL_PLUGINS"
  type  = string
  value = "grafana-worldmap-panel,grafana-clock-panel,jdbranham-diagram-panel,natel-plotly-panel"
}

resource "aws_ssm_parameter" "GF_DATABASE_USER" {
  name  = "/grafana/GF_DATABASE_USER"
  type  = string
  value = "root"
}

resource "aws_ssm_parameter" "GF_DATABASE_TYPE" {
  name  = "/grafana/GF_DATABASE_TYPE"
  type  = string
  value = "mysql"
}

resource "aws_ssm_parameter" "GF_DATABASE_HOST" {
  name  = "/grafana/GF_DATABASE_HOST"
  type  = string
  value = "${aws_rds_cluster.grafana.endpoint}:3306"
}*/


