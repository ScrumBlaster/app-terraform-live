terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

data "aws_iam_policy_document" "assume_role" {
  # count = var.enabled && var.principal_type == "AWS" ? 1 : 0
  count = var.enabled ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = var.principal_type
      identifiers = var.identifiers
    }
  }
}

resource "aws_iam_role" "default" {
  count                = var.enabled == "true" ? 1 : 0
  name                 = var.use_default_name ? "${var.environment}-${var.name}" : var.name
  assume_role_policy   = data.aws_iam_policy_document.assume_role[count.index].json
  description          = var.role_description
  max_session_duration = var.max_session_duration

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

resource "aws_iam_instance_profile" "ec2" {
  count = var.instance_profile_role == true ? 1 : 0
  name  = var.instance_profile_role_name != null ? var.instance_profile_role_name : "${var.name}-InstanceProfileRole"
  role  = aws_iam_role.default[0].name
}

# Attach additional AWS managed policies
resource "aws_iam_role_policy_attachment" "default" {
  count = var.enabled && length(var.aws_managed_policy_arns) > 0 ? length(var.aws_managed_policy_arns) : 0

  role       = aws_iam_role.default[0].name
  policy_arn = element(var.aws_managed_policy_arns, count.index)
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

resource "aws_iam_role_policy" "template_policy" {
  count = var.enabled && length(keys(var.default_inline_template_policies)) > 0 ? length(keys(var.default_inline_template_policies)) : 0
  # name   = var.policy_template_name != null ? var.policy_template_name : "${var.name}-template-policy"
  name   = element(keys(var.default_inline_template_policies), count.index)
  role   = aws_iam_role.default[0].name
  policy = data.template_file.default[count.index].rendered
}