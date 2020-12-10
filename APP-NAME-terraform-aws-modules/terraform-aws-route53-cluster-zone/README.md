
# terraform-aws-route53-cluster-zone

Terraform module to easily define consistent cluster domains on `Route53`.

---

## Usage

Define a cluster domain of `foobar.example.com` using a custom naming convention for `zone_name`.
The `zone_name` variable is optional. It defaults to `$${stage}.$${parent_zone_name}`.

```hcl
module "domain" {
  source               = "git::https://github.com/cloudposse/terraform-aws-route53-cluster-zone.git?ref=master"
  namespace            = "eg"
  stage                = "test"
  name                 = "cluster"
  parent_zone_name     = "example.com"
  zone_name            = "$${name}.$${stage}.$${parent_zone_name}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list(string) | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| enabled | Set to false to prevent the module from creating or accessing any resources | bool | `true` | no |
| name | The Name of the application or solution  (e.g. `bastion` or `portal`) | string | - | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | string | - | yes |
| parent_zone_id | ID of the hosted zone to contain this record  (or specify `parent_zone_name`) | string | `` | no |
| parent_zone_name | Name of the hosted zone to contain this record (or specify `parent_zone_id`) | string | `` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map('BusinessUnit','XYZ') | map(string) | `<map>` | no |
| zone_name | Zone name | string | `$$${name}.$$${stage}.$$${parent_zone_name}` | no |

## Outputs

| Name | Description |
|------|-------------|
| fqdn | Fully-qualified domain name |
| parent_zone_id | ID of the hosted zone to contain this record |
| parent_zone_name | Name of the hosted zone to contain this record |
| zone_id | Route53 DNS Zone ID |
| zone_name | Route53 DNS Zone name |