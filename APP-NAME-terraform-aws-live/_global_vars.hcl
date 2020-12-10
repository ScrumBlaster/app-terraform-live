#-----------------------------------------------------------------------------------------------------------------------
# Global inputs - all stage environments

locals {
  aws_vpn_client_account_id        = "xxxxxxxxxxxxxxx"         # The AWS Account ID where AWS VPN Client service is setup.
  aws_vpn_client_security_group_id = "sg-xxxxx" # The security group id that's attached to AWS VPN Client service
}

inputs = {
  # AWS Account IDs
  #---------------------------------------------------------------------------------------------------------------------

  # apponx root account
  aws_root_account_id = "xxxxxxxxxxxxx"

  aws_dev_account_id  = "xxxxxxxxxxxxx"
  aws_prod_account_id = "xxxxxxxxxxxxx"

  # VPN
  #---------------------------------------------------------------------------------------------------------------------

  aws_vpn_client_account_id        = local.aws_vpn_client_account_id
  aws_vpn_client_security_group_id = local.aws_vpn_client_security_group_id

  # AWS VPN Client security group
  # In order to use security group from one AWS Account as ingress rule in another AWS Account, ingress rule should be
  # in the following form: <aws_account_id>/<security_group_id> (https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-security-groups.html).
  # Used as ingress rule in security group from RDS
  aws_vpn_client_sg_id = "${local.aws_vpn_client_account_id}/${local.aws_vpn_client_security_group_id}"

  # NAT Gateway IP from AWS Account where we have VPN Client Service deployed. Used as SG ingress rule in form of IP.
  # Used by application server as ingress rule in Load Balancer security group.
  aws_vpn_client_nat_gateway_ips = ["xxx.xxx.xxx.xxx/xx", "xxx.xxx.xxx.xxx/xx"]

  # IPs
  #---------------------------------------------------------------------------------------------------------------------

  # appon Stuttgart cidr(s)
  appon_stuttgart_cidrs = ["xxx.xxx.xxx.xxx/xx"]

  # APP-NAME Gateways (VPN) - that's why ACL developers can access apponx ACL instances
  APP-NAME_gateway_ips = [
    "xxx.xxx.xxx.xxx/xx",
    "xxx.xxx.xxx.xxx/xx",
    "xxx.xxx.xxx.xxx/xx"
  ]

  # APP-NAME - ServiceNodes (Tarifserver) - NAT gateway IPs where service nodes are placed
  tariff_server_ips                       = ["xxx.xxx.xxx.xxx/xx", "xxx.xxx.xxx.xxx/xx"]
  APP-NAME_service_node_nat_gateway_ips = ["xxx.xxx.xxx.xxx/xx", "xxx.xxx.xxx.xxx/xx", "xxx.xxx.xxx.xxx/xx"] # New service nodes, still not implemented on prod...

  # APP-NAME - RLM service: (link) - NAT Gateway IP from AWS VPC where RLM Service is deployed
  APP-NAME_rlm_service_ip = ["xxx.xxx.xxx.xxx/xx"]

  # Azure -> DEV Digital Layer (DL) Customerdata Service Proxy
  dl_dev_customerdata_service_proxy_ips = [
    "xxx.xxx.xxx.xxx/xx",
    "xxx.xxx.xxx.xxx/xx"
  ]

  # Azure -> DEV Digital Layer (DL) Metering Service Proxy
  dl_dev_metering_service_proxy_ips = [
    "xxx.xxx.xxx.xxx/xx",
    "xxx.xxx.xxx.xxx/xx"
  ]

  # Azure -> DEV Digital Layer (DL) APP-NAME Service Proxy
  dl_dev_APP-NAME_service_proxy_ips = [
    "xxx.xxx.xxx.xxx/xx",
    "xxx.xxx.xxx.xxx/xx"
  ]

  # Azure > Digital Layer (DL) proxy server (test env)
  dl_APP-NAME_proxy_server_ips_test = [
    "xxx.xxx.xxx.xxx/xx",
    "xxx.xxx.xxx.xxx/xx"
  ]

  # Azure > Digital Layer (DL) proxy server (prod env)
  dl_APP-NAME_proxy_server_ips_prod = [
    "xxx.xxx.xxx.xxx/xx",
    "xxx.xxx.xxx.xxx/xx"
  ]

  # Developers kubernetes cluster ip
  k8s_cluster_ip = ["xxx.xxx.xxx.xxx/xx"]
}