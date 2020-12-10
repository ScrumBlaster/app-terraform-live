{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowDescribeActions",
            "Effect": "Allow",
            "Action": [
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:CreateLogGroup"
            ],
            "Resource": "*"
        },
        {
            "Action": [
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
              "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/${env}-APP-NAME/APP-NAME_core_log:*",
              "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/${env}-APP-NAME/APP-NAME_metric_log:*",
              "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/${env}-APP-NAME/var/log/eb-activity.log:*",
              "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/${env}-APP-NAME/var/log/httpd/access_log:*",
              "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/${env}-APP-NAME/var/log/httpd/error_log:*",
              "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/ssm/*"
             ],
            "Effect": "Allow"
        }
    ]
}