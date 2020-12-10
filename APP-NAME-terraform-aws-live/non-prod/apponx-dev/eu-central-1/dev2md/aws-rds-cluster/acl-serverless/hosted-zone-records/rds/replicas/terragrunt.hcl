#-----------------------------------------------------------------------------------------------------------------------
terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

dependencies {
  paths = [
    "${get_terragrunt_dir()}/../../../../../aws-route53/APP-NAME-hosted-zone",
    "${get_terragrunt_dir()}/../../../../${local.vars.inputs.rds_vars.inputs.rds_cluster_name}"
  ]
}

locals {
  # Read variables
  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  #---------------------------------------------------------------------------------------------------------------------
  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-route53-cluster-hostname?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-route53-cluster-hostname?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module


  # get global, common and environment variables


  # get rds cluster identifier
  rds_vars = read_terragrunt_config("${get_terragrunt_dir()}/../../../rds_vars.hcl")

  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())
}

# Route 53 hosted zone
dependency "route_53_hosted_zone" {
  config_path = "${get_terragrunt_dir()}/../../../../../aws-route53/APP-NAME-hosted-zone"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    zone_id = "zone-id-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

# RDS
dependency "rds_cluster" {
  config_path = "${get_terragrunt_dir()}/../../../../${local.vars.inputs.rds_vars.inputs.rds_cluster_name}"

  # I am using mock_outputs for development purposes when I want quick test my module change locally with following command:
  # terragrunt apply --terragrunt-source ../../../modules//app
  # Otherwise it's failing to run (folder/file not found...), set skip_outputs to 'true' when testing
  mock_outputs = {
    reader_endpoint = "zone-id-MOCKED"
  }

  # Set 'skip_outputs' to 'true' when testing module locally
  skip_outputs = "${get_env("TF_VAR_dependency_skip_outputs", "false")}"
}

inputs = {

  enabled = dependency.rds_cluster.outputs.reader_endpoint != "" ? true : false
  #---------------------------------------------------------------------------------------------------------------------
  name    = "${local.name}.${local.vars.inputs.rds_vars.inputs.rds_cluster_name}.rds"
  zone_id = dependency.route_53_hosted_zone.outputs.zone_id
  records = ["${dependency.rds_cluster.outputs.reader_endpoint}"]
  type    = "CNAME"
  ttl     = 300
}
