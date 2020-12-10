{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "logs:DeleteLogGroup"
            ],
            "Resource": "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "logs:CreateLogGroup",
                "logs:PutRetentionPolicy"
            ],
            "Resource": "arn:aws:logs:${aws_region}:${aws_account_id}:*",
            "Effect": "Allow"
        }
    ]
}