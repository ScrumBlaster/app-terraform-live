{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ListAPP-NAMES3Buckets",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": [
                "arn:aws:s3:::${env}.apponx.de-deployment",
                "arn:aws:s3:::${env}.apponx.de-archive",
                "arn:aws:s3:::${env}.apponx.de-filesystem",
                "arn:aws:s3:::${env}.apponx.de-import",
                "arn:aws:s3:::${env}.apponx.de-makobis",
                "arn:aws:s3:::${env}.apponx.de-exported-logs"
            ]
        },
        {
            "Sid": "ManageAPP-NAMES3Buckets",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::${env}.apponx.de-deployment/*",
                "arn:aws:s3:::${env}.apponx.de-archive/*",
                "arn:aws:s3:::${env}.apponx.de-filesystem/*",
                "arn:aws:s3:::${env}.apponx.de-import/*",
                "arn:aws:s3:::${env}.apponx.de-makobis/*",
                "arn:aws:s3:::${env}.apponx.de-exported-logs/*"
            ]
        },
        {
            "Sid": "ViewAPP-NAMES3BucketsInAWSConsole",
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "arn:aws:s3:::*"
        }
    ]
}