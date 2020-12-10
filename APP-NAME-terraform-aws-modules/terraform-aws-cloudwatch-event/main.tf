#-----------------------------------------------------------------------------------------------------------------------
# Backend
terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

#-----------------------------------------------------------------------------------------------------------------------
# CloudWatch event rule
resource "aws_cloudwatch_event_rule" "default" {
  is_enabled = var.rule_is_enabled

  name        = "${var.environment}-${var.name}"
  description = var.description

  schedule_expression = var.is_schedule ? var.schedule_expression : ""
  event_pattern       = var.is_schedule ? "" : data.template_file.cw_event_pattern_tmpl[0].rendered

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}

# CloudWatch target (RunCommand)
resource "aws_cloudwatch_event_target" "run_command" {
  target_id = "SSH_RunCommand"
  arn       = "arn:aws:ssm:${var.region}::document/AWS-RunShellScript"
  rule      = aws_cloudwatch_event_rule.default.name
  role_arn  = aws_iam_role.cw_target_iam.arn

  input_transformer {
    input_template = data.template_file.cw_target_input_tmpl.rendered
  }

  run_command_targets {
    key    = "tag:${var.target_tag_key}"
    values = var.target_tag_values
  }
}

#-----------------------------------------------------------------------------------------------------------------------
# Templates

# Event pattern template
data "template_file" "cw_event_pattern_tmpl" {
  count = var.is_schedule ? 0 : 1

  template = file(var.cw_event_pattern_json_tmpl)

  vars = {
    # resource = "${aws_vpc.example.arn}"
    for var, value in var.template_vars :
    var => value
  }
}

# Target input template
data "template_file" "cw_target_input_tmpl" {
  template = file(var.target_input_tmpl_json)

  vars = {
    for var, value in var.template_vars :
    var => value
  }
}

#-----------------------------------------------------------------------------------------------------------------------
# IAM role and policy

resource "aws_iam_role" "cw_target_iam" {
  # name               = "SSMRunCommand"
  name               = "${var.environment}-RunCommand-${var.name}"
  assume_role_policy = data.aws_iam_policy_document.cw_rule_trust.json
}

data "aws_iam_policy_document" "cw_rule_trust" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "cw_rule_policy" {

  name   = "AWS_CW_Events_Invoke_Run_Command"
  policy = data.aws_iam_policy_document.cw_rule_policy_document.json
  role   = aws_iam_role.cw_target_iam.id
}

data "aws_iam_policy_document" "cw_rule_policy_document" {

  statement {
    effect    = "Allow"
    actions   = ["ssm:SendCommand"]
    resources = ["arn:aws:ec2:${var.region}:${var.aws_account_id}:instance/*"]

    condition {
      test     = "StringEquals"
      variable = "ec2:ResourceTag/${var.target_tag_key}"
      values   = var.target_tag_values
    }
  }

  statement {
    effect    = "Allow"
    actions   = ["ssm:SendCommand"]
    resources = ["arn:aws:ssm:${var.region}:*:document/AWS-RunShellScript"]
  }
}