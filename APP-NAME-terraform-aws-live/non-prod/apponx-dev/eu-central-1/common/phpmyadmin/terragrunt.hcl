#-----------------------------------------------------------------------------------------------------------------------

terraform {
  source = local.source
}

include {
  path = find_in_parent_folders("_terragrunt.hcl")
}

locals {

  vars = read_terragrunt_config(find_in_parent_folders("read_vars.hcl"))

  #---------------------------------------------------------------------------------------------------------------------
  # set module version and module source
  version = trimspace(local.vars.inputs.env_vars.inputs.version)
  source = (
    get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-webserver-cluster?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-webserver-cluster?ref=${local.version}"
  )

  #---------------------------------------------------------------------------------------------------------------------
  # constant variables used by module



  #---------------------------------------------------------------------------------------------------------------------
  # uniqe resource name
  name = basename(get_terragrunt_dir())

  # Load Balancer - // https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html
  loadbalancer_certificate_arn = local.vars.inputs.env_vars.inputs.pma_aws_cert != "" ? "arn:aws:acm:eu-central-1:${local.vars.inputs.account_vars.inputs.aws_account_id}:certificate/${local.vars.inputs.env_vars.inputs.pma_aws_cert}" : ""
  app_port                     = local.loadbalancer_certificate_arn != "" ? 443 : 80

}

inputs = {

  enabled = true
  #---------------------------------------------------------------------------------------------------------------------
  # phpmyadmin

  name = "${local.name}-appx"

  enable_alb  = false
  single_ec2  = true
  subnet_type = "private"

  # Set your SSH key for debugging Ec2 instance (you will need to add SSH ingress rule to the SG of Ec2 instance if you
  # want to be able to SSH, it's recommended to create temp SSH rule in AWS Console and to delete it after you are done).
  # If instance is in private subnet and you are using VPN to connect, ingress rule for SSH in Ec2 security group needs
  # to be in form of "<vpn_server_aws_account_id>/<vpn_server_security_group_id>".
  # https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-security-groups.html
  # Don't forget that SSH key with same name should also exists in AWS Console under Ec2 -> Key Pairs
  # key_name = "your_key_name"

  #---------------------------------------------------------------------------------------------------------------------
  # Autoscaling settings
  instance_type      = "t3.micro"
  server_port        = 80
  enable_autoscaling = false // enable autoscaling schedule - scale in and scale out (start/stop instance(s))

  # Ec2 security group ingress
  ec2_ingress_allowed_cidr_blocks = local.vars.inputs._global_vars.inputs.aws_vpn_client_nat_gateway_ips

  #---------------------------------------------------------------------------------------------------------------------
  # Pass the userdata script
  userdata_custom = file("scripts/userdata_custom.sh")

  vpc_id = local.vars.inputs.vpc_vars.inputs.vpc_id
  private_subnets = local.vars.inputs.vpc_vars.inputs.private_subnets
  public_subnets = local.vars.inputs.vpc_vars.inputs.public_subnets
}
