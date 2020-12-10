{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "elasticbeanstalk:DescribeEnvironmentResources",
                "elasticbeanstalk:DescribeEnvironments",
                "elasticbeanstalk:DescribeEvents",
                "elasticbeanstalk:RestartAppServer",
                "elasticbeanstalk:RetrieveEnvironmentInfo",
                "elasticbeanstalk:SwapEnvironmentCNAMEs",
                "elasticbeanstalk:UpdateEnvironment",
                "elasticbeanstalk:RequestEnvironmentInfo"
            ],
            "Resource": "arn:aws:elasticbeanstalk:${aws_region}:${aws_account_id}:environment/*",
            "Effect": "Allow",
            "Sid": "EbsEnvAccess"
        },
        {
            "Action": [
                "elasticbeanstalk:DescribeConfigurationOptions",
                "elasticbeanstalk:DescribeConfigurationSettings",
                "elasticbeanstalk:ListAvailableSolutionStacks",
                "elasticbeanstalk:ValidateConfigurationSettings",
                "elasticbeanstalk:CheckDNSAvailability",
                "elasticbeanstalk:CreateStorageLocation"
            ],
            "Resource": "*",
            "Effect": "Allow",
            "Sid": "EbsGlobalAccess"
        },
        {
            "Action": [
                "elasticbeanstalk:CreateApplicationVersion",
                "elasticbeanstalk:DescribeApplicationVersions",
                "elasticbeanstalk:UpdateApplicationVersion"
            ],
            "Resource": "arn:aws:elasticbeanstalk:${aws_region}:${aws_account_id}:applicationversion/*",
            "Effect": "Allow",
            "Sid": "EbsAppVersionAccess"
        },
        {
            "Action": [
                "elasticbeanstalk:DescribeApplications",
                "elasticbeanstalk:UpdateApplication"
            ],
            "Resource": "arn:aws:elasticbeanstalk:${aws_region}:${aws_account_id}:application/*",
            "Effect": "Allow",
            "Sid": "EbsAppAccess"
        }
    ]
}