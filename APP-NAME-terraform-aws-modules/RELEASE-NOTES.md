09/09/2020

Version: v0.32.7

Modules affected:

- **terraform-aws-lambda-rotate-secret**

  Lambda function fix. Update resources responsible for creating Lambda function used for rotating secret.

---

08/09/2020

Version: v0.32.5

Modules affected:

- **terraform-aws-s3-bucket**

  We can now create S3 lifecycle rule and set object expiration
  
  What to do about it?
  
  Define variable `s3_lifecycle_rules` inside resource responsible for creating S3 bucket in which you want to apply 
  and set object expiration.
  
  Default value is `s3_lifecycle_rules = []`
  
  Example of how to set `s3_lifecycle_rules` variable that will expire (delete) objects that are older then 90 days:
  
  ````hcl-terraform
  s3_lifecycle_rules = [{
    enabled = true
    id      = "s3_lifecycle_rule"
    prefix  = null

    abort_incomplete_multipart_upload_days = 7

    expiration = [{
      days = 90
      date = null

      expired_object_delete_marker = false
    }]

    noncurrent_version_expiration = [{
      days = 90
    }]

    transition                    = []
    noncurrent_version_transition = []
  }]
  ````
  
  For more info check module `terraform-aws-s3-bucket/variables.tf`

- **terraform-aws-secret-manager**

  Split secret rotation configuration from `resource "aws_secretsmanager_secret" "secret" {}` into 
  `resource "aws_secretsmanager_secret_rotation" "example"` because defining secret rotation and lambda was deprecated  
  for `aws_secretsmanager_secret` resource.

  What to do about it?
  
  Just update resources which are using `terraform-aws-secret-manager` as module source. (`terragrunt plan-apply`)
  
  `<aws-rds-cluster>/<**>/<rds-*-secret>/>secret/terragrunt.hcl>`
  
  For secret that you want to enable rotation, you need to set following:
  
  ````hcl-terraform
  # Specifies the number of days between automatic scheduled rotations of the secret.
  enable_secret_rotation = true
  rotation_days = 1
  ````
  
  You should see in the plan that `null_resource.secret` resource will be destroyed and if secret rotation is enabled, 
  terraform will create new resource `aws_secretsmanager_secret_rotation.example`.
  
- **terraform-aws-elastic-beanstalk-environment**

  1. S3 ELB logs - set object expiration
  
  S3 bucket for storing ELB logs will now automatically create S3 lifecycle rule which will by default expire all bucket 
  objects older than 90 days. In other words, we keep logs for 90 and delete them afterwards.
  
  What to do about it?
  
  If already deployed, just update module version for EB environment module and run `terragrunt plan-apply`. 
  You should see new changes that will be applied to S3 bucket.
  
  2. Rotate secret for application database user
  
  We have also introduced new resource `resource "null_resource" "secret" {}` which is responsible for rotating secret 
  of application database user. Previously this process has been defined in `terraform-aws-secret-manager` module.
  
  In order to rotate secret successfully first we need to pass and set `rotate_secret` bool variable to true. If set to 
  false, which is the default value, the `resource "null_resource" "secret" {}` will not be created at all, meaning 
  rotating secret will not happen. Second if we enable secret rotation we need to pass secret id to module in form of 
  `rotation_lambda_arn` variable. 
  
  Note that this rotation will only happen once immediately after resource `resource "null_resource" "secret" {}` has 
  been created. Main reason is when deploying EB environment for the first time. The secret can be also later rotated by
  recreating `resource "null_resource" "secret" {}` resource, tainting or setting to variable `rotate_secret` to false 
  after which it will be destroyed and then back to true.
  
  What to do about it?
  
  Add following to resource responsible for creating EB environment:
  
  ````hcl-terraform
    # First define dependency block pointing to Lambda function responsible for rotating secret
 
    dependency "rotation_lambda" {
    config_path = "${get_terragrunt_dir()}/../../../aws-rds-cluster/${local.env_vars.inputs.rds_stack}/rds-APP-NAME-secret/lambda-rotate-mysql"
    
    # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
    # terragrunt apply --terragrunt-source ../../../modules//app
    # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
    mock_outputs = {
    lambda_arn = "MOCKED-Lambda-ARN"
    }
    
    # Set 'skip_outputs' to 'true' when testing module locally
    skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
    }  
 
    inputs {
    rotate_secret = true
    rotation_lambda_arn = "<the-ARN-of-Lambda-responsible-for-rotating-application-database-user-secret>"
    
    # Rest of content...
    }
  ````
  Update EB environment.