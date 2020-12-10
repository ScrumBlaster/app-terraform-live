{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3ListAllMyBuckets",
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:DeleteObject"
            ],
            "Resource": [
                "arn:aws:s3:::${env}.apponx.de-deployment/*",
                "arn:aws:s3:::${env}.apponx.de-filesystem/*",
                "arn:aws:s3:::${env}.apponx.de-archive/*",
                "arn:aws:s3:::${env}.apponx.de-import/*",
                "arn:aws:s3:::${env}.apponx.de-makobis/*"
            ]
        },
        {
            "Sid": "AllowEc2ToGetObjectFromAPP-NAMEPublicKeysS3Bucket",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_account_id}-keys/*"
            ]
        },
        {
			"Sid": "AllowEc2PutObjectInExportedLogsBucket",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::${env}.apponx.de-exported-logs/*"
            ]
        },
        {
            "Sid": "AllowEc2PutObjectInPseudoS3Bucket",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::common-pseudo.apponx.de-mysql/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:List*",
                "s3:GetBucketLocation"
            ],
            "Resource": [
                "arn:aws:s3:::${env}.apponx.de-deployment",
                "arn:aws:s3:::${env}.apponx.de-filesystem",
                "arn:aws:s3:::${env}.apponx.de-archive",
                "arn:aws:s3:::${env}.apponx.de-import",
                "arn:aws:s3:::${env}.apponx.de-makobis",
                "arn:aws:s3:::${aws_account_id}-keys",
                "arn:aws:s3:::${env}.apponx.de-exported-logs",
                "arn:aws:s3:::common-pseudo.apponx.de-mysql"
            ]
        },
        {
            "Sid": "AllowElasticBeanstalkS3Bucket",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:ListBucket",
                "s3:DeleteObject",
                "s3:GetBucketPolicy",
                "s3:CreateBucket"
            ],
            "Resource": "arn:aws:s3:::elasticbeanstalk-${aws_region}-${aws_account_id}/resources/*"
        }
    ]
}