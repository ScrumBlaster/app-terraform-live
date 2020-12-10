output "name" {
  # value       = "${join("", aws_iam_role.default.*.name)}"
  value       = aws_iam_role.default[0].name
  description = "The name of the IAM role created"
}

output "ec2_instance_profile_role_name" {
  # value       = aws_iam_instance_profile.ec2[0].name
  value       = join("", aws_iam_instance_profile.ec2.*.name)
  description = "The name of the IAM role created"
}

output "ec2_instance_profile_role_arn" {
  # value       = aws_iam_instance_profile.ec2[0].arn
  value       = join("", aws_iam_instance_profile.ec2.*.arn)
  description = "The name of the IAM role created"
}

output "id" {
  value       = aws_iam_role.default[0].id
  description = "The stable and unique string identifying the role"
}

output "unique_id" {
  value       = aws_iam_role.default[0].unique_id
  description = "The stable and unique string identifying the role"
}

output "arn" {
  value = aws_iam_role.default[0].arn
  # aws_kms_key.default[0].arn
  description = "The Amazon Resource Name (ARN) specifying the role"
}
