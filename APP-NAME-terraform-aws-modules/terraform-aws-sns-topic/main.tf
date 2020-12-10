terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_sns_topic" "default" {
  name         = var.sns_topic_name
  display_name = var.sns_topic_name

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}