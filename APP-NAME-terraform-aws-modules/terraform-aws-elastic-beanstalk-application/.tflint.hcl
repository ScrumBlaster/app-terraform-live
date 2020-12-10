
# https://github.com/terraform-linters/tflint/blob/master/docs/guides/config.md

# You can change the behavior not only in CLI flags but also in configuration files. By default, TFLint looks up
# .tflint.hcl according to the following priority:
#
# 1) Current directory (./.tflint.hcl)
# 2) Home directory (~/.tflint.hcl)

# You can also use another file as a config file with the --config option like we did by passing args to tflint in
# .pre-commit-hook.yaml

config {
  module     = false
  deep_check = true
  force      = false

  aws_credentials = {
    region     = "eu-central-1"
  }
}