{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ecs:DeleteCluster",
                "ecs:DescribeClusters"
            ],
            "Resource": "arn:aws:ecs:${aws_region}:${aws_account_id}:cluster/*",
            "Effect": "Allow"
        }
    ]
}