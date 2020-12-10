{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "autoscaling:SuspendProcesses",
                "autoscaling:ResumeProcesses",
                "autoscaling:UpdateAutoScalingGroup",
                "autoscaling:TerminateInstanceInAutoScalingGroup"
            ],
            "Resource": "arn:aws:autoscaling:${aws_region}:${aws_account_id}:*",
            "Effect": "Allow"
        }
    ]
}