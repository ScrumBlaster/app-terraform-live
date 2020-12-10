{
  "workingDirectory":[""],
  "executionTimeout":["60"],
  "commands":[
    "EC2_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)",
    "YEAR=$(aws ec2 describe-instances --instance-id $${EC2_ID} --region eu-central-1 --query \"Reservations[*].Instances[*].[LaunchTime]\" --output text | awk '{split($0,a,\"-\"); print a[1]}')",
    "MONTH=$(aws ec2 describe-instances --instance-id $${EC2_ID} --region eu-central-1 --query \"Reservations[*].Instances[*].[LaunchTime]\" --output text | awk '{split($0,a,\"-\"); print a[2]}')",
    "DAY=$(aws ec2 describe-instances --instance-id $${EC2_ID} --region eu-central-1 --query \"Reservations[*].Instances[*].[LaunchTime]\" --output text | awk '{split($0,a,\"-\"); print a[3]}' | awk '{split($0,a,\"T\"); print a[1]}')",
    "TIME=$(aws ec2 describe-instances --instance-id $${EC2_ID} --region eu-central-1 --query \"Reservations[*].Instances[*].[LaunchTime]\" --output text | awk '{split($0,a,\"-\"); print a[3]}' | awk '{split($0,a,\"T\"); print a[2]}')",
    "",
    "APP-NAME_LOG_SRC=\"var/log/APP-NAME/dailyfile\"",
    "APP-NAME_S3_LOG_DEST=\"s3://${env}.apponx.de-exported-logs\"",
    "aws s3 sync $${APP-NAME_LOG_SRC} $${APP-NAME_S3_LOG_DEST}/$${APP-NAME_LOG_SRC}/$${YEAR}/$${MONTH}/$${DAY}/$${TIME}/$${EC2_ID}/"
   ]
}