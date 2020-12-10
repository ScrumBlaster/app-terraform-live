#---------------------------------------------------------------------------------------------------------------------
# Locals
#---------------------------------------------------------------------------------------------------------------------
# You can use locals to bind a name to an expression, so you can reuse that expression without having to repeat it
# multiple times (keeping your Terragrunt configuration DRY).
#
# For more info check Terragrunt docs: https://terragrunt.gruntwork.io/docs/features/locals/
locals {
  #---------------------------------------------------------------------------------------------------------------------
  # In README.md under "Understanding terragrunt/terraform built-in functions" there are explanations and examples of
  # built-in Terraform and Terragrunt functions that are being used here.
  #
  # Terraform built-in functions:   https://www.terraform.io/docs/configuration/functions
  # Terragrunt build-in  functions: https://terragrunt.gruntwork.io/docs/reference/built-in-functions/
  #---------------------------------------------------------------------------------------------------------------------

  # Stage Type: non-prod | prod
  stage_type = element(split("/", "${path_relative_to_include()}"), 0)

  # Stage: apponx-dev | apponx-test | apponx-prod
  stage_name = element(split("/", "${path_relative_to_include()}"), 1)

  # AWS Region
  region = element(split("/", "${path_relative_to_include()}"), 2)

  # Environment name
  environment = element(split("/", "${path_relative_to_include()}"), 3)

  # Stack - Defined as: <aws-region>/<environment>/<resource>
  stack = join("/", slice(split("/", "${path_relative_to_include()}"), 2, length(split("/", "${path_relative_to_include()}"))))
  #stack = "${path_relative_to_include()}"

  # Resource name - Returns the name of the folder in which "child" terragrunt.hcl file is located (resource
  # terragrunt.hcl). Resource name can be overwritten in by explicitly declaring the "name" property directly in the
  # resource terragrunt.hcl file.
  name = element("${split("/", "${path_relative_to_include()}")}", element(reverse(range(length(split("/", "${path_relative_to_include()}")))), 0))

  # Get variables set in '<stage-type>/<aws-account/stage-name>/common.hcl' file
  # read_terragrunt_config: https://terragrunt.gruntwork.io/docs/reference/built-in-functions/#read_terragrunt_config
  account_vars = read_terragrunt_config("${get_parent_terragrunt_dir()}/${local.stage_type}/${local.stage_name}/account_vars.hcl")
  #_global_vars = read_terragrunt_config("${get_parent_terragrunt_dir()}/_global_vars.hcl")

  # Extract aws_account_id and aws_iam_role - used to dynamically set terragrunt iam role from above 'account_vars'
  # config.
  # For each stage (dev,test,prod) there is one IAM Role which is used by Terraform to deploy resources/infrastructure.
  # If user or service (Azure Devops Pipeline -> Service Connection) want's to run Terraform commands against any of
  # environments, it's necessary to have right permissions to assume IAM role.
  aws_account_id = local.account_vars.inputs.aws_account_id
  aws_iam_role   = local.account_vars.inputs.aws_iam_role

  # Work with multiple AWS accounts
  # Terragrunt will call the sts assume-role API on your behalf and expose the credentials it gets back as environment
  # variables when running Terraform.
  # https://terragrunt.gruntwork.io/docs/features/work-with-multiple-aws-accounts/
  iam_role = "arn:aws:iam::${local.aws_account_id}:role/${local.aws_iam_role}"

  # All resources created by Elastic Beanstalk will get tag denyAPP-NAME = false
  # All resources NOT created by Elastic Beanstalk will get tag denyAPP-NAME = true
  # This is one way of how to limit APP-NAME service user permissions. Take a look on policies attached to user.
  # In short, this tag means that resources tagged with "denyAPP-NAME = true" will block any action for APP-NAME
  # user. Actions are defined as policies attached to APP-NAME IAM user.
  # The function will take stack value as string and check if string contains "aws-elastic-beanstalk".
  deny_APP-NAME = contains(split("/", "${local.stack}"), "aws-elastic-beanstalk") ? "false" : "true"

  # Set common tags that will be applied to resources as "tags {}" variable

  tags = {
    Terraform      = true
    Stack          = local.stack
    Owner          = local.aws_account_id
    Region         = local.region
    Environment    = local.environment
    Stage-Type     = local.stage_type
    Stage-Name     = local.stage_name
    DenyAPP-NAME = local.deny_APP-NAME
  }

  # Terraform remote state bucket name and region.
  # Should be deprecated in newest infrastructure versions because instead defining dependencies directly in terraform
  # modules we can now define direct dependency in terragrunt.hcl. At the moment it's only being used by
  # "terraform-aws-ssm-module" module.
  terraform_remote_state_bucket        = "${local.stage_name}.terraform-state.eu-central-1"
  terraform_remote_state_bucket_region = local.stack
}

