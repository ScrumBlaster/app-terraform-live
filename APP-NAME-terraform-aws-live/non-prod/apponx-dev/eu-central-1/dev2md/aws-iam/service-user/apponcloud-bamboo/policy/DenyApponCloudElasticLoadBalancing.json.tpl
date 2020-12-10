{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyElasticLoadBalancing",
            "Action": "elasticloadbalancing:*",
            "Effect": "Deny",
            "Resource": "*",
            "Condition": {
                "StringEqualsIgnoreCase": {
                    "elasticloadbalancing:ResourceTag/DenyAPP-NAME": "true"
                }
            }
        }
    ]
}