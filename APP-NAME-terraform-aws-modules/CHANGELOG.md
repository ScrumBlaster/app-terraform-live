# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [0.32.7](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.32.6...v0.32.7) (2020-09-09)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Fix Lamba function - wrong datbaase username when rotating secret ([5ba44d6](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/5ba44d6477c8d32249c08370748ca47a69bb2b35))


### Docs

* Update RELEASE-NOTES.md ([cdca545](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/cdca545d4310898d3cbb440de588e5b4f9e4439d))
* Update RELEASE-NOTES.md ([67dc032](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/67dc0329b10e190790c0df16124302f2bf394f6f))
* Update RELEASE-NOTES.md ([f3b995d](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/f3b995d07c258a4c580eea1f9bff3604ec210d4f))
* Update RELEASE-NOTES.md ([375a120](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/375a120254ff05def5f4d93097c12070e700b87e))

### [0.32.6](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.32.5...v0.32.6) (2020-09-08)


### Docs

* Created and updated RELEASE-NOTES.md ([982ed55](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/982ed55f3a48ab05e358055ad3b9bdb962fc58cc))

### [0.32.5](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.32.4...v0.32.5) (2020-09-08)


### Chore

* **terraform-aws-s3-bucket:** Set default value for s3_lifecycle_rules variable - default = [] ([6a4c53e](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/6a4c53ee84101c76d619ca8cdb8f7386dcd467b6))

### [0.32.4](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.32.3...v0.32.4) (2020-09-07)

### [0.28.9](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.28.8...v0.28.9) (2020-09-07)


### Features

* **terraform-aws-s3-bucket:** We can now define S3 lifecycle rules using Terraform ([2cabbde](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/2cabbde7289219e29aba92e4f2f14ebcac6ec385))
* rotate secret after deplyoing Eb environment. ([1696c73](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/1696c73a52ada6de8f0bdef444ec929efb785af3))


### Bug Fixes

* **terraform-aws-secret-manager:** Don't wait (sleep) after rotating secret, proceede immediately. ([67cb54c](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/67cb54c506cf2b036a962ba3eef60fe4ef818434))

### [0.28.8](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.28.7...v0.28.8) (2020-08-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** When deplyoing single Ec2 instance don't create Load Balancer ([2130bf5](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/2130bf539d9ceea35dfe3db4c9ec40fd6fc492d8))

### [0.28.7](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.28.6...v0.28.7) (2020-08-24)


### Bug Fixes

* **terraform-aws-webserver-cluster:** Set loadbalancer_ssl_policy variable default value to empty string and move it to variables.tf ([666e663](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/666e6638c2c7459d8f0de3dd5772b0e0da3c1632))

### [0.28.6](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.28.5...v0.28.6) (2020-08-24)


### Bug Fixes

* **terraform-aws-webserver-cluster:** Don't perform check against null value when setting aws_lb_listener, use empty string. ([d419490](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/d4194900b7e5a220924c6c4564205559e5155cd0))


### Docs

* Update README.md ([48a09ba](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/48a09ba8a75507c68bff44f23114a36c22046286))
* Update README.md ([e15beec](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/e15beec621bfeede301887eed53784fcb1417ba7))

### [0.28.5](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.28.4...v0.28.5) (2020-08-24)


### Bug Fixes

* **terraform-aws-s3-bucket:** Unsupported argument 'var.namespace' ([d6eef87](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/d6eef87c62d9d24a6ca6010245d0c3894e958752))

### [0.28.4](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/compare/v0.28.3...v0.28.4) (2020-08-23)


### Bug Fixes

* **release.sh:** Add and {{previousTag}} and {{currentTag}} to --compareUrlFormat parameter ([a224038](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/a224038d41adb62159065b5f699494cd91135cf7))
* **release.sh:** Add and format --compareUrlFormat parameter. ([c557b0f](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/c557b0f6f8aaa896e3dc97a99d672816d354bad2))
* **release.sh:** Set correct gitlab host. Added --releaseCommitMessageFormat parameter when running standard-version command ([55da354](http://gitlab.common.internal/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/-/commit/55da354003ee4397b718040f819f18c282ff60b5))

### [0.28.3](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/compare/v0.28.2...v0.28.3) (2020-08-23)


### Chore

* **terraform-aws-webserver-cluster:** Remove aws_account_id variable from variables.tf (not used by any tf resource) ([07b54ea](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/07b54eafa5dd6a49848fa352d0bb3fbb036aeb08))


### Docs

* Update README.md ([c2034d5](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/c2034d567dfbe1b2909b1b7ee20f480ac122f597))
* Update README.md ([80d6dfb](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/80d6dfb0ee2c5dfa406e3d31eef1439bf2c3f4ab))
* Update README.md ([15a7041](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/15a70414c496c00bb227fe464d2a70ef64cf4d8e))
* Update README.md ([8ce152c](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/8ce152c7bfcafbe684d7ef1f3263e4db040e6a79))
* Update README.md ([53b401a](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/53b401ac37b8a4c2d514f754efaf74227f07dd28))
* Update README.md ([7854ee8](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/7854ee89f3ec6fda64d9b549fa20c0d58691aec8))
* Update README.md ([76b0d5f](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/76b0d5f23db8c338aceb31adeddd6194572b4ef6))
* Update README.md ([5982599](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/5982599331ae0d01278de40d07fed5f644bcbdf4))
* Update README.md ([315b1d5](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/315b1d540949b345cf9775000c87982b00c43ca6))

### [0.28.2](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/compare/v0.28.1...v0.28.2) (2020-08-21)


### Docs

* Update README.md ([45b534a](http://gitlab.common.internal:2224/consulting-development/APP-NAME/GIT-REPO-terraform-aws-modules/commit/45b534a2060adec755f4dd072e842d5da1c12821))
