
# Terraform `modules` repo - Abstract

This is the Terraform `modules` repository that is being used for infrastructure deployment and development.

This repo defines reusable modules. Think of each module as a “blueprint” that defines a specific part of your 
infrastructure.

Inspired by [Terragrunt](https://terragrunt.gruntwork.io/) and by following their recommended principles and best 
practices when it comes to infrastructure code development with Terraform.

Example [infrastructure-modules](https://github.com/gruntwork-io/terragrunt-infrastructure-modules-example) for Terragrunt.

Although learning curve for Terragrunt can be challenging in the beginning, it could be very rewarding later on to 
actually discover, learn and see some of the advantages by using Terragrunt.

Modules are the key ingredient to writing reusable, maintainable, and testable Terraform code.

Most of the modules are taken over, modified and inspired by great work of [Cloud Posse](https://github.com/cloudposse)

For additional free and open source modules take a look at [Terraform Modules Registry](https://registry.terraform.io/)

# Project requirements

The following are requirements for terraform `modules` development.

## Terraform

Easiest way to install Terraform and to easily switch between Terraform version is by using `tfenv` tool.

### Install tfenv

`tfenv` on [github](https://github.com/tfutils/tfenv)

````shell script
git clone https://github.com/tfutils/tfenv.git ~/.tfenv
sudo ln -s ~/.tfenv/bin/* /usr/local/bin
````

### Install Terraform

We can now easily install Terraform. Let's say we want to install Terraform version ***0.12.20***, with `tfenv` we would 
simply run:

````shell script
tfenv install 0.12.20
tfenv use 0.12.20
````

### Install Terraform providers/plugins locally

Terraform (provider) plugins that are being used across modules:

- [terraform-provider-aws](https://releases.hashicorp.com/terraform-provider-aws/)
- [terraform-provider-null](https://releases.hashicorp.com/terraform-provider-null/)
- [terraform-provider-local](https://releases.hashicorp.com/terraform-provider-local/)
- [terraform-provider-random](https://releases.hashicorp.com/terraform-provider-random/)
- [terraform-provider-template](https://releases.hashicorp.com/terraform-provider-template/)
- [terraform-provider-archive](https://releases.hashicorp.com/terraform-provider-archive/)

Not each module is using every plugin from above. It's recommended to have those plugins installed locally for faster 
development (instead terraform downloading providers from Internet, locally installed plugins will be used).

Installing plugins --> https://www.terraform.io/docs/plugins/basics.html#installing-plugins

Example of installing plugins:

```shell script
mkdir -p ~/.terraform.d/plugins # Create dir if already not exists
cd ~/.terraform.d/plugins
sudo wget https://releases.hashicorp.com/terraform-provider-aws/2.70.0/terraform-provider-aws_2.70.0_linux_amd64.zip
unzip terraform-provider-aws_2.70.0_linux_amd64.zip
sudo wget https://releases.hashicorp.com/terraform-provider-null/2.1.2/terraform-provider-null_2.1.2_linux_amd64.zip
unzip terraform-provider-null_2.1.2_linux_amd64.zip
sudo wget https://releases.hashicorp.com/terraform-provider-local/1.4.0/terraform-provider-local_1.4.0_linux_amd64.zip
unzip terraform-provider-local_1.4.0_linux_amd64.zip
sudo wget https://releases.hashicorp.com/terraform-provider-random/2.2.1/terraform-provider-random_2.2.1_linux_amd64.zip
unzip terraform-provider-random_2.2.1_linux_amd64.zip
sudo wget https://releases.hashicorp.com/terraform-provider-template/2.1.2/terraform-provider-template_2.1.2_linux_amd64.zip
unzip terraform-provider-template_2.1.2_linux_amd64.zip
sudo wget https://releases.hashicorp.com/terraform-provider-archive/1.3.0/terraform-provider-archive_1.3.0_linux_amd64.zip
unzip terraform-provider-archive_1.3.0_linux_amd64.zip
rm -rf *.zip # Cleanup .zip files
```

### Recommended Terraform readings:

An Introduction to Terraform
- https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180

Get Started - AWS
- https://learn.hashicorp.com/collections/terraform/aws-get-started

Announcing Terraform 0.12
- https://www.hashicorp.com/blog/announcing-terraform-0-12/

How to manage multiple versions of Terragrunt and Terraform as a team in your IaC project
- https://blog.gruntwork.io/how-to-manage-multiple-versions-of-terragrunt-and-terraform-as-a-team-in-your-iac-project-da5b59209f2d

## Install standard-version

Modules versioning are based on [standard-version](https://github.com/conventional-changelog/standard-version) utility for 
versioning using [semver](https://semver.org/) and CHANGELOG generation powered by [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

Github --> https://github.com/conventional-changelog/standard-version

Pre-requirements: Install `node.js` and `npm`. [Here](https://www.devroom.io/2011/10/24/installing-node-js-and-npm-on-ubuntu-debian/) 
you can see example on how to install `node.js` and `npm` on Ubuntu Debian.

`standard-version` is used to automate tagging our repository and automatically increase correct version number/tag for 
each release we have. It will also update CHANGELOG.md on every release with last commit(s), nice way to keep track of 
work history.

### Installing standard-version

I had problem running this command, the error was in network connection. If it's not working for you try to use 
different network connection: Connect or disconnect from VPN, try with mobile hotspot, etc...

    sudo npm i -g standard-version 

## AWS CLI (version 2 Linux)

[Installing the AWS CLI version 2 on Linux](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-upgrade)

- In order to use terraform local-exec provider (when we want to run some AWS CLI commands) we need to have installed 
AWS locally on our machine. 

## TFLint and pre-commit-terraform

Github repo tflint --> https://github.com/terraform-linters/tflint

- Why TFLint? 

Why TFLint is required?
Terraform is a great tool for Infrastructure as Code. However, many of these tools don't validate provider-specific issues.

TFLint currently only inspects Terraform-specific issues and AWS issues.
  
### Install TFLint

cd /usr/local/bin
sudo wget https://github.com/terraform-linters/tflint/releases/download/<tflint_verison>/tflint_linux_amd64.zip
sudo unzip tflint_linux_amd64.zip
tflint --version

### Update TFLint

Check for new versions/releases --> https://github.com/wata727/tflint/releases

cd /usr/local/bin
tflint --version
sudo wget https://github.com/terraform-linters/tflint/releases/download/<tflint_verison>/tflint_linux_amd64.zip
sudo mv tflint tflint_<old_version>
sudo unzip tflint_linux_amd64.zip
tflint --version

### TFLint configuration

https://github.com/terraform-linters/tflint/blob/master/docs/guides/config.md

You can change the behavior not only in CLI flags but also in configuration files. By default, TFLint looks up 
`.tflint.hcl` according to the following priority:

- Current directory (./.tflint.hcl)
- Home directory (~/.tflint.hcl)

Example of tflint config file

````hcl
config {
  module     = false
  deep_check = false
  force      = false
  
  aws_credentials = {
    region     = "eu-central-1"
  }
}
````

## Terraform (git) pre-commit hook

Collection of git hooks for Terraform to be used with pre-commit framework.

`pre-commit-terraform` on [github repo.](https://github.com/antonbabenko/pre-commit-terraform).

### Install pre-commit-terraform

https://github.com/antonbabenko/pre-commit-terraform

NOTE: In order to install `pre-commit-terraform`, user should have [go (golang)](https://golang.org/doc/install?download=go1.15.linux-amd64.tar.gz) 
installed on his machine.

````shell script
sudo apt install python3-pip gawk -y && \
pip3 install pre-commit
curl -L "$(curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep -o -E "https://.+?-linux-amd64")" > terraform-docs && chmod +x terraform-docs && sudo mv terraform-docs /usr/bin/
curl -L "$(curl -s https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" > tflint.zip && unzip tflint.zip && rm tflint.zip && sudo mv tflint /usr/bin/
env GO111MODULE=on go get -u github.com/liamg/tfsec/cmd/tfsec
````

### How to initialize pre-commit for repository

If `.pre-commit-config.yaml` doesn't exists, create one by running (don't forget to check for [latest version](https://github.com/antonbabenko/pre-commit-terraform/releases)):

````
cd modules/
cat <<EOF > .pre-commit-config.yaml
repos:
- repo: git://github.com/antonbabenko/pre-commit-terraform
  rev: v1.25.0 # Get the latest from: https://github.com/antonbabenko/pre-commit-terraform/releases
  hooks:
    - id: terraform_fmt
    - id: terraform_validate
    - id: terraform_tflint
    # - id: terraform_docs # Still unsure how we to use this with current repo setup...

EOF

````

After creating `pre-commit-config.yaml`, we need to initialize and install pre-commit script by running:

`pre-commit install`

Output: 

`pre-commit installed at .git/hooks/pre-commit`

In case `pre-commit-config.yaml` already exists and pre-commit is not working for user, user will need to run 
`pre-commit install` on his machine as well.

After pre-commit hook has been installed you can run it (test it) manually on all files in the repository

`pre-commit run -a` or specific hook `pre-commit run terraform_validate`

### How to update pre-commit-terraform

Navigate into a repository and run:

````shell script
pre-commit autoupdate
git add .pre-commit-config.yaml
git commit -m "feat(pre-commit-terraform): pre-commit-terraform hook version updated to vX.Y.Z"
````

# Releasing module repo versions using standard-version

It helps us automate to always push correct `git tag (latest version)` and automatically writes any commit changes to 
CHANGELOG.md.

Having versions in form of git tags for `modules` repository is very important for our infrastructures/environments.

Approach here is to create *versioned modules* so that you can use one version in dev/test (e.g., v0.0.2) and a different 
version in production (e.g., v0.0.1)

## How standard-version should be used?

First, in order to use it correctly we should follow some rules when writing commit messages.

    - https://www.conventionalcommits.org/en/v1.0.0/

## Examples: Commit Message Convention, at a Glance

*patches:*

    git commit -a -m "fix(parsing): fixed a bug in our parser"

*features:*

    git commit -a -m "feat(parser): we now have a parser \o/"

*breaking changes:*

    git commit -a -m "feat(new-parser): introduces a new parsing library
    BREAKING CHANGE: new library does not support foo-construct"

*other changes:*

You decide, e.g., docs, chore, style, etc.

    git commit -a -m "docs: fixed up the docs a bit"

Script named `release.sh` can be used to automate versioning and tagging.

[Script usage and description goes here]


# Locking down compatible Terraform versions in your modules

In your module code, you can add a `terraform` block with a `required_version` property set in it to restrict compatible 
terraform versions.

For example, you can add the following block to restrict deployments of the module to only allow Terraform version 
0.12.17:

````hcl-terraform
terraform { 
  # NOTE: The second `=` in the string is intentional, and it means
  # exactly version 0.12.17. In other words, we are setting the 
  # required_version property of the terraform block to "= 0.12.17".
  required_version = "= 0.12.17"
}
````

This causes Terraform to halt with an error if it detects you are using an incompatible Terraform version, preventing 
you from deploying using a different version. By adding this block to the top level modules that you are directly 
deploying, you can ensure your team only deploys those modules using the specified Terraform version. 

You can read more about this feature [in the official docs](https://www.terraform.io/docs/configuration/terraform.html#specifying-a-required-terraform-version).

# Resources

Terraform: Up & Running Code by brikis98
- https://github.com/brikis98/terraform-up-and-running-code

Terragrunt official docs
- https://terragrunt.gruntwork.io/docs/

Example infrastructure-modules for Terragrunt
- https://github.com/gruntwork-io/terragrunt-infrastructure-modules-example

Terraform providers
- https://www.terraform.io/docs/providers/index.html

Terraform plugins
- https://www.terraform.io/docs/plugins/index.html

Terraform Module Sources
- https://www.terraform.io/docs/modules/sources.html

How to manage multiple versions of Terragrunt and Terraform as a team in your IaC project
- https://blog.gruntwork.io/how-to-manage-multiple-versions-of-terragrunt-and-terraform-as-a-team-in-your-iac-project-da5b59209f2d

Key Terms and Concepts for AWS Secrets Manager
- https://docs.aws.amazon.com/secretsmanager/latest/userguide/terms-concepts.html

Standard Version
- https://github.com/conventional-changelog/standard-version