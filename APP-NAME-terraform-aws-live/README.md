
# Terraform `live` repo - Abstract

The idea behind infrastructure as code (IAC) is that you write and execute code to define, deploy, update and destroy 
your infrastructure. If infrastructure is defined in code, the entire deployment process can be automated.

Inspired by [Terragrunt](https://terragrunt.gruntwork.io/) and by following their recommended principles and best 
practices when it comes to infrastructure code development with Terraform.

[Terragrunt](https://terragrunt.gruntwork.io) is a thin wrapper that provides extra tools for keeping your
configurations DRY, working with multiple Terraform modules, and managing remote state.

This repo defines the live infrastructure you’re running in each environment (dev, test, prod). Think of this as
the “houses” you built from the “blueprints” in the `modules` repo.

Although learning curve for Terragrunt can be challenging in the beginning, it could be very rewarding later on to 
actually discover, learn and see some of the advantages by using Terragrunt.

========================================================================================================================

[Here goes the content overview of whole README document -> Task for Team Alfa]

========================================================================================================================

# Why Terragrunt?

Terragrunt will forward almost all commands, arguments, and options directly to Terraform, but based on the settings in 
your `terragrunt.hcl` file, Terragrunt can help you accomplish the following:

- [Keep your Terraform code DRY](https://terragrunt.gruntwork.io/docs/features/keep-your-terraform-code-dry/)
- [Keep your remote state configuration DRY](https://terragrunt.gruntwork.io/docs/features/keep-your-remote-state-configuration-dry/)
- [Keep your CLI flags DRY](https://terragrunt.gruntwork.io/docs/features/keep-your-cli-flags-dry/)
- [Keep your provider configuration DRY](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/#keep-your-provider-configuration-dry)
- [https://terragrunt.gruntwork.io/docs/getting-started/quick-start/#promote-immutable-versioned-terraform-modules-across-environments](Promote immutable, versioned Terraform modules across environments)
- [Execute Terraform commands on multiple modules at once](https://terragrunt.gruntwork.io/docs/features/execute-terraform-commands-on-multiple-modules-at-once/)
- [Work with multiple AWS accounts](https://terragrunt.gruntwork.io/docs/features/work-with-multiple-aws-accounts/#work-with-multiple-aws-accounts)

## Recommended blog/articles reading

Terragrunt: how to keep your Terraform code DRY and maintainable
- https://blog.gruntwork.io/terragrunt-how-to-keep-your-terraform-code-dry-and-maintainable-f61ae06959d8

Example infrastructure-modules for Terragrunt
- https://github.com/gruntwork-io/terragrunt-infrastructure-modules-example

Example infrastructure-live for Terragrunt
- https://github.com/gruntwork-io/terragrunt-infrastructure-live-example

# APP-NAME infrastructure - High Level Diagram Overview

![APP-NAME infrastructure - High Level Diagram Overview](./docs/img/ApponX-APP-NAME-AWS-Infrastructure-HL-Design.png)

# How is the code in this repo organized?

The contents of each environment will be more or less identical, except perhaps for a few settings (e.g. the prod 
environment may run bigger or more servers). 

The code in this repo uses the following folder hierarchy:

    live
    ├── stage-type
    │   └── stage-name (aws account)
    │       ├── aws-region
    │       │   ├── common
    │       │   ├── environment
    │       │   │   ├── resource
    │       │   │   │    └── terragrunt.hcl (child)
    │       │   │   └── env.hcl (environment specific variables)
    │       │   │
    │       │   └── region-specific.tfvars (vpc, subnets, route tables, availability-zones)
    │       │
    │       └── common.hcl (common account/stage specific variables)
    │
    ├── _global_vars.hcl (global variables)
    └── terragrunt.hcl (parent or root)

Where:

**Folders**

- **Live:** Top level under which environments (infrastructures) and project resources are organized. 

- **Stage-Type:** Stage type can be defined either as **non-prod** or **prod**. Separating non-productive code, stages 
  and environments from productive ones.

- **Stage-Name (AWS Account):** Stage name such as dev, test or prod. It also should correspond to the name of AWS 
  Account or in other words, each AWS Account represents one stage.

- **Aws-Region:** Within each AWS Account, there can be one or more AWS regions, such as us-east-1, eu-central-1, 
  and ap-southeast-2, where you've deployed resources. The default region for this project and for all environments 
  should always be eu-central-1 unless otherwise stated.

- **Common:** Also, within each stage, there will be one `common` environment. It defines resources that are available 
  across all other stage environments such as dev1, dev2, etc. It also defines resources that are independent from 
  environments but still needed for other reasons. For example, under each common environment we have one phpMyAdmin 
  instance that's used by project team members with different roles for accessing and working with environment specific 
  databases.

- **Environment:** Within each region, there will be one or more "environments", such as dev1, dev2, test1, etc. 
  Typically, an environment will correspond to a single application infrastructure, which isolates that environment from 
  everything else in that AWS account. There may also be a `common` folder that defines resources that are available 
  across all the environments in this AWS region.

- **Resource:** Within each environment, you deploy all the resources for that environment, such as Elastic Beanstalk, 
  Database, IAM roles and policies, Lambda functions, KMS, Secrets, and so on. Note that the Terraform code for most of 
  these resources lives in the `GIT-REPO-terraform-aws-modules` repo.

**Variable files**

- **_global_vars.hcl:** Global variables that are not stage (account) or environment specific and are shared with all 
  resources. Here we are defining variables such as AWS Account IDs, external services IPs or CIDR ranges in order 
  to enable communication with our application, etc... 

- **common.hcl:** Stage specific variables such as: stage AWS Account ID, name of AWS IAM role used by Terraform to 
  deploy resources inside of stage, VPC CIDR, AWS Secrets IDs, etc...   

- **region-specific.tfvars:** Region specific variables in form of `.tfvars` files. One VPC per region is deployed. Our 
  resources and environments are deployed in `eu-central-1`. Here we provide values for following variables: 
  availability zones, private route table ids, private and public subnets as well as VPC ID.

- **env.hcl:** Environment specific variables. Here we define module `version` which should be used by 
  environment resources. Beside version, here we define values for variables such as eb_solution_stack_name, 
  default_ec2_instance_type, root_volume_size, eb_env_vars, etc... 

**NOTE:** only lowercase alphanumeric characters are allowed when naming/creating new environment!! That's due to future 
implementation of Azure DevOps Pipelines which have some constraints when it comes to naming convection for pipeline
stages/jobs (you are not allowed to use "-" in stage name for example...)

# Getting Started

The following are requirements for working with `live` repo and infrastructures development/deployments.

## Terraform

Terraform on [github.](https://github.com/hashicorp/terraform)
Terraform [official.](https://www.terraform.io/)

Easiest way to install Terraform and to easily switch between Terraform version is by using `tfenv` tool. Having `tfenv` 
installed on a machine is also requirement. Under each environment there is file `.terraform-version` which will be 
automatically detected by `tfenv` and has two purposes:

1. To make sure that always correct Terraform versions is being used (either by developer or in a pipeline).
2. To automatically use the right version of the binaries for your project (`tfen` will automatically switch and use 
   Terraform version defined in `.terraform-version` file)
   
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

### Recommended Terraform blog/article readings:

An Introduction to Terraform
- https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180

Get Started - AWS
- https://learn.hashicorp.com/collections/terraform/aws-get-started

Announcing Terraform 0.12
- https://www.hashicorp.com/blog/announcing-terraform-0-12/

How to manage multiple versions of Terragrunt and Terraform as a team in your IaC project
- https://blog.gruntwork.io/how-to-manage-multiple-versions-of-terragrunt-and-terraform-as-a-team-in-your-iac-project-da5b59209f2d

## Install Terragrunt

Terragrunt on [github.](https://github.com/gruntwork-io/terragrunt)
Terragrunt [official.](https://terragrunt.gruntwork.io/)

Easiest way to install Terragrunt and to easily switch between Terragrunt versions is by using `tgenv` tool. Having 
`tgenv` installed on a machine is also requirement. Under each environment there is file `.terragrunt-version` which 
will be automatically detected by `tgenv` and has two purposes:

1. To make sure that always correct Terragrunt version is being used (either by developer or in a pipeline).
2. To automatically use the right version of the binaries for your project (`tgenv` will automatically switch and use 
   Terragrunt version defined in `.terragrunt-version` file)
   
### Install tgenv

`tgenv` on [github](https://github.com/cunymatthieu/tgenv)

````shell script
git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv
sudo ln -s ~/.tgenv/bin/* /usr/local/bin
````

We can now easily install Terragrunt. Let's say we want to install Terragrunt version ***0.23.24***, with `tgenv` we would 
simply run:

````shell script
tgenv install 0.23.24
tgenv use 0.23.24
````

### Recommended Terragrunt blog/article readings:

Terragrunt: how to keep your Terraform code DRY and maintainable
- https://blog.gruntwork.io/terragrunt-how-to-keep-your-terraform-code-dry-and-maintainable-f61ae06959d8

Example infrastructure-modules for Terragrunt
- https://github.com/gruntwork-io/terragrunt-infrastructure-modules-example

Example infrastructure-live for Terragrunt
- https://github.com/gruntwork-io/terragrunt-infrastructure-live-example

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

# Understanding Terragrunt Configuration Blocks and Attributes

The Terragrunt configuration file uses the same HCL syntax as Terraform itself in terragrunt.hcl.

The following is a reference of all the supported blocks and attributes in the configuration file:

**Blocks**

- [terraform](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform)
- [remote_state](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#remote_state)
- [include](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#include)
- [locals](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#locals)
- [dependency](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency)
- [dependencies](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependencies)
- [generate](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#generate)

**Attributes**

-  [inputs](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#inputs)
-  [download_dir](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#download_dir)
-  [prevent_destroy](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#prevent_destroy)
-  [skip](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#skip)
-  [iam_role](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#iam_role)
-  [terraform_binary](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform_binary)
-  [terraform_version_constraint](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform_version_constraint)
-  [terragrunt_version_constraint](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terragrunt_version_constraint)

# Understanding `terragrunt/terraform` built-in functions

Most of the code is depending a lot on using built-in functions both from terraform and terragrunt. By combining
them together, we get very dynamically infrastructure code with very little room to make error because most of the
values are set dynamically.

Terraform [built-in functions.](https://www.terraform.io/docs/configuration/functions)
Terragrunt [built-in functions.](https://terragrunt.gruntwork.io/docs/reference/built-in-functions/)

Great way to learn more and to play with Terraform functions is by using Terraform [console command.](https://www.terraform.io/docs/commands/console.html)

As already mentioned, the code in this repo uses the following folder hierarchy:

    live
    ├── stage-type
    │    └── stage-name (aws account)
    │        └── aws-region
    │            ├── common
    │            └── environment
    │                └── resource
    │                    └── terragrunt.hcl (child)
    │
    └── terragrunt.hcl (parent or root)

Let's take a look to one of the most common terragrunt function used: `path_relative_to_include()`  

From terragrunt docs: 

`path_relative_to_include():` returns the relative path between the current 'terragrunt.hcl' file and the path
specified in its include block (child 'terragrunt.hcl' file).

Each time you run terragrunt command, terragrunt function `path_relative_to_include()` will return path (string) in
following form:

    <stage-type>/<aws-account/stage-name>/<region>/<common/environment>/<resource>

That's why we can use Terraform 'element()' and 'split()' functions alongside with terragrunt
`path_relative_to_include()` function to extract values such as stage_type, stage_name, region, environment, stack
and resource name.

##### Use Terraform console command (examples):

Let's assume that we want to update or deploy S3 archive bucket which is located under following path:

    "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive/terragrunt.hcl"

In that case, path_relative_to_include() function will return following string

    path_relative_to_include() = "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"

After we split the above string by "/" character using Terraform split() function, as result we end up with list of
strings as follows:

    [ "non-prod", "apponx-dev", "eu-central-1", "dev", "aws-s3-bucket", "powercloud", "archive" ]

Next, using terraform element() function we can then access specific element from the list.

    stage_type  = element(split("/", "${path_relative_to_include()}"), 0) => "non-prod"
    stage_name  = element(split("/", "${path_relative_to_include()}"), 1) => "apponx-dev"
    region      = element(split("/", "${path_relative_to_include()}"), 2) => "eu-central-1"
    environment = element(split("/", "${path_relative_to_include()}"), 3) => "dev"

To play around or test simply use `terraform console` command and replace 'path_relative_to_include()' with any sting
that 'path_relative_to_include()' can return (let's use string from above example again).

Copy/paste following example in your terminal and see output of each function:

    $ terraform console;
    
    > element(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"), 0)
    > element(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"), 1)
    > element(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"), 2)
    > element(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"), 3)

    # [following two will return stack and resource name]
    > join("/", slice(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"), 2, length(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"))))
    > element("${split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive")}", element(reverse(range(length(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive")))), 0))
    
    # [The two above functions can be simplified if you start from inside->outside ]
    > length(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"))
    > range(length(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive")))
    > reverse(range(length(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive"))))
    > element(reverse(range(length(split("/", "non-prod/apponx-dev/eu-central-1/dev/aws-s3-bucket/powercloud/archive")))), 0)


Here is blog article on [How to test Terraform built-in functions locally](http://artemstar.com/2018/03/03/terraform-test-functions/)

# Parent `terragrunt.hcl` (located in root of the `live` repo)

The main, or also called the `parent terragrunt.hcl` file, located in root of the `live` repo, is being used to:

- Set up backend (Terraform S3 remote state bucket) configuration for each environment. See 
  [Keep your backend configuration DRY](https://terragrunt.gruntwork.io/docs/getting-started/quick-start/#keep-your-backend-configuration-dry)
  for more info.
- Provide consistent and global aws tags that will be applied to each and every resource.
- Set correct IAM role for Terraform deployments. Check [Work with multiple AWS accounts](https://terragrunt.gruntwork.io/docs/features/work-with-multiple-aws-accounts/)
  for more info.

Essentially, any configuration defined in root (parent) `terragrunt.hcl` is included (merged) in the child.

Parent `terragrunt.hcl` is described in more detail in a file itself in form of comments.

#### Parent `terragrunt.hcl` file structure

##### Locals

You can use locals to bind a name to an expression, so you can reuse that expression without having to repeat it 
multiple times (keeping your Terragrunt configuration DRY).

Usage of locals in parent `terragrunt.hcl` is described in more detail in a file itself in form of comments.

For more info check Terragrunt docs: https://terragrunt.gruntwork.io/docs/features/locals/

##### Remote state

The following is defined in the root (parent) `terragrunt.hcl` config that is included in the child, the state file for 
the child module will be stored at the key "${local.stack}/terraform.tfstate".

Note that since we are not using any of the skip args, this will automatically create the S3 bucket
"${local.vars.inputs.stage_vars.stage_name.name}.terraform-state.eu-central-1" and DynamoDB table "terraform-locks-eu-central-1" if it does not 
already exist.

`````hcl-terraform
remote_state {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "${local.vars.inputs.stage_vars.stage_name.name}.terraform-state.eu-central-1"
    key            = "${local.stack}/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks-eu-central-1"
    acl            = "private"
    s3_bucket_tags = {
      Terraform      = "true"
      Region         = local.vars.inputs.stage_vars.inputs.region
      Stack          = "terraform-state-bucket"
      Owner          = local.aws_account_id
      Stage-Type     = local.vars.inputs.stage_vars.inputs.stage_type
      Stage-Name     = local.vars.inputs.stage_vars.stage_name.name
      DenyAPP-NAME = local.deny_APP-NAME
    }
  }
}
`````

For more info check Terragrunt docs: https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#remote_state

##### Inputs

The inputs attribute is a map that is used to specify the input variables and their values to pass in to Terraform. Each 
entry of the map will be passed to Terraform using the environment variable mechanism.

Attribute `inputs` defined in parent `terragrunt.hcl` is described in more detail in a file itself in form of comments.

For more info check Terragrunt docs: https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#inputs

# Child `terragrunt.hcl` files and their structure

Child `terragrunt.hcl` file is basically terragrunt configuration file responsible for creating specific module 
resources depending on settings of `source` arguments inside `terraform {}` block configuration.

Block `locals` and attribute `inputs` are already explained in above "Parent `terragrunt.hcl` file structure" chapter. 
The focus here will be `terraform {}` block, `include {}` block, `dependencies` block and `dependency` block.

##### `terraform {}` block

The terraform block is used to configure how Terragrunt will interact with Terraform. This includes specifying where to 
find the Terraform configuration files, any extra arguments to pass to the terraform CLI, and any hooks to run before or 
after calling Terraform.

The `terraform` block supports arguments. Among those arguments one that is used in each `module/resource` is 
`source (attribute)` and another one is `extra_arguments (block)`.

###### `source` (attribute)

Specifies where to find Terraform configuration files. This parameter supports the exact same syntax as the module 
source parameter for Terraform module blocks, including local file paths, Git URLs, and Git URLS with ref parameters. 
Terragrunt will download all the code in the repo (i.e. the part before the double-slash //) so that relative paths work 
correctly between modules in that repo.

Here is how we define `source` attribute inside `terraform` block configuration:

````hcl-terraform

terraform {
      source = local.source
}

locals {
  source = (
  get_env("TF_VAR_GIT_PAT", "ssh") != "ssh"
    ? "git::https://${get_env("TF_VAR_GIT_PAT", "error")}@appon.visualstudio.com/apponx/_git/GIT-REPO-terraform-aws-modules//terraform-aws-elastic-beanstalk-environment?ref=${local.version}"
    : "git::ssh://git@gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules.git//terraform-aws-elastic-beanstalk-environment?ref=${local.version}"
  )
}
````

First we define `source` inside of `locals` block in order to be able to use terraform/terragrunt built-in functions.

Local `source` variable is set based on if we export `TF_VAR_GIT_PAT` as a [Terraform environment variable `(TF_ENV_*)`](https://www.terraform.io/docs/commands/environment-variables.html) 
or not. Basically, if `TF_VAR_GIT_PAT` is exported, Terragrunt will set and use the value from exported environment 
variable. Otherwise, if not, the default value for authenticate using SSH keys will be set.

[`get_env(NAME, DEFAULT)`](https://terragrunt.gruntwork.io/docs/reference/built-in-functions/#get_env) returns the value 
of the environment variable named `NAME` or `DEFAULT` if that environment variable is not set.

Example: 

````hcl-terraform
remote_state {
  backend = "s3"
  config = {
    bucket = get_env("BUCKET", "my-terraform-bucket")
  }
}
````

There are two ways Terraform can authenticate against git repository:

- using SSH keys (public key is set and defined under user profile in Version Control System - Github, Gitlab, 
  Azure Devops, etc., and private SSH key is located on user/developer machine)

- using Git PAT (Personal Access Token) - Personal access tokens (PATs) are an alternative to using passwords ot SSH 
  keys for authentication to Version Control System such as Github, Gitlab...

For local development either of methods can be use, but when it comes to pipeline deployments we want to avoid using SSH 
keys and instead use PAT. 

When running pipeline with Azure DevOps Pipeline, we can use pre-defined system variables from build agent (server).

One of pre-defined variables is called `System.AccessToken`. `System.AccessToken` is a special variable that carries the 
security token used by the running build. We can use this token and pass it to Terraform in order to authenticate against 
git `modules` repository.

So in our pipeline, just before running Terragrunt command, we can export `TF_VAR_GIT_PAT` as environment variable, 
something like this ([azure-pipelines.yaml variables](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch)):
    
````yaml
# Set variables once
variables:
    TF_VAR_GIT_PAT: $(System.AccessToken)

# Or set directly  in step/task
steps:
- task: Bash@3
  inputs:
    targetType: 'inline'
    script: | 
        export TF_VAR_GIT_PAT=${TF_VAR_GIT_PAT}
        terragrunt apply --terragrunt-non-interactive
  env:
    TF_VAR_GIT_PAT: $(System.AccessToken)
````

###### `extra_arguments` (block)

Nested blocks used to specify extra CLI arguments to pass to the terraform CLI. Learn more about its usage in the [Keep 
your CLI flags DRY](https://terragrunt.gruntwork.io/docs/features/keep-your-cli-flags-dry/) use case overview.

- `arguments` (required) : A list of CLI arguments to pass to terraform.
- `commands` (required) : A list of terraform sub commands that the arguments will be passed to.

Function [`get_terraform_commands_that_need_vars`](https://terragrunt.gruntwork.io/docs/reference/built-in-functions/#get_terraform_commands_that_need_vars): 
returns the list of terraform commands that accept `-var` and `-var-file` parameters. This function is used when 
defining `extra_arguments`.

````hcl-terraform
terraform {
  source = local.source

  extra_arguments "vpc_vars" {
    commands = get_terraform_commands_that_need_vars()
    arguments = [
      "-var-file=${get_terragrunt_dir()}/../../../../${local.vars.inputs.stage_vars.inputs.region}.vpc-id.tfvars",
      "-var-file=${get_terragrunt_dir()}/../../../../${local.vars.inputs.stage_vars.inputs.region}.private-subnets.tfvars",
      "-var-file=${get_terragrunt_dir()}/../../../../${local.vars.inputs.stage_vars.inputs.region}.public-subnets.tfvars",
    ]
  }
}
````

For more info about `terraform` block and what other arguments are supported check [Terragrunt documentation.](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform).

Here you can read more about [Terraform module sources](https://www.terraform.io/docs/modules/sources.html).

About Azure Devops Pipelines [predefined variables](https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml).

##### `include {}` block

The `include` block is used to specify inheritance of Terragrunt configuration files. The included config (also called the 
parent) will be merged with the current configuration (also called the child) before processing. You can learn more 
about the inheritance properties of Terragrunt in the Filling in remote state settings with Terragrunt section of the 
[Keep your remote state configuration DRY](https://terragrunt.gruntwork.io/docs/features/keep-your-remote-state-configuration-dry/) 
use case overview.

The `include` block supports the following arguments:

`path (attribute):` Specifies the path to a Terragrunt configuration file (the parent config) that should be merged with this configuration (the child config).

Example:

If you have the following folder structure, and the following contents for `./child/terragrunt.hcl`, this will include and 
merge the items in the `terragrunt.hcl` file at the root.

     .
     ├── terragrunt.hcl
     └── child
         └── terragrunt.hcl

````hcl-terraform
# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
````

For more info check Terragrunt documentation on [include block.](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#include)

##### `dependencies {}` block

The [`dependencies` block](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependencies) is 
used to enumerate all the Terragrunt modules that need to be applied in order for this module to be able to apply. Note 
that this is purely for ordering the operations when using `xxx-all` commands of Terraform.

The `dependencies` block supports the following arguments:

- `paths` (attribute): A list of paths to modules that should be marked as a dependency.

Example:

````hcl-terraform
# When applying this terragrunt config in an `xxx-all` command, make sure the modules at "../vpc" and "../rds" are
# handled first.
dependencies {
  paths = ["../vpc", "../rds"]
}
````

##### `dependency {}` block

The [`dependency`](https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependencies) block is 
used to configure module dependencies. Each dependency block exports the outputs of the target module as block 
attributes you can reference throughout the configuration. You can learn more about `dependency` blocks in the 
[Dependencies between modules section](https://terragrunt.gruntwork.io/docs/features/execute-terraform-commands-on-multiple-modules-at-once/#dependencies-between-modules) 
of the “Execute Terraform commands on multiple modules at once” use case overview.

You can define more than one dependency block. Each label you provide to the block identifies another dependency that 
you can reference in your config.

# Terragrunt: Testing (multiple) modules locally (modules development)

========================================================================================================================
[DRAFT CONTENT - in progress]
========================================================================================================================

- https://terragrunt.gruntwork.io/docs/reference/cli-options/#terragrunt-source
- https://davidbegin.github.io/terragrunt/use_cases/execute-terraform-commands-on-multiple-modules-at-once.html

If you are using Terragrunt to configure Remote Terraform configurations and all of your modules have the `source`
parameter set to a Git URL, but you want to test with a local checkout of the code, you can use the `--terragrunt-source`
parameter:

    cd live/non-prod/apponx-test/eu-central-1/test-prod/aws-elastic-beanstalk/APP-NAME/environment
    terragrunt apply --terragrunt-source ../../../../../../../../modules//aws-elastic-beanstalk


BECAUSE OF DEPENDENCY WE MUST SET export TF_VAR_dependency_skip_outputs=true BECAUSE WE GET ERROR

# Troubleshooting

========================================================================================================================
[DRAFT CONTENT - in progress]
========================================================================================================================

#### Elastic Beanstalk won't update after ONLY changing one of the environment variable

- In Elastic Beanstalk environment variables we should avoid using following characters:


    '><|)'(;-$&´`/@"\'

#### How can I troubleshoot and resolve high CPU utilization on my Amazon RDS for MySQL, MariaDB, or Aurora for MySQL instances?

- https://aws.amazon.com/premiumsupport/knowledge-center/rds-instance-high-cpu/

#### Database disaster recovery process

[Creating and defining the database disaster recovery process in progress...once completed documentation will be added 
here]

#### Error: Error creating Elastic Beanstalk configuration template

##### InvalidParameterValue: No Solution Stack named '64bit Amazon Linux 2018.03 v2.8.14 running PHP 7.1' found.

We need to be sure we are using correct Solution Stack name. They are region specific.

Using AWS CLI we can list available Solution stacks:

`aws --region eu-central-1 elasticbeanstalk list-available-solution-stacks`
`aws --region eu-central-1 elasticbeanstalk list-available-solution-stacks | grep 7.1`
`aws --region eu-central-1 elasticbeanstalk list-available-solution-stacks | grep 7.3`

# Resources

========================================================================================================================
[DRAFT CONTENT - in progress]
========================================================================================================================

### AWS Services used in project

========================================================================================================================

[Add links to missing AWS Service that are used in project but not listed here -> Task for Team Alfa]

========================================================================================================================

AWS Elastic Beanstalk
All configuration settings

- https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html

AWS Cloudwatch Logs
- https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html

AWS Elasticache (Redis)
- https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/WhatIs.html

AWS IAM
- https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html

AWS KMS
- https://docs.aws.amazon.com/kms/latest/developerguide/overview.html

AWS RDS (Aurora)
- https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html

AWS Secrets Manager
- https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html

AWS Route53
- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html

AWS S3 Bucket
- https://docs.aws.amazon.com/AmazonS3/latest/gsg/GetStartedWithS3.html

AWS Ec2, Autoscaling, Load balancer
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html

Running phpMyAdmin on Docker
- https://docs.phpmyadmin.net/en/latest/setup.html#installing-using-docker