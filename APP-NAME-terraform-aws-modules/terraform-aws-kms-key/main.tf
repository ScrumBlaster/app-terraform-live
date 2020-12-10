terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_kms_key" "default" {
  count = var.enabled ? 1 : 0

  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  description             = var.description
  policy                  = data.template_file.default[count.index].rendered != null ? data.template_file.default[count.index].rendered : ""

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

resource "aws_kms_alias" "default" {
  count = var.enabled ? 1 : 0

  name          = coalesce(var.alias, format("alias/%v", var.name))
  target_key_id = aws_kms_key.default[count.index].id
}

#---------------------------------------------------------------------------------------------------------------------
# Template policies

data "template_file" "default" {
  # count    = var.enabled && length(keys(var.default_inline_template_policies)) > 0  ? length(keys(var.default_inline_template_policies)) : 0
  count    = var.enabled && var.policy_template != null ? 1 : 0
  template = file(var.policy_template)
  # template = file(element(values(var.default_inline_template_policies), count.index))

  vars = {
    # resource = "${aws_vpc.example.arn}"
    for var, value in var.policy_template_vars :
    var => value
  }
}

variable "policy_template" {
  type    = string
  default = null
}

variable "policy_template_vars" {
  type    = map(string)
  default = {}
}