output "alb_dns_name" {
  value       = var.enable_alb ? aws_lb.example[0].dns_name : ""
  description = "The domain name of the load balancer"
}

output "asg_name" {
  #value       = var.is_build_server ? aws_autoscaling_group.build_server[0].name : aws_autoscaling_group.default[0].name
  # https://github.com/hashicorp/terraform/issues/15165
  # value       = var.single_ec2 ? "" : element(compact(concat(aws_autoscaling_group.build_server.*.name, aws_autoscaling_group.default.*.name)), 0)
  value       = var.single_ec2 ? "" : element(compact(concat(aws_autoscaling_group.default.*.name)), 0)
  description = "The name of the Auto Scaling Group"
}

output "alb_security_group_id" {
  value       = var.enable_alb ? aws_security_group.alb[0].id : ""
  description = "The ID of the Security Group attached to the load balancer"
}

output "ec2_security_group_id" {
  value       = aws_security_group.instance.id
  description = "The ID of the Security Group attached to the ec2"
}