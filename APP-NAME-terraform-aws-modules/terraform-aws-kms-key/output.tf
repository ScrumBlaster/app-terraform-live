output "key_arn" {
  value       = aws_kms_key.default[0].arn
  description = "Key ARN"
}

output "key_id" {
  value       = aws_kms_key.default[0].key_id
  description = "Key ID"
}

output "alias_arn" {
  value       = aws_kms_alias.default[0].arn
  description = "Alias ARN"
}

output "alias_name" {
  value       = aws_kms_alias.default[0].name
  description = "Alias name"
}
