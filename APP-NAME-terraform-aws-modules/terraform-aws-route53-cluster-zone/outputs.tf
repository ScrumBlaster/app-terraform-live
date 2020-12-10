output "zone_id" {
  # value       = join("", aws_route53_zone.default.*.zone_id)
  value       = aws_route53_zone.private[0].zone_id
  description = "Route53 DNS Zone ID"
}

output "zone_name" {
  value = replace(join("", aws_route53_zone.private.*.name), "/\\.$/", "")
  # value       = aws_route53_zone.private.name
  description = "Route53 DNS Zone name"
}