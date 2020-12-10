{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "sns:ListSubscriptionsByTopic",
                "sns:Publish",
                "sns:GetTopicAttributes",
                "sns:Subscribe"
            ],
            "Resource": [
                "${sns_topic_arn}"
            ]
        }
    ]
}