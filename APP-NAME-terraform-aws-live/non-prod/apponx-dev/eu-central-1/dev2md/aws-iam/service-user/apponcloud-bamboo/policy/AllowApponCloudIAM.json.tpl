{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": [
                "arn:aws:iam::${aws_account_id}:instance-profile/${env}-APP-NAME-ec2-InstanceProfileRole",
                "arn:aws:iam::${aws_account_id}:role/${env}-APP-NAME-ec2"
            ]
        }
    ]
}