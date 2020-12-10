terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

#-----------------------------------------------------------------------------------------------------------------------
# Terraform null label module designed to generate consistent names and tags for resources. Use terraform-null-label to
# implement a strict naming convention.

resource "aws_s3_bucket_object" "zip" {
  count = var.enabled && length(var.zip_list) > 0 ? length(var.zip_list) : 0

  bucket = var.bucket_id
  key    = "${format(dirname(var.zip_list[count.index]))}/${basename(var.zip_list[count.index])}"
  # content                = var.zip_list[count.index]
  source                 = var.zip_list[count.index]
  server_side_encryption = var.server_side_encryption
}

resource "aws_s3_bucket_object" "file" {
  count = var.enabled && length(var.file_list) > 0 ? length(var.file_list) : 0

  bucket                 = var.bucket_id
  key                    = "${format(dirname(var.file_list[count.index]))}/${basename(var.file_list[count.index])}"
  content                = file(var.file_list[count.index])
  server_side_encryption = var.server_side_encryption
}