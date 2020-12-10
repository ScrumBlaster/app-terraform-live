terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_s3_bucket" "default" {
  count = var.enabled ? 1 : 0
  # bucket        = var.id
  bucket        = var.bucket != null ? var.bucket : "${var.environment}-${var.name}"
  acl           = var.acl
  region        = var.region
  force_destroy = var.force_destroy
  policy        = var.bucket_policy_template != null ? data.template_file.default[count.index].rendered : var.policy

  versioning {
    enabled = var.versioning_enabled
  }

  # https://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html
  # https://www.terraform.io/docs/providers/aws/r/s3_bucket.html#enable-default-server-side-encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_arn
      }
    }
  }

  dynamic "lifecycle_rule" {

    for_each = var.s3_lifecycle_rules

    content {
      id      = lifecycle_rule.value.id
      prefix  = lifecycle_rule.value.prefix
      enabled = lifecycle_rule.value.enabled

      abort_incomplete_multipart_upload_days = lifecycle_rule.value.abort_incomplete_multipart_upload_days

      dynamic "expiration" {
        for_each = lifecycle_rule.value.expiration

        content {
          days = expiration.value.days
          date = expiration.value.date

          expired_object_delete_marker = expiration.value.expired_object_delete_marker
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = lifecycle_rule.value.noncurrent_version_expiration

        content {
          days = noncurrent_version_expiration.value.days
        }
      }
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

resource "aws_s3_bucket_public_access_block" "example" {
  count = var.block_public_access ? 1 : 0

  bucket = aws_s3_bucket.default[0].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

module "s3_user" {
  enabled = var.enabled && var.user_enabled ? true : false
  source  = "../terraform-aws-iam-s3-user"
  region  = var.region

  environment                      = var.environment
  stage                            = var.stage
  name                             = var.name
  default_inline_template_policies = var.default_user_inline_template_policies
  policy_template_vars             = var.user_policy_template_vars

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

data "aws_iam_policy_document" "bucket_policy" {
  count = var.enabled && var.allow_encrypted_uploads_only ? 1 : 0

  statement {
    sid       = "DenyIncorrectEncryptionHeader"
    effect    = "Deny"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${join("", aws_s3_bucket.default.*.id)}/*"]

    principals {
      identifiers = ["*"]
      type        = "*"
    }

    condition {
      test     = "StringNotEquals"
      values   = [var.sse_algorithm]
      variable = "s3:x-amz-server-side-encryption"
    }
  }

  statement {
    sid       = "DenyUnEncryptedObjectUploads"
    effect    = "Deny"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.default[0].id}/*"]

    principals {
      identifiers = ["*"]
      type        = "*"
    }

    condition {
      test     = "Null"
      values   = ["true"]
      variable = "s3:x-amz-server-side-encryption"
    }
  }
}

resource "aws_s3_bucket_policy" "default" {
  count  = var.enabled && var.allow_encrypted_uploads_only ? 1 : 0
  bucket = join("", aws_s3_bucket.default.*.id)
  policy = join("", data.aws_iam_policy_document.bucket_policy.*.json)

  depends_on = [aws_s3_bucket.default, data.aws_iam_policy_document.bucket_policy]
}

#---------------------------------------------------------------------------------------------------------------------
# Bucket Template policies

data "template_file" "default" {
  # count    = var.enabled && length(keys(var.default_inline_template_policies)) > 0  ? length(keys(var.default_inline_template_policies)) : 0
  count    = var.enabled && var.bucket_policy_template != null ? 1 : 0
  template = file(var.bucket_policy_template)
  # template = file(element(values(var.default_inline_template_policies), count.index))

  vars = {
    # resource = "${aws_vpc.example.arn}"
    for var, value in var.bucket_policy_template_vars :
    var => value
  }
}

