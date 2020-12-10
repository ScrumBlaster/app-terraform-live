
variable "region" {
  description = "The AWS region in which to create resources"
  type        = string
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `{ BusinessUnit = \"XYZ\" }`"
}

variable "bucket_id" {
  type        = string
  default     = null
  description = "Bucket Name (aka ID) "
}

variable "key" {
  type        = string
  default     = ""
  description = "(Required) The name of the object once it is in the bucket."
}

variable "content" {
  type        = string
  default     = ""
  description = "(Required unless content or content_base64 is set) The path to a file that will be read and uploaded as raw bytes for the object content."
}

variable "server_side_encryption" {
  type        = string
  default     = "AES256"
  description = "Type of encryptio to use when uploading object to S3"
}

variable "file_list" {
  type = list(string)
  # default     = null
  default     = []
  description = "List of files to uplod to S3 bucket. Example /foo/bar.txt, /bar/foo.txt..."
}

variable "zip_list" {
  type = list(string)
  # default     = null // if it is set to null it can't be used in if expresion to evaluate count etc.
  default     = []
  description = "List of files to uplod to S3 bucket. Example /foo/bar.txt, /bar/foo.txt..."
}

