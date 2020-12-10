{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyAutoscaling",
            "Action": "autoscaling:*",
            "Effect": "Deny",
            "Resource": "*",
            "Condition": {
                "StringEqualsIgnoreCase": {
                    "autoscaling:ResourceTag/DenyAPP-NAME": "true"
                }
            }
        }
    ]
}