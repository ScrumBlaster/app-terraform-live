# terraform-aws-elastic-beanstalk-application

Terraform module to provision AWS Elastic Beanstalk application

---

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| description | Description | string | `` | no |
| app_name | The Name of the application or solution  (e.g. `bastion` or `portal`) | string | - | yes |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')`) | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| app_name | Application name |

## Resources

Resource: aws_elastic_beanstalk_application_version
- https://www.terraform.io/docs/providers/aws/r/elastic_beanstalk_application_version.html