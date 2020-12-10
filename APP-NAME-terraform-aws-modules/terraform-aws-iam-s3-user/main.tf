terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}


module "s3_user" {
  source = "../terraform-aws-iam-system-user"
  region = var.region

  environment   = var.environment
  stage         = var.stage
  name          = var.name
  tags          = var.tags
  enabled       = var.enabled
  force_destroy = var.force_destroy
  path          = var.path
}

#---------------------------------------------------------------------------------------------------------------------
# Template policies

data "template_file" "default" {
  count = var.enabled && length(keys(var.default_inline_template_policies)) > 0 ? length(keys(var.default_inline_template_policies)) : 0
  # template = file(var.policy_template)
  template = file(element(values(var.default_inline_template_policies), count.index))

  vars = {
    # resource = "${aws_vpc.example.arn}"
    for var, value in var.policy_template_vars :
    var => value
  }
}

resource "aws_iam_user_policy" "template_policy" {
  count  = var.enabled && length(keys(var.default_inline_template_policies)) > 0 ? length(keys(var.default_inline_template_policies)) : 0
  name   = element(keys(var.default_inline_template_policies), count.index)
  policy = data.template_file.default[count.index].rendered
  user   = module.s3_user.user_name
}