{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyEc2",
            "Action": "ec2:*",
            "Effect": "Deny",
            "Resource": "*",
            "Condition": {
                "StringEqualsIgnoreCase": {
                    "ec2:ResourceTag/DenyAPP-NAME": "true"
                }
            }
        }
    ]
}