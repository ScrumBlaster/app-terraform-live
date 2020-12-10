{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "KeyAdministration",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "arn:aws:iam::${aws_account_id}:role/system_admin_role"
                ]
            },
            "Action": [
                "kms:Create*",
                "kms:Describe*",
                "kms:Enable*",
                "kms:List*",
                "kms:Put*",
                "kms:Update*",
                "kms:Revoke*",
                "kms:Disable*",
                "kms:Get*",
                "kms:Delete*",
                "kms:ScheduleKeyDeletion",
                "kms:CancelKeyDeletion",
                "kms:TagResource",
                "kms:UntagResource"
            ],
            "Resource": "*"
        },
        {
            "Sid": "KeyUse",
            "Effect": "Allow",
            "Principal": {
                "Service": "rds.amazonaws.com"
            },
            "Action": [
                "kms:Encrypt",
                "kms:Decrypt",
                "kms:ReEncrypt*",
                "kms:GenerateDataKey*",
                "kms:DescribeKey"
            ],
            "Resource": "arn:aws:rds:${aws_region}:${aws_account_id}:db:${env}-*"
        }
    ]
}