#-----------------------------------------------------------------------------------------------------------------------
# Remote state
#-----------------------------------------------------------------------------------------------------------------------
# Configure Terragrunt to automatically store ".tfstate" files in an S3 bucket
# In each AWS Account (in each stage) there will be one S3 bucket for storing Terraform state files.
# Bucket name will be in form of "${local.vars.inputs.stage_vars.stage_name.name}.terraform-state.eu-central-1" and bucket key will be in form of
# "${local.stack}/terraform.tfstate". The bucket will have "s3_bucket_tags {}" tags.
#
# The code below tells Terraform to store the state for a module in an S3 bucket called
# ${local.vars.inputs.stage_vars.stage_name.name}.terraform-state.eu-central-1 under the path ${local.stack}/terraform.tfstate, and to use a
# DynamoDB table called terraform-locks-eu-central-1 for locking. This is a great feature that every single Terraform
# team uses to collaborate.
#
# For more info check Terragrunt docs: https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#remote_state
remote_state {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "${local.stage_name}.terraform-state.eu-central-1"
    key            = "${local.stack}/terraform.tfstate"
    region         = local.region
    dynamodb_table = "terraform-locks-eu-central-1"
    acl            = "private"

    #tags:
      s3_bucket_tags = {
      Terraform      = "true"
      Region         = local.region
      Stack          = local.stack
      Owner          = local.aws_account_id
      Stage-Type     = local.stage_type
      Stage-Name     = local.stage_name
      DenyAPP-NAME = local.deny_APP-NAME
    }
  }
}

#-----------------------------------------------------------------------------------------------------------------------
# Configuring Terragrunt to assume an IAM role
#-----------------------------------------------------------------------------------------------------------------------
# Terragrunt will resolve the value of the option by first looking for the cli argument, then looking for the
# environment variable, then defaulting to the value specified in the config file. Terragrunt will call the sts
# assume-role API on your behalf and expose the credentials it gets back as environment variables when running Terraform.
#
# For more info check Terragrunt docs: https://terragrunt.gruntwork.io/docs/features/work-with-multiple-aws-accounts/
iam_role = local.iam_role

#-----------------------------------------------------------------------------------------------------------------------
# Inputs
#-----------------------------------------------------------------------------------------------------------------------
# The inputs attribute is a map that is used to specify the input variables and their values to pass in to Terraform.
# Each entry of the map will be passed to Terraform using the environment variable mechanism. This means that each input
# will be set using the form TF_VAR_variablename, with the value in json encoded format. In other words, whenever you
# run a Terragrunt command, Terragrunt will set any inputs you pass in as Terraform environment variables.
#
# For example, with the inputs {} from below, running terragrunt apply is roughly equivalent to:
#
# TF_VAR_aws_account_id=local.aws_account:id \
# TF_VAR_name=local.name \
# TF_VAR_region=local.vars.inputs.stage_vars.inputs.region \
# TF_VAR_tags=local.tags
# terraform apply;
#
# For more info check Terragrunt docs: https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#inputs
inputs = {
  aws_account_id = local.aws_account_id

  # Used by terraform-aws-ssm-module
  terraform_remote_state_bucket        = local.terraform_remote_state_bucket
  terraform_remote_state_bucket_region = local.terraform_remote_state_bucket_region

  # Terraform module variables - common variables that are being used by every module. So instead defining each of those
  # variables for each of the resource that we want to deploy (in child "terragrunt.hcl") we can set it here in parent
  # "terragrunt.hcl" file. Each of these variables can be overwritten directly in child "terragrunt.hcl"
  name        = local.name
  region      = local.region
  environment = local.environment
  tags        = local.tags
}