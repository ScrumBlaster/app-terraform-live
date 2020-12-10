{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::${env}.apponx.de-deployment/*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "s3:List*",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::${env}.apponx.de-deployment",
            "Effect": "Allow"
        }
    ]
}