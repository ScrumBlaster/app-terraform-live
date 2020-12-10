{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sns:CreateTopic",
                "sns:GetTopicAttributes",
                "sns:ListSubscriptionsByTopic",
                "sns:Subscribe"
            ],
            "Resource": "arn:aws:sns:${aws_region}:${aws_account_id}:*",
            "Effect": "Allow"
        }
    ]
}