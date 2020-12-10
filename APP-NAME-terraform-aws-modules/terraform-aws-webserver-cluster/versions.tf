#-----------------------------------------------------------------------------------------------------------------------
# Specifying a Required Terraform Version - https://www.terraform.io/docs/configuration/terraform.html

# The required_version setting can be used to constrain which versions of the Terraform CLI can be used with your
# configuration. If the running version of Terraform doesn't match the constraints specified, Terraform will produce an
# error and exit without taking any further actions.

# Use Terraform version constraints in a collaborative environment to ensure that everyone is using a specific Terraform
# version, or using at least a minimum Terraform version that has behavior expected by the configuration.

# The required_version setting applies only to the version of Terraform CLI.

# The value for required_version is a string containing a comma-separated list of constraints. Each constraint is an
# operator followed by a version number, such as > 0.12.0. The following constraint operators are allowed:

# = (or no operator): exact version equality

# !=: version not equal

# >, >=, <, <=: version comparison, where "greater than" is a larger version number

# ~>: pessimistic constraint operator, constraining both the oldest and newest version allowed. For example, ~> 0.9 is
# equivalent to >= 0.9, < 1.0, and ~> 0.8.4, is equivalent to >= 0.8.4, < 0.9

# Providers are plugins released on a separate rhythm from Terraform itself, and so they have their own version numbers.
# For production use, you should constrain the acceptable provider versions via configuration, to ensure that new
# versions with breaking changes will not be automatically installed by terraform init in future.

terraform {
  required_version = "0.12.20"

  required_providers {
    aws      = "~> 2.70.0"
    null     = "~> 2.1.2"
    local    = "~> 1.4.0"
    random   = "~> 2.2.1"
    template = "~> 2.1.2"
    archive  = "~> 1.3.0"
  }
}