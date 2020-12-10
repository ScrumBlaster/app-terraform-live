{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticbeanstalk:*",
                "elasticloadbalancing:*",
                "autoscaling:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "DenyElasticBeanstalk",
            "Action": [
                "elasticbeanstalk:AbortEnvironmentUpdate",
                "elasticbeanstalk:ApplyEnvironmentManagedAction",
                "elasticbeanstalk:ComposeEnvironments",
                "elasticbeanstalk:CreateEnvironment",
                "elasticbeanstalk:CreatePlatformVersion",
                "elasticbeanstalk:DeleteApplication",
                "elasticbeanstalk:DeleteConfigurationTemplate",
                "elasticbeanstalk:DeleteEnvironmentConfiguration",
                "elasticbeanstalk:DeletePlatformVersion",
                "elasticbeanstalk:RestartAppServer",
                "elasticbeanstalk:SwapEnvironmentCNAMEs",
                "elasticbeanstalk:TerminateEnvironment"
            ],
            "Effect": "Deny",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:AddRoleToInstanceProfile",
                "iam:CreateInstanceProfile",
                "iam:CreateRole"
            ],
            "Resource": [
                "arn:aws:iam::${aws_account_id}:role/aws-elasticbeanstalk*",
                "arn:aws:iam::${aws_account_id}:instance-profile/aws-elasticbeanstalk*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Resource": [
                "arn:aws:iam::${aws_account_id}:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling*"
            ],
            "Condition": {
                "StringLike": {
                    "iam:AWSServiceName": "autoscaling.amazonaws.com"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Resource": [
                "arn:aws:iam::${aws_account_id}:role/aws-service-role/elasticbeanstalk.amazonaws.com/AWSServiceRoleForElasticBeanstalk*"
            ],
            "Condition": {
                "StringLike": {
                    "iam:AWSServiceName": "elasticbeanstalk.amazonaws.com"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Resource": [
                "arn:aws:iam::${aws_account_id}:role/aws-service-role/elasticloadbalancing.amazonaws.com/AWSServiceRoleForElasticLoadBalancing*"
            ],
            "Condition": {
                "StringLike": {
                    "iam:AWSServiceName": "elasticloadbalancing.amazonaws.com"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:AttachRolePolicy"
            ],
            "Resource": "arn:aws:iam::${aws_account_id}:role/aws-elasticbeanstalk*",
            "Condition": {
                "StringLike": {
                    "iam:PolicyArn": [
                        "arn:aws:iam::aws:policy/AWSElasticBeanstalk*",
                        "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalk*"
                    ]
                }
            }
        }
    ]
}