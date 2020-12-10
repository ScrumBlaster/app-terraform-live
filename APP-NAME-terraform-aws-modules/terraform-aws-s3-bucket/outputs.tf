output "bucket_domain_name" {
  value       = var.enabled ? join("", aws_s3_bucket.default.*.bucket_domain_name) : ""
  description = "FQDN of bucket"
}

output "bucket_id" {
  value       = var.enabled ? join("", aws_s3_bucket.default.*.id) : ""
  description = "Bucket Name (aka ID) (constructed using terraform null lable)"
}

output "bucket_arn" {
  value       = var.enabled ? join("", aws_s3_bucket.default.*.arn) : ""
  description = "Bucket ARN"
}

output "enabled" {
  value       = var.enabled
  description = "Is module enabled"
}

output "user_enabled" {
  value       = var.user_enabled
  description = "Is user creation enabled"
}

output "user_name" {
  value       = module.s3_user.user_name
  description = "Normalized IAM user name"
}

output "user_arn" {
  value       = module.s3_user.user_arn
  description = "The ARN assigned by AWS for the user"
}

output "user_unique_id" {
  value       = module.s3_user.user_unique_id
  description = "The user unique ID assigned by AWS"
}