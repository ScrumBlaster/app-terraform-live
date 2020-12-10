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
        },
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