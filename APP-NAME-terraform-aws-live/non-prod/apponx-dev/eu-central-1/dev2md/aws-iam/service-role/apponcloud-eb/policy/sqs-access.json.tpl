{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "sqs:GetQueueAttributes",
                "sqs:GetQueueUrl"
            ],
            "Resource": "arn:aws:sns:${aws_region}:${aws_account_id}:*",
            "Effect": "Allow"
        }
    ]
}