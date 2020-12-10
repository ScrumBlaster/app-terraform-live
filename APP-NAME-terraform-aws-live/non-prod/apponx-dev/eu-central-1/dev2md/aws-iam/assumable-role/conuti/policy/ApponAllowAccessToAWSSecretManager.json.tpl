{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ReadAndListActionsKMS",
            "Effect": "Allow",
            "Action": [
                "kms:ListKeys",
                "kms:ListAliases",
                "kms:ListKeyPolicies",
                "kms:ListRetirableGrants",
                "kms:ListResourceTags",
                "kms:ListGrants"
            ],
            "Resource": "*"
        },
        {
            "Sid": "KMS",
            "Effect": "Allow",
            "Action": [
                "kms:DescribeCustomKeyStores",
                "kms:Decrypt",
                "kms:GetKeyPolicy",
                "kms:GetParametersForImport",
                "kms:Encrypt",
                "kms:GetKeyRotationStatus",
                "kms:DescribeKey"
            ],
            "Resource": "*"
        },
        {
            "Sid": "ReadAndListActionsSecretManager",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:DescribeSecret",
                "secretsmanager:ListSecretVersionIds",
                "secretsmanager:ListSecrets"
            ],
            "Resource": "*"
        },
        {
            "Sid": "SecretManager",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:GetRandomPassword",
                "secretsmanager:GetResourcePolicy",
                "secretsmanager:GetSecretValue",
                "secretsmanager:GetResourcePolicy",
                "secretsmanager:GetSecretValue"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:ResourceTag/Stack": "${aws_region}/${env}/aws-rds-cluster/*"
                }
            }
        }
    ]
}