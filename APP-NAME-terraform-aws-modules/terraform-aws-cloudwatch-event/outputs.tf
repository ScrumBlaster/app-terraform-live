output "cw_event_rule_name" {
  value = aws_cloudwatch_event_rule.default.id
}

output "cw_event_rule_arn" {
  value = aws_cloudwatch_event_rule.default.arn
}