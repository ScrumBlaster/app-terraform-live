output "id" {
  value       = join("", aws_elasticache_replication_group.default.*.id)
  description = "Redis cluster ID"
}

output "security_group_id" {
  value       = join("", aws_security_group.default.*.id)
  description = "Security group ID"
}

output "port" {
  value       = var.port
  description = "Redis port"
}

output "primary_endpoint_adress" {
  value       = aws_elasticache_replication_group.default[0].primary_endpoint_address
  description = "Redis port"
}

/*output "host" {
  value = coalesce(
    module.dns.hostname,
    join(
      "",
      aws_elasticache_replication_group.default.*.primary_endpoint_address
    )
  )
  description = "Redis host"
}

output "master_host" {
  value       = module.dns.hostname
  description = "DNS name entry of Elasticache master in Route53."
}*/
