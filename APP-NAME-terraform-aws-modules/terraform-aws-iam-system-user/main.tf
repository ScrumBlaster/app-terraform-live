terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

# Defines a user that should be able to write to you test bucket
resource "aws_iam_user" "default" {
  count         = var.enabled ? 1 : 0
  name          = "${var.environment}-${var.name}"
  path          = var.path
  force_destroy = var.force_destroy

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

#---------------------------------------------------------------------------------------------------------------------
# Template policies

variable "default_inline_template_policies" {
  type        = map(string)
  description = "Map of service name as key and a list of ARNs to allow assuming the role as value. e.g. default_inline_policies = {ec2-access = `policy/ec2.json` s3-bucket = `policy/s3.json`}"
  default     = {}
}

variable "policy_template_vars" {
  type    = map(string)
  default = {}
}

data "template_file" "default" {
  count = var.enabled && length(keys(var.default_inline_template_policies)) > 0 ? length(keys(var.default_inline_template_policies)) : 0
  # template = file(var.policy_template)
  template = file(element(values(var.default_inline_template_policies), count.index))

  vars = {
    for var, value in var.policy_template_vars :
    var => value
  }
}

resource "aws_iam_user_policy" "template_policy" {
  count  = var.enabled && length(keys(var.default_inline_template_policies)) > 0 ? length(keys(var.default_inline_template_policies)) : 0
  name   = element(keys(var.default_inline_template_policies), count.index)
  user   = aws_iam_user.default[0].name
  policy = data.template_file.default[count.index].rendered
}

variable "iam_policy" {
  type    = bool
  default = false
}

variable "customer_managed_template_policies" {
  type        = map(string)
  description = "Map of..."
  default     = {}
}

data "template_file" "customer_managed_policy_template_file" {
  count = var.enabled && length(keys(var.customer_managed_template_policies)) > 0 ? length(keys(var.customer_managed_template_policies)) : 0
  # template = file(var.policy_template)
  template = file(element(values(var.customer_managed_template_policies), count.index))

  vars = {
    for var, value in var.policy_template_vars :
    var => value
  }
}

resource "aws_iam_policy" "customer_managed_template_policy" {
  count  = var.enabled && var.iam_policy && length(keys(var.customer_managed_template_policies)) > 0 ? length(keys(var.customer_managed_template_policies)) : 0
  name   = "${var.environment}-${element(keys(var.customer_managed_template_policies), count.index)}"
  policy = data.template_file.customer_managed_policy_template_file[count.index].rendered
}

resource "aws_iam_user_policy_attachment" "default" {
  count      = var.enabled && var.iam_policy && length(keys(var.customer_managed_template_policies)) > 0 ? length(keys(var.customer_managed_template_policies)) : 0
  user       = aws_iam_user.default[0].name
  policy_arn = aws_iam_policy.customer_managed_template_policy[count.index].arn
}