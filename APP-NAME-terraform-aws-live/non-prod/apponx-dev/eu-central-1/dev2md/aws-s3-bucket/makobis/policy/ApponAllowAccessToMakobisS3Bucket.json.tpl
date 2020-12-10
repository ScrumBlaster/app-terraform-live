{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:DeleteObject",
                "s3:ListMultipartUploadParts",
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObjectVersion",
                "s3:GetBucketLogging",
                "s3:ListBucketVersions",
                "s3:RestoreObject",
                "s3:ListBucket",
                "s3:AbortMultipartUpload",
                "s3:GetObjectTagging",
                "s3:DeleteBucket",
                "s3:ListBucketMultipartUploads",
                "s3:GetBucketVersioning",
                "s3:GetBucketLocation",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::${env}.apponx.de-makobis/*"
        },
        {
            "Sid": "AllowListBuckets",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Sid": "AllowListAllMyBuckets",
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "arn:aws:s3:::*"
        }
    ]
}