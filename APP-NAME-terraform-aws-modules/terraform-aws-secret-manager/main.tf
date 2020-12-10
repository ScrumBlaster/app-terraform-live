terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_secretsmanager_secret" "secret" {
  name_prefix = var.use_default_name ? "${var.environment}-${var.name}-" : var.name
  kms_key_id  = var.kms_secret_key_id
  description = var.secret_description

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.use_default_name ? "${var.environment}-${var.name}" : var.name
    }
  )
}

# NOTE: Configuring rotation causes the secret to rotate once as soon as you store the secret.
resource "aws_secretsmanager_secret_rotation" "example" {
  count = var.enable_secret_rotation && var.rotation_days != null ? 1 : 0

  secret_id           = aws_secretsmanager_secret.secret.id
  rotation_lambda_arn = var.rotation_lambda_arn

  rotation_rules {
    automatically_after_days = var.rotation_days
  }
}

resource "aws_secretsmanager_secret_version" "secret" {

  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = <<EOF
  {
    "username": "${var.mysql_username}",
    "engine": "mysql",
    "dbname": "${var.mysql_dbname}",
    "host": "${var.mysql_host}",
    "password": "${var.mysql_password}",
    "port": ${var.mysql_port},
    "dbInstanceIdentifier": "${var.db_cluster_identifier}"
  }
  EOF

  # version_stages = ["AWSCURRENT", "latest"]

  lifecycle {
    ignore_changes = [secret_string]
  }
}
