#-----------------------------------------------------------------------------------------------------------------------
locals {
  vpc_id   = "vpc-xxxxxxxxxxxx"
  vpc_cidr = "xxx.xxx.xxx.xxx/xx"

  availability_zones = [
    "eu-central-1a",
    "eu-central-1b",
    "eu-central-1c",
  ]

  subnets = [
    "subnet-xxxxx",
    "subnet-xxxxx"
  ]

  private_subnets = [
    "subnet-xxxxxxxx",
    "subnet-xxxxxxxx"
  ]

  public_subnets = [
    "subnet-xxxxxxxx",
    "subnet-xxxxxxxx"
  ]

  route_table_ids = [
    "rtb-xxxxxxxxx",
    "rtb-xxxxxxxxx"
  ]
}

inputs = {
  vpc_id             = local.vpc_id
  vpc_cidr           = local.vpc_cidr
  availability_zones = local.availability_zones
  subnets            = local.subnets
  private_subnets    = local.private_subnets
  public_subnets     = local.public_subnets
  route_table_ids    = local.route_table_ids
}