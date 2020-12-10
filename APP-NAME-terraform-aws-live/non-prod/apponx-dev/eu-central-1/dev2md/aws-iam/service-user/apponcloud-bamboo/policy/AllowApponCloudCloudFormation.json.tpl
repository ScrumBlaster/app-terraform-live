{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowCloudFormationToListStacks",
            "Action": [
                "cloudformation:ListStacks",
                "cloudformation:ListStackResources",
                "cloudformation:ValidateTemplate"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Sid": "AllowCloudFormationToReadAndWriteForSpecificStack",
            "Action": [
                "cloudformation:CancelUpdateStack",
                "cloudformation:ContinueUpdateRollback",
                "cloudformation:CreateStack",
                "cloudformation:DeleteStack",
                "cloudformation:DescribeStacks",
                "cloudformation:DescribeStackEvents",
                "cloudformation:DescribeStackResource",
                "cloudformation:DescribeStackResources",
                "cloudformation:GetStackPolicy",
                "cloudformation:GetTemplate",
                "cloudformation:SignalResource",
                "cloudformation:UpdateStack"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:cloudformation:${aws_region}:${aws_account_id}:stack/awseb-**"
        }
    ]
}