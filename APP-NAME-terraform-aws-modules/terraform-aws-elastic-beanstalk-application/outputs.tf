output "app_name" {
  value       = aws_elastic_beanstalk_application.default[0].name
  description = "Application name"
}

//output "app_version_arn" {
//  value       = aws_elastic_beanstalk_application_version.default[0].arn
//  description = "Application version arn"
//}