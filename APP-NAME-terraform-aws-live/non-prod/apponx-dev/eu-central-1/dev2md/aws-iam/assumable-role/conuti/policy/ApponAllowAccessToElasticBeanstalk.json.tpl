{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticbeanstalk:Check*",
                "elasticbeanstalk:Describe*",
                "elasticbeanstalk:List*",
                "elasticbeanstalk:RequestEnvironmentInfo",
                "elasticbeanstalk:RetrieveEnvironmentInfo",
                "ec2:Describe*",
                "elasticloadbalancing:Describe*",
                "autoscaling:Describe*",
                "cloudwatch:Describe*",
                "cloudwatch:List*",
                "cloudwatch:Get*",
                "s3:Get*",
                "s3:List*",
                "sns:Get*",
                "sns:List*",
                "rds:Describe*",
                "cloudformation:Describe*",
                "cloudformation:Get*",
                "cloudformation:List*",
                "cloudformation:Validate*",
                "cloudformation:Estimate*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "elasticbeanstalk:*"
            ],
            "Resource": [
                "arn:aws:elasticbeanstalk:${aws_region}:${aws_account_id}:environment/*",
                "arn:aws:elasticbeanstalk:${aws_region}:${aws_account_id}:application/*"
            ]
        },
        {
            "Action": [
                "s3:GetObject"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::elasticbeanstalk-*/*"
            ]
        },
        {
            "Action": [
                "s3:CreateBucket",
                "s3:DeleteObject",
                "s3:GetBucketPolicy",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:PutBucketPolicy",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::elasticbeanstalk-*",
                "arn:aws:s3:::elasticbeanstalk-*/*"
            ]
        },
        {
            "Action": [
                "cloudformation:*"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:cloudformation:${aws_region}:${aws_account_id}:stack/awseb-*"
            ]
        },
        {
            "Action": [
                "autoscaling:*",
                "ec2:*"
            ],
            "Effect": "Allow",
            "Resource": [
                "*"
            ]
        },
        {
            "Action": [
                "logs:*"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/*"
            ]
        }
    ]
}