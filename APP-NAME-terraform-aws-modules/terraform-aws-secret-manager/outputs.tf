output "secret_id" {
  value = aws_secretsmanager_secret.secret.id
}

output "secret_version_id" {
  value = aws_secretsmanager_secret_version.secret.id
}

output "version_id" {
  value = aws_secretsmanager_secret_version.secret.version_id
}