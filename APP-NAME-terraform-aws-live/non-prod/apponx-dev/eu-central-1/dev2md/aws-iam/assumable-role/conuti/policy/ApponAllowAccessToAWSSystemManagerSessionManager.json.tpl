{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowSessionBasedOnResourceTag",
            "Effect": "Allow",
            "Action": [
                "ssm:ResumeSession",
                "ssm:TerminateSession",
                "ssm:StartSession",
                "ssm:GetConnectionStatus"
            ],
            "Resource": "arn:aws:ec2:${aws_region}:${aws_account_id}:instance/i-*",
            "Condition": {
                "StringEquals": {
                    "aws:ResourceTag/${tag_key}": "${tag_value}"
                }
            }
        },
        {
            "Sid": "AllowToDescribePossibleSessionInstances",
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeSessions",
                "ssm:DescribeInstanceProperties"
            ],
            "Resource": "*"
        }
    ]
}