output "id" {
  description = "ID of the Elastic Beanstalk environment."
  value       = aws_elastic_beanstalk_environment.default[0].id
}

output "name" {
  value       = aws_elastic_beanstalk_environment.default[0].name
  description = "Name"
}

output "ec2_security_group_ids" {
  value       = var.eb_ec2_security_group_id
  description = "Security group id"
}

output "elb_dns_name" {
  value       = aws_elastic_beanstalk_environment.default[0].cname
  description = "ELB technical host"
}

output "ec2_instance_profile_role_name" {
  value       = var.ec2_service_role_name
  description = "Instance IAM role name"
}

output "tier" {
  description = "The environment tier specified."
  value       = aws_elastic_beanstalk_environment.default[0].tier
}

output "application" {
  description = "The Elastic Beanstalk Application specified for this environment."
  value       = aws_elastic_beanstalk_environment.default[0].application
}

output "cname" {
  description = "Fully qualified DNS name for the environment."
  value       = aws_elastic_beanstalk_environment.default[0].cname
}

output "autoscaling_groups" {
  description = "The autoscaling groups used by this environment."
  value       = aws_elastic_beanstalk_environment.default[0].autoscaling_groups
}

output "autoscaling_group" {
  description = "The autoscaling groups used by this environment."
  value       = aws_elastic_beanstalk_environment.default[0].autoscaling_groups[0]
}

output "instances" {
  description = "Instances used by this environment."
  value       = aws_elastic_beanstalk_environment.default[0].instances
}

output "launch_configurations" {
  description = "Launch configurations in use by this environment."
  value       = aws_elastic_beanstalk_environment.default[0].launch_configurations
}

output "load_balancers" {
  description = "Elastic Load Balancers in use by this environment."
  value       = aws_elastic_beanstalk_environment.default[0].load_balancers
}
