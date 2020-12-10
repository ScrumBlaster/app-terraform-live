output "enabled" {
  value       = var.enabled
  description = "Is module enabled"
}

output "file_object_key_ids" {
  # value       = var.enabled ? join("", aws_s3_bucket_object.default.*.id) : ""
  value       = aws_s3_bucket_object.file.*.id
  description = "The key id of single object (file)"
}

output "zip_object_key_ids" {
  # value       = var.enabled ? join("", aws_s3_bucket_object.default.*.id) : ""
  value       = aws_s3_bucket_object.zip.*.id
  description = "The key id of single object (file)"
}