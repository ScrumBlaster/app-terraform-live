output "lambda_arn" {
  value = aws_lambda_function.rotate_secret_mysql.arn
}

output "lambda_sg_ids" {
  value = var.lambda_security_group_ids
}