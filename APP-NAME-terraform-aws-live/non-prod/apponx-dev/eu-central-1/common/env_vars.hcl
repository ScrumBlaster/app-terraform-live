#-----------------------------------------------------------------------------------------------------------------------
locals {
  env_name = basename(get_terragrunt_dir())
}
# Common inputs for dev environments

inputs = {
  # Get latest module version
  version = "v0.28.8"

  #---------------------------------------------------------------------------------------------------------------------
  # AWS Certificate Manager Identifiers (Load Balancer SSL certificate ARN). The certificate must be present in AWS Certificate Manager
  pma_aws_cert = ""

  name = local.env_name

}
