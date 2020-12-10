{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAccessToGetSecretValue",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:GetSecretValue",
                "secretsmanager:DescribeSecret"
            ],
            "Resource": "arn:aws:secretsmanager:${aws_region}:${aws_account_id}:secret:${env}-**-rds-APP-NAME-secret**"
        }
    ]
}