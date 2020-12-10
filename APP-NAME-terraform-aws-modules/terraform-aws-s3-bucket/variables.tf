variable "region" {
  type        = string
  description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "bucket" {
  type        = string
  description = "Unique name of S3 bucket"
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `{ BusinessUnit = \"XYZ\" }`"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "The canned ACL to apply. We recommend `private` to avoid exposing sensitive information"
}

variable "policy" {
  type        = string
  default     = ""
  description = "A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "A boolean string that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
}

variable "versioning_enabled" {
  type        = bool
  default     = false
  description = "A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket"
}

variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`"
}

variable "kms_master_key_arn" {
  type        = string
  default     = ""
  description = "The AWS KMS master key ID used for the `SSE-KMS` encryption. This can only be used when you set the value of `sse_algorithm` as `aws:kms`. The default aws/s3 AWS KMS master key is used if this element is absent while the `sse_algorithm` is `aws:kms`"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
}

variable "user_enabled" {
  type        = bool
  default     = false
  description = "Set to `true` to create an IAM user with permission to access the bucket"
}

variable "allowed_bucket_actions" {
  type        = list(string)
  default     = ["s3:PutObject", "s3:PutObjectAcl", "s3:GetObject", "s3:DeleteObject", "s3:ListBucket", "s3:ListBucketMultipartUploads", "s3:GetBucketLocation", "s3:AbortMultipartUpload"]
  description = "List of actions the user is permitted to perform on the S3 bucket"
}

variable "allow_encrypted_uploads_only" {
  type        = bool
  default     = false
  description = "Set to `true` to prevent uploads of unencrypted objects to S3 bucket"
}

variable "default_user_inline_template_policies" {
  type        = map(string)
  description = "Map of service name as key and a list of ARNs to allow assuming the role as value. e.g. default_inline_policies = {ec2-access = `policy/ec2.json` s3-bucket = `policy/s3.json`}"
  default     = {}
}

variable "user_policy_template_vars" {
  type    = map(string)
  default = {}
}

variable "default_bucket_inline_template_policies" {
  type        = map(string)
  description = "Map of service name as key and a list of ARNs to allow assuming the role as value. e.g. default_inline_policies = {ec2-access = `policy/ec2.json` s3-bucket = `policy/s3.json`}"
  default     = {}
}

variable "bucket_policy_template" {
  type    = string
  default = null
}

variable "bucket_policy_template_vars" {
  type    = map(string)
  default = {}
}

variable "block_public_access" {
  type        = bool
  default     = false
  description = "Manages S3 bucket-level Public Access Block configuration."
}

variable "s3_lifecycle_rules" {
  type = list(object({
    enabled = bool # (Required) Specifies lifecycle rule status

    id     = string # (Optional) Unique identifier for the rule.
    prefix = string #  (Optional) Object key prefix identifying one or more objects to which the rule applies. Set to "null" in order to apply to whole bucket

    abort_incomplete_multipart_upload_days = number # (Optional) Specifies the number of days after initiating a multipart upload when the multipart upload must be completed.

    expiration = list(object({
      days = number # (Optional) Specifies the date after which you want the corresponding action to take effect.
      date = string # (Optional) Specifies the number of days after object creation when the specific rule action takes effect.

      expired_object_delete_marker = bool # On a versioned bucket (versioning-enabled or versioning-suspended bucket), you can add this element in the lifecycle configuration to direct Amazon S3 to delete expired object delete markers.
    }))

    noncurrent_version_expiration = list(object({
      days = number # (Required) Specifies the number of days noncurrent object versions expire.
    }))

    transition = list(object({
      days          = number # (Optional) Specifies the date after which you want the corresponding action to take effect.
      date          = string # (Optional) Specifies the number of days after object creation when the specific rule action takes effect.
      storage_class = string # (Required) Specifies the Amazon S3 storage class to which you want the object to transition. Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE.
    }))

    noncurrent_version_transition = list(object({
      days          = number # (Required) Specifies the number of days noncurrent object versions transition.
      storage_class = string #  (Required) Specifies the Amazon S3 storage class to which you want the noncurrent object versions to transition. Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE.
    }))
  }))

  default = []

  /*default = [{
    enabled = true
    id      = "s3_lifecycle_rule"
    prefix  = null

    abort_incomplete_multipart_upload_days = 7

    expiration = [{
      days = 90
      date = null

      expired_object_delete_marker = false
    }]

    noncurrent_version_expiration = [{
      days = 90
    }]

    transition                    = []
    noncurrent_version_transition = []
  }]*/
}