terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_route53_zone" "private" {
  count = var.enabled ? 1 : 0
  # name  = join("", data.template_file.zone_name.*.rendered)
  name          = var.zone_name == null ? "${var.environment}-${var.name}" : var.zone_name
  force_destroy = var.force_destroy

  vpc {
    vpc_id = var.vpc_id
  }

  lifecycle {
    ignore_changes = [vpc]
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.environment}-${var.name}"
    }
  )
}