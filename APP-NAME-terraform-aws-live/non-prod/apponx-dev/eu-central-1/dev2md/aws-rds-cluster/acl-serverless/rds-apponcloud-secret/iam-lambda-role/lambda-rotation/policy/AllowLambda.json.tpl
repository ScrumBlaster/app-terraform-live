{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "ec2:DetachNetworkInterface",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DeleteNetworkInterface",
                "ec2:CreateNetworkInterface",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAccountAttributes"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowSecretsManagerActions",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:DescribeSecret",
                "secretsmanager:GetSecretValue",
                "secretsmanager:PutSecretValue",
                "secretsmanager:UpdateSecretVersionStage",
                "secretsmanager:CancelRotateSecret"
            ],
            "Resource": [
                "arn:aws:secretsmanager:${aws_region}:${aws_account_id}:secret:${rds_cluster_identifier}-${rds_secret_name}**"
            ]
        },
        {
            "Sid": "GetRandomPassword",
            "Effect": "Allow",
            "Action": "secretsmanager:GetRandomPassword",
            "Resource": "*"
        },
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
        },
        {
            "Sid": "AllowCreateLogGroup",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowElasticbeanstalkLogGroupActions",
            "Effect": "Allow",
            "Action": "logs:*",
            "Resource": "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/*:log-stream:*"
        },
        {
            "Sid": "AllowElasticbeanstalkLogStreamActions",
            "Effect": "Allow",
            "Action": "logs:*",
            "Resource": "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/elasticbeanstalk/*"
        },
        {
            "Sid": "AllowEc2Actions",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeImages",
                "ec2:DescribeInstances",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowIAMActions",
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": [
                "arn:aws:iam::${aws_account_id}:instance-profile/${env}-APP-NAME-ec2-InstanceProfileRole",
                "arn:aws:iam::${aws_account_id}:role/${env}-APP-NAME-ec2"
            ]
        },
        {
            "Action": [
                "s3:Get*",
                "s3:List*",
                "s3:CreateBucket",
                "s3:DeleteObject",
                "s3:PutBucketPolicy",
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:PutObjectVersionAcl"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::elasticbeanstalk-*",
                "arn:aws:s3:::elasticbeanstalk-*/*"
            ]
        },
        {
            "Sid": "AllowSNSActions",
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