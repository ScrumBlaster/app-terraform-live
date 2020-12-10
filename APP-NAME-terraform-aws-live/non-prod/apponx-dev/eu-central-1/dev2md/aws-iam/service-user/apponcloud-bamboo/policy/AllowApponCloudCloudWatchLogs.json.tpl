{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowCreateLogGroup",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowElasticbeanstalkLogGroupActions",
            "Effect": "Allow",
            "Action": "logs:*",
            "Resource": "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/*:log-stream:*"
        },
        {
            "Sid": "AllowElasticbeanstalkLogStreamActions",
            "Effect": "Allow",
            "Action": "logs:*",
            "Resource": "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/*"
        }
    ]
}