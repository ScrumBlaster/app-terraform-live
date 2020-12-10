{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${s3-bucket-name}/*",
                "arn:aws:s3:::${s3-bucket-name}"
            ]
        }
    ]
}