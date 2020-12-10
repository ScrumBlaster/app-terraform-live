{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ecs:CreateCluster",
                "ecs:RegisterTaskDefinition"
            ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}