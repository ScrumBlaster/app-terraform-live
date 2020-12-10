{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ec2:Describe*",
                "ec2:Authorize*",
                "ec2:Revoke*"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}