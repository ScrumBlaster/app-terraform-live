# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [0.28.2](///compare/v0.28.1...v0.28.2) (2020-08-20)


### Style

* **.pre-commit-config.yaml:** Add link to release download ([4b86776](///commit/4b86776a469f0051e0e849376d4651398dc33596))


### Chore

* Old variables 'delimiter' and 'attributes' deleted from all modules variables.tf file ([6c9eeeb](///commit/6c9eeeb1a1e1818e4a5154ae0d4cbca2541cf9de))
* Update release.sh ([67271ec](///commit/67271ec56468b4fe38c10fc2e9c63ff94fef1c75))

### [0.28.1](///compare/v0.28.0...v0.28.1) (2020-08-20)


### Chore

* 'namespace' variable deleted from variables.tf ([9967669](///commit/9967669be8a94048c884271ba46988de1ee64915))

## [0.28.0](///compare/v0.27.3...v0.28.0) (2020-08-18)


### Chore

* **terraform-aws-lambda-rotate-secret:** Set default variable value for lambda function timeout ([a984463](///commit/a984463531b9f8b43abb68cfae474adb512422bf))
* **terraform-aws-lambda-rotate-secret:** Update lambda function --> Check for EB health before trying to rotate the secret ([31c6825](///commit/31c6825a04056e0dcf0c83049a40a921153ce866))
* **terraform-aws-secret-manager:** Update null_resource -> local-exec provisioner ([a78ff3b](///commit/a78ff3b39132271060ca2b7b7fb27cd55b715976))


### Style

* **releaase.sh:** Remove unused comments ([a06ff25](///commit/a06ff257aa8d0bb46e5b6c54c16b89fc35e8f5cc))

### [0.27.3](///compare/v0.27.2...v0.27.3) (2020-08-07)


### Chore

* **release): 0.27.3 - chore(terraform-aws-secret-manager:** After secret is rotated wait for 5min before proceeding in order to give EB time to update environment. ([07aedda](///commit/07aedda13aa5b2341a1c8085f7c4394872c09b89))
* **release): 0.27.3 - chore(terraform-aws-secret-manager:** After secret is rotated wait for 5min before proceeding in order to give EB time to update environment. ([7efaf78](///commit/7efaf78a91dbbc1a3d423ff34e99272a38690789))
* **terraform-aws-secret-manager:** After secret is rotated wait for 5min before proceeding in order to give EB time to update environment. ([552b496](///commit/552b4966d732ace60990a92245b1f3509e35e9f1))
* **terraform-aws-secret-manager:** After secret is rotated wait for 5min before proceeding in order to give EB time to update environment. ([203c9d3](///commit/203c9d3fd0fd911ba99e394821ac5609c0c9b3f1))
* **terraform-aws-ssm-document:** Set default values for permissions block parameters ([d5db473](///commit/d5db473a2a6f76ee7d10c01541acd3b2d73b67fb))

### [0.27.3](///compare/v0.27.2...v0.27.3) (2020-08-06)


### Chore

* **release): 0.27.3 - chore(terraform-aws-secret-manager:** After secret is rotated wait for 5min before proceeding in order to give EB time to update environment. ([7efaf78](///commit/7efaf78a91dbbc1a3d423ff34e99272a38690789))
* **terraform-aws-secret-manager:** After secret is rotated wait for 5min before proceeding in order to give EB time to update environment. ([552b496](///commit/552b4966d732ace60990a92245b1f3509e35e9f1))
* **terraform-aws-secret-manager:** After secret is rotated wait for 5min before proceeding in order to give EB time to update environment. ([203c9d3](///commit/203c9d3fd0fd911ba99e394821ac5609c0c9b3f1))

### [0.27.3](///compare/v0.27.2...v0.27.3) (2020-08-06)


### Chore

* **terraform-aws-secret-manager:** After secret is rotated wait for 5min before proceeding in order to give EB time to update environment. ([203c9d3](///commit/203c9d3fd0fd911ba99e394821ac5609c0c9b3f1))

### [0.27.2](///compare/v0.27.1...v0.27.2) (2020-08-06)


### Bug Fixes

* **terraform-aws-ssm-document:** Define account_ids as string type variable ([c5fd05d](///commit/c5fd05d60255184cc424fadcf1c75382b312d918))

### [0.27.1](///compare/v0.27.0...v0.27.1) (2020-08-06)


### Features

* **terraform-aws-ssm-document:** Added permissions parameter. We can now share documents with other AWS accounts ([581b847](///commit/581b847bbb8d40676a857dda4fa7b8781844e3eb))


### Bug Fixes

* **terraform-aws-ssm-document:** define 'permissions' as argument ([2397f0c](///commit/2397f0ccebac08bf8e5ca742163092552ba74d62))


### Chore

* **release): 0.27.1 - feat(terraform-aws-ssm-document:** Added permissions parameter. We can now share documents with other AWS accounts. ([54f58b5](///commit/54f58b57deb13ada8bff4174b2c805b5bf875052))
* **release): 0.27.1 - fix(terraform-aws-ssm-document:** define 'permissions' as argument ([2087f70](///commit/2087f70dce9b5cae9bf67fc418a1af3d0aecdb5b))

### [0.27.1](///compare/v0.27.0...v0.27.1) (2020-08-06)


### Features

* **terraform-aws-ssm-document:** Added permissions parameter. We can now share documents with other AWS accounts ([581b847](///commit/581b847bbb8d40676a857dda4fa7b8781844e3eb))


### Bug Fixes

* **terraform-aws-ssm-document:** define 'permissions' as argument ([2397f0c](///commit/2397f0ccebac08bf8e5ca742163092552ba74d62))


### Chore

* **release): 0.27.1 - feat(terraform-aws-ssm-document:** Added permissions parameter. We can now share documents with other AWS accounts. ([54f58b5](///commit/54f58b57deb13ada8bff4174b2c805b5bf875052))

### [0.27.1](///compare/v0.27.0...v0.27.1) (2020-08-06)


### Features

* **terraform-aws-ssm-document:** Added permissions parameter. We can now share documents with other AWS accounts ([581b847](///commit/581b847bbb8d40676a857dda4fa7b8781844e3eb))

## [0.27.0](///compare/v0.26.2...v0.27.0) (2020-07-22)


### Refactor

* **terraform-aws-webserver-cluster:** Default and custom tags are now mergerd and used in ASG ([65d0277](///commit/65d0277643b23b27e43e6081a33bf35d71474883))

### [0.26.2](///compare/v0.26.1...v0.26.2) (2020-07-15)


### Style

* **terraform-aws-webserver-cluster:** Unused comments deleted; Unused terraform resources deleted; ([173b04f](///commit/173b04f22167ed929c4d8623c95388fe0b7d6877))

### [0.26.1](///compare/v0.26.0...v0.26.1) (2020-06-25)


### Chore

* **terraform-aws-ssm-document:** rename resource ([cea56f6](///commit/cea56f6ddefbfdb9946b1adb344470d58b8e4afc))

## [0.26.0](///compare/v0.25.1...v0.26.0) (2020-06-24)


### Features

* **terraform-aws-ssm-document:** New Terraform module for creating AWS SSM Documents ([b6d02a6](///commit/b6d02a62cec46677715774c700ecec416b5f1a11))


### Chore

* cleanup unused variables from old module ([68cf4f7](///commit/68cf4f75208a0106faba5322dd9f5f16e0e72af2))

### [0.25.1](///compare/v0.25.0...v0.25.1) (2020-06-24)


### Chore

* **terraform-aws-elastic-beanstalk-environment:** Set defualte variable value for loadbalancer_type -> application ([a70ad5d](///commit/a70ad5d949c377842cd6563e0ac523f7b1148b5c))

## [0.25.0](///compare/v0.24.2...v0.25.0) (2020-06-16)


### Features

* **terraform-aws-elastic-beanstalk-application:** Deploy custom Elastic Beanstalk application from S3 ([0323cea](///commit/0323cea4f7e9327ba38dfa01aa0e981b502e97df))
* **terraform-aws-elastic-beanstalk-environment:** Option to set Elastic Beanstalk Application Version to use in deployment ([dd44b75](///commit/dd44b7562a034591c093b6288d9875c25c2e09f6))


### Bug Fixes

* **terraform-aws-s3-bucket-object:** Rename names from outputs ([146257a](///commit/146257ae7f232bee6c130a6cf36435b4e75f70d3))
* **terraform-aws-s3-bucket-object:** Uploading .zip files not working, try with content_base64 instead content ([1a7a82f](///commit/1a7a82fccf3a638e2724f515fa8cd02265cb390c))
* **terraform-aws-s3-bucket-object:** Uploading .zip files not working, try with source instead content ([c3bb2c0](///commit/c3bb2c00e901e9e44a9774227b0913967c73c411))


### Style

* **terraform-aws-rds-cluster:** Update README.md; Describe variable ([7e5dcbc](///commit/7e5dcbc18b79f0bc9c0eccf4e94533fdde6c1843))
* **terraform-aws-s3-bucket-object:** Add variable description ([9979ddc](///commit/9979ddcc1e7836742b493082656ee4e562240c98))


### Chore

* **release): 0.24.3 - fix(terraform-aws-s3-bucket-object:** Uploading .zip files ([d43310f](///commit/d43310faa49f868960257ffddc197f6bb12a9f7b))

### [0.24.3](///compare/v0.24.2...v0.24.3) (2020-06-12)


### Bug Fixes

* **terraform-aws-s3-bucket-object:** Uploading .zip files not working, try with content_base64 instead content ([1a7a82f](///commit/1a7a82fccf3a638e2724f515fa8cd02265cb390c))
* **terraform-aws-s3-bucket-object:** Uploading .zip files not working, try with source instead content ([c3bb2c0](///commit/c3bb2c00e901e9e44a9774227b0913967c73c411))


### Style

* **terraform-aws-rds-cluster:** Update README.md; Describe variable ([7e5dcbc](///commit/7e5dcbc18b79f0bc9c0eccf4e94533fdde6c1843))
* **terraform-aws-s3-bucket-object:** Add variable description ([9979ddc](///commit/9979ddcc1e7836742b493082656ee4e562240c98))

### [0.24.2](///compare/v0.24.1...v0.24.2) (2020-06-10)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Update Lambda function, conditional check for enable_automatic_rotation fixed ([f4d479f](///commit/f4d479f01b832f683892c2257b565b38cbc1a591))

### [0.24.1](///compare/v0.24.0...v0.24.1) (2020-06-10)


### Chore

* **terraform-aws-rds-cluster:** Update security group Name tag ([7fe5292](///commit/7fe5292261b6306266eb6d7957d5f5f6dc89ab0a))

## [0.24.0](///compare/v0.23.0...v0.24.0) (2020-06-10)


### Features

* **terraform-aws-rds-cluster:** Option to set backtrack window; Rename rds cluster parameter group ([f8bbcdd](///commit/f8bbcdd8ff801ba0a727b97e9e758d7bda48823d))


### Chore

* Update CHANGELOG.md ([51b3b08](///commit/51b3b08879d4e1cc6775c09562348ebfd3afdc4e))
* **release:** 0.23.0 - Option to enable/disable secret automatic rotation. Lambda functio for rotating secret updated ([d6faa21](///commit/d6faa21d7ab1a0b2364c966e4f42ad600000b205))
* **release:** 0.23.0 - Option to set backtrack window; Rename rds cluster parameter group ([6da3600](///commit/6da360033a37298801d8c861af813ab1725a74e8))
* **terraform-aws-rds-cluster:** Add lifecycle create_before_destroy for aws_db_parameter_group, aws_rds_cluster_parameter_group and aws_db_subnet_group ([14d27ba](///commit/14d27ba3200ff28ec395e1612339d848d16266e0))

## [0.23.0](///compare/v0.22.0...v0.23.0) (2020-05-25)


### Features

* **terraform-aws-lambda-rotate-secret:** We can now enable or disable secret automatic rotation by bool type parameter setting enable_automatic_rotation ([de94d99](///commit/de94d99350e910696ded7ba433914809bfe5248d))
* **terraform-aws-secret-manager:** Option to specifie the number of days between automatic scheduled rotations of the secret. ([a43c005](///commit/a43c005afda2309ef0ae9b8f68a03fe69c6d020a))


### Bug Fixes

* **terraform-aws-secret-manager:** Dynamically define rotation_rules ([2bbfe55](///commit/2bbfe55666164508aa5d9e033482670d119311f8))
* **terraform-aws-secret-manager:** Dynamically define rotation_rules ([83b1e9b](///commit/83b1e9b1dcf61171e23c1d0fe37040c2969423b9))


### Chore

* **terraform-aws-secret-manager:** Disable ignore_changes for rotation_lambda_arn ([ec1dc88](///commit/ec1dc880b92c6648c4e28e81d1d45bd62e354ad4))
* **terraform-aws-secret-manager:** Disable ignore_changes for rotation_lambda_arn ([ae3d8f2](///commit/ae3d8f2ccb0028098c2982436b7e73f9d6fdf783))
* **terraform-aws-secret-manager:** Enable back ignore_changes for rotation_lambda_arn ([2f167de](///commit/2f167de0fcfb7fcd832f83cb7dedb924286e0edd))
* **terraform-aws-secret-manager:** Move rotation_days to variables.tf ([65ce997](///commit/65ce9970ffd445955d440028a6f797d7b6ad5188))

### [0.21.3](///compare/v0.21.2...v0.21.3) (2020-05-22)


### Features

* **terraform-aws-rds-cluster:** Create database user ([612a0a2](///commit/612a0a233f33a1fd131ca4e1ce4e4327c42e2745))


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** fix elastic_beanstalk_mail_server_env_settings value type map -> list ([e72c05c](///commit/e72c05c4e44dbfe2b0f06bac9de39043d6fb426a))
* **terraform-aws-rds-cluster:** Add missing mysql provider ([51672ff](///commit/51672ffc64c9b03fa904d5d2fa06c67fe3357a8e))
* **terraform-aws-rds-cluster:** Because aws_rds_cluster.default has count set, its attributes must be accessed on specific instances ([f2c3123](///commit/f2c3123d2795ba2b0472f8fd67b66c0208ef374f))


### Refactor

* **terraform-aws-elastic-beanstalk-environment:** Decouple EB environment variables settings and ignore changes for RDS password ([98fa223](///commit/98fa223b724bc6261b6a2be95a541b07ee28f897))


### Docs

* **terraform-aws-rds-cluster:** Document why it's not possible to use mysql provider in form of comment ([8049765](///commit/8049765785aafc16b09cc2d85bf148d7286d60c1))


### Chore

* **release:** 0.22.0 - Decouple EB environment variables settings ([333cee8](///commit/333cee8ee9d66e72313ddec778eaaaece12c64c8))
* **terraform-aws-elastic-beanstalk-environment:** Can't use map/list in ignore_changes block ([c0de896](///commit/c0de896590b98aa4274c2371c8bc4aff3ab6b378))

## [0.22.0](///compare/v0.21.2...v0.22.0) (2020-05-22)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** fix elastic_beanstalk_mail_server_env_settings value type map -> list ([e72c05c](///commit/e72c05c4e44dbfe2b0f06bac9de39043d6fb426a))


### Refactor

* **terraform-aws-elastic-beanstalk-environment:** Decouple EB environment variables settings and ignore changes for RDS password ([98fa223](///commit/98fa223b724bc6261b6a2be95a541b07ee28f897))


### Chore

* **terraform-aws-elastic-beanstalk-environment:** Can't use map/list in ignore_changes block ([c0de896](///commit/c0de896590b98aa4274c2371c8bc4aff3ab6b378))

### [0.21.2](///compare/v0.21.1...v0.21.2) (2020-05-21)


### Bug Fixes

* deleted left unused dependency (remote state keys) ([8aab820](///commit/8aab8203656737cae5ace2f09dfdcfd7fb595cf9))
* deleted left unused dependency (remote state keys) ([88b35a8](///commit/88b35a8f9dc2bdbb98e09c5182aea7653a39d131))

### [0.21.1](///compare/v0.21.0...v0.21.1) (2020-05-21)


### Bug Fixes

* **terraform-aws-rds-cluster:** delete left unused dependency ([6235190](///commit/6235190736398513f9faa2812dd3102c64baffbc))

## [0.21.0](///compare/v0.20.1...v0.21.0) (2020-05-18)


### Chore

* **release.sh:** Update release script ([79eaced](///commit/79eaced725eb71562e67afd1ea3437d61baa6fd7))
* **release.sh:** Update release script ([a06f5dd](///commit/a06f5dd14e7fbbd106058e82ae99d2a5c4a37291))
* Update dependency module source version v0.20.1 -> v0.21.0 ([788cd69](///commit/788cd69fb26ef30e7621a6e34f5bcd2491cb8050))
* **terraform-aws-iam-s3-user/terraform-aws-s3-bucket:** Submodules are now pointing to relative module paths ([9e731e5](///commit/9e731e5eafca679f0542aaefded7eece3080b21a))

### [0.20.1](///compare/v0.20.0...v0.20.1) (2020-05-17)


### Bug Fixes

* **terraform-aws-elasticache-redis:** Remove outputs from DNS ([c2bc5a4](///commit/c2bc5a401e5526a1b2802c08f94e9d2ff1626707))


### Chore

* Update dependency module source version v0.20.0 -> v0.20.1 ([ff41e1a](///commit/ff41e1ab878ad062863bef62429ded279f2e7f0f))

## [0.20.0](///compare/v0.19.0...v0.20.0) (2020-05-17)


### Features

* **terraform-aws-elasticache-redis:** Remove submodule module.dns -> dependency is now being set via terragrunt dependency {} block ([f16e309](///commit/f16e30978afe5c6dab021da8fb99f7ce22da3da9))


### Chore

* Update dependency module source version v0.19.0 -> v0.20.0 ([9548e5a](///commit/9548e5ad4716e65a4d861bfb99fcaee50e94a88a))

## [0.19.0](///compare/v0.18.0...v0.19.0) (2020-05-16)


### Features

* terraform-null-label for setting common tags not used any more ([e03dda5](///commit/e03dda5560b52946159a5cbd59218d96eb2e5f70))


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** Do not use local.tags ([149c948](///commit/149c948d4623a931b8bee19cd621162200b067d1))
* **terraform-aws-elastic-beanstalk-environment:** re-format aws_ssm_activation resource name ([f70b7c2](///commit/f70b7c21c35bcdf89b4303f1029996622823d237))
* **terraform-aws-rds-cluster:** re-format cluster instance identifier name ([2c152e4](///commit/2c152e4931fe03e8a5a0a599d4737eee351d8cfd))


### Chore

* Update dependency module source version v0.18.0 -> v0.19.0 ([7b25c44](///commit/7b25c444b57d02703e5a16bc7de856fe789eee00))
* **terraform-aws-cloudwatch-event:** merge var.tags and name ([ed33d0b](///commit/ed33d0b27bad4545f88f91dc24359b8027d8385c))
* **terraform-aws-elastic-beanstalk-environment:** disable null label ([a420bc9](///commit/a420bc97ded61411c56266dc6b03505f3f1a34e7))
* **terraform-aws-elastic-beanstalk-environment:** modify EB environment name ([1c24537](///commit/1c2453700af822f9aed825f99bc2fb224b471476))
* **terraform-aws-elasticache-redis:** disable null label ([59e974f](///commit/59e974f9dad6f75384f927e8b6b0741e1ec23507))
* **terraform-aws-elasticache-redis:** disable null label ([0138ad5](///commit/0138ad5ccdbcb4d76e272baf7ae891e3540157f7))
* Remove null-label module from repository ([865f054](///commit/865f054f602972a6620f4fe820392d3ba7ffa494))
* **release-scripts:** Update stable.sh for re-tagging commit with stable tag ([0be34ad](///commit/0be34ad269654721929cc379cfa17517f8a5e081))
* **terraform-aws-elasticache-redis:** modify CW metric name ([5789056](///commit/5789056011a01287b3a80a6972da1900e0328f9b))
* **terraform-aws-iam-assumable-service-role:** disable null label ([f7c796c](///commit/f7c796c98c5e295a7e3c5cea713463495d5fad23))
* **terraform-aws-iam-assumable-service-role:** disable null label ([81c7313](///commit/81c73130d0a4abd0564d5805ea3657b41d9be8fa))
* **terraform-aws-iam-system-user:** disable null label ([f4f327a](///commit/f4f327a02a98e6a9b53e65cae974efd867386085))
* **terraform-aws-iam-system-user:** disable null label ([09f6aab](///commit/09f6aab0548c5b8bc3395111939bd9736acf0259))
* **terraform-aws-kms-key:** disable null label ([a8b08ea](///commit/a8b08eafb3bc1042c06ce39b7b99b0785b663876))
* **terraform-aws-kms-key:** disable null label ([a300721](///commit/a3007217a236a0bf8ec9431a00b8ec9facea4237))
* **terraform-aws-lambda-rotate-secret:** disable null label ([b9feb3b](///commit/b9feb3b8b07e4d88b3ebe1fd68aad7277e78f567))
* **terraform-aws-lambda-rotate-secret:** disable null label ([044cdcb](///commit/044cdcbd441553276e00b486a6e4e62e48577cc8))
* **terraform-aws-lambda-rotate-secret:** disable null label ([44446de](///commit/44446de9c28f93b979bf0a06dfb0c2980eea6fa3))
* **terraform-aws-rds-cluster:** disable null label ([5c87e6a](///commit/5c87e6a43243259f2a39046a16a3af0b7492b70d))
* **terraform-aws-rds-cluster:** disable null label ([4db4619](///commit/4db46196cee99eeef09a58b30cdd06c971057990))
* **terraform-aws-rds-cluster:** disable null label ([fc710ca](///commit/fc710caa3a9382ffc16c574df86e1f5ce0b3ba0a))
* **terraform-aws-route53-cluster-zone:** disable null label ([4947d4e](///commit/4947d4eb0b263675760218f7f60c30213b3e3509))
* **terraform-aws-s3-bucket:** disable null label ([114d6f3](///commit/114d6f3e9482c60c37dd511707dfbf71a9843751))
* **terraform-aws-s3-bucket:** disable null label ([98e45e5](///commit/98e45e592fd112f62029e5a50f3916c7e31f7558))
* **terraform-aws-s3-bucket-object:** disable null label ([20d270e](///commit/20d270efad4db831d9cf792000ed4c50401a14b4))
* **terraform-aws-secret-manager:** disable null label ([3bcd204](///commit/3bcd20495552af7d374148e4260611afea05913f))
* **terraform-aws-security-group:** disable null label ([8e34a0d](///commit/8e34a0d2ffbc517c810ea8908b9538fb0087ede4))
* **terraform-aws-webserver-cluster:** disable null label ([c598928](///commit/c598928dce3c7855d4f06100c7052548cb4cd4e7))

## [0.18.0](///compare/v0.17.3-alpha.3...v0.18.0) (2020-05-11)


### Bug Fixes

* **release.sh:** Fix setting correct git tag ([3ea7c77](///commit/3ea7c77efcc759d0f4d42b735c9546ab3ac9192f))
* **release.sh:** Set correct CURRENT_TAG when relese is set as --prerelease alpha ([459bfbb](///commit/459bfbb015aa3aea3ab0dfba61ed6b6f55ac24ad))


### Chore

* Update dependency module source version v0.17.3-alpha.3 -> v0.18.0 ([b77ae4d](///commit/b77ae4d833bbc5036a41d6b9e7341cddfed7cb29))

### [0.17.3-alpha.3](///compare/v0.17.3-alpha.2...v0.17.3-alpha.3) (2020-05-11)


### Chore

* Update dependency module source version v0.17.3 -> v0.17.3-alpha.3 ([29885a9](///commit/29885a9f9c23dfbe7ada7e3343e7c63d2f1baae1))

### [0.17.3-alpha.2](///compare/v0.17.3-alpha.1...v0.17.3-alpha.2) (2020-05-11)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Issue with data_archive provider when running tf plan out and tf apply in seprate pipeline stages - define triggers as argument rather then as a block ([05c0a1c](///commit/05c0a1c6756af4a9b148ba0f37cbe77dcab2f984))


### Chore

* Update dependency module source version v0.17.3 -> v0.17.3-alpha.2 ([05929e6](///commit/05929e621d4fbd48b2cd6d42902566dc9ca4c51b))

### [0.17.3-alpha.1](///compare/v0.17.3-alpha.0...v0.17.3-alpha.1) (2020-05-11)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Issue with data_archive provider when running tf plan out and tf apply in seprate pipeline stages ([33a534a](///commit/33a534a75e67de5d64263e1b59689d1e579391fb))


### Chore

* Update dependency module source version v0.17.3 -> v0.17.3-alpha.1 ([119872a](///commit/119872a707d04ebb5458d2b8689883a2cfbb1e8b))
* **release:** 0.17.3 ([fd0e377](///commit/fd0e377f2dcb256d7319f3da637c39af498c1a39))
* add stable.sh script for re-tagging commit ([05ed40e](///commit/05ed40e46fa50740f4cec1dc3d575889f1c1f8c0))
* Update dependency module source version v0.17.3-alpha.0 -> v0.17.3 ([70780fb](///commit/70780fb32d17c0e31563c5d76c255072798e8265))

### [0.17.3](///compare/v0.17.3-alpha.0...v0.17.3) (2020-05-11)


### Chore

* add stable.sh script for re-tagging commit ([05ed40e](///commit/05ed40e46fa50740f4cec1dc3d575889f1c1f8c0))
* Update dependency module source version v0.17.3-alpha.0 -> v0.17.3 ([70780fb](///commit/70780fb32d17c0e31563c5d76c255072798e8265))

### [0.17.3-alpha.0](///compare/v0.17.2...v0.17.3-alpha.0) (2020-05-11)


### Features

* **release.sh:** Option to release as prerelease alpha ([ef2f06d](///commit/ef2f06d7a3ba7892cbb64fa7512786deebb48b38))
* **release.sh:** Option to release as prerelease alpha ([475b3dd](///commit/475b3dd35f66d2a5ab889002ebc9283948851899))
* **release.sh:** Option to release as prerelease alpha ([c196f34](///commit/c196f343399ebf1355c8e3af1a2bf4ab06b93706))


### Chore

* Update dependency module source version v0.17.2 -> v0.17.3 ([259cb01](///commit/259cb013fca096123e87aae65c8fef92aca88c9a))
* Update dependency module source version v0.17.2 -> v0.17.3 ([89b569f](///commit/89b569ff7b5b8467f7e980f4e940b97cbfedebbd))
* Update dependency module source version v0.17.2 -> v0.17.3-alpha.0 ([674ef99](///commit/674ef996d8f5b29d8287bf9b5752dc8fa44fb663))
* Update versions.tf - added archive provider ([ff5fa13](///commit/ff5fa13de591505cf707f9dd652f30ba1dfa74be))
* Update versions.tf - added archive provider ([305a1ba](///commit/305a1ba7e85b0a5966614a0ab872de7acbe893ba))

### [0.17.3-alpha.0](///compare/v0.17.2...v0.17.3-alpha.0) (2020-05-11)


### Features

* **release.sh:** Option to release as prerelease alpha ([ef2f06d](///commit/ef2f06d7a3ba7892cbb64fa7512786deebb48b38))
* **release.sh:** Option to release as prerelease alpha ([475b3dd](///commit/475b3dd35f66d2a5ab889002ebc9283948851899))
* **release.sh:** Option to release as prerelease alpha ([c196f34](///commit/c196f343399ebf1355c8e3af1a2bf4ab06b93706))


### Chore

* Update dependency module source version v0.17.2 -> v0.17.3 ([89b569f](///commit/89b569ff7b5b8467f7e980f4e940b97cbfedebbd))
* Update versions.tf - added archive provider ([305a1ba](///commit/305a1ba7e85b0a5966614a0ab872de7acbe893ba))

### [0.17.2](///compare/v0.17.1...v0.17.2) (2020-05-11)


### Style

* **terraform-null-label:** Format maint.tf ([e5a6213](///commit/e5a62130e123fde7605888f9b4e1f23f32712df4))


### Chore

* Update dependency module source version v0.17.1 -> v0.17.2 ([794c04e](///commit/794c04e06e7f59ab22c192f147bc4827610776c7))

### [0.17.1](///compare/v0.17.0...v0.17.1) (2020-05-10)


### Chore

* Update dependency module source version v0.17.0 -> v0.17.1 ([3a8661b](///commit/3a8661bb500c8954bec7f6503d86dfb1ec15ddcb))
* **terraform-aws-lambda-rotate-secret): Add required terrafrom provider (version:** archive ([ba23b09](///commit/ba23b0969f7f32cced77d420659b139699380c93))

## [0.17.0](///compare/v0.16.0...v0.17.0) (2020-05-06)


### Features

* **terraform-aws-elastic-beanstalk-application:** appversion_lifecycle can now be defiend ([e64bc95](///commit/e64bc95e00d79719504042f4ec46c535effe8bcf))


### Chore

* Update dependency module source version v0.16.0 -> v0.17.0 ([fa0fb5d](///commit/fa0fb5df20fd832fc52d651eebe41f936e1056de))

## [0.16.0](///compare/v0.15.37...v0.16.0) (2020-05-04)


### Chore

* Update dependency module source version v0.15.37 -> v0.16.0 ([e38f243](///commit/e38f243b30a2461323cf0bf2a9043342124ba557))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function - add ToDo comment ([497fdc1](///commit/497fdc120c40a729fe4db96180fb96840a504135))
* delete old module terraform-aws-secret-manager-with-rotation ([08c7686](///commit/08c7686e892827ce827fdaa05b1899ebd17ce29f))

### [0.15.37](///compare/v0.15.36...v0.15.37) (2020-05-03)


### Bug Fixes

* **terraform-aws-secret-manager:** --region command not found - because it was miss placed at the end of command ([f9366ca](///commit/f9366ca8e147ad2889fba9da2cb3f2654ef99b11))


### Chore

* Update dependency module source version v0.15.36 -> v0.15.37 ([9a656dd](///commit/9a656dd3f7f3b8cc96160f137868bb30cf63a45b))

### [0.15.36](///compare/v0.15.35...v0.15.36) (2020-05-03)


### Chore

* Update dependency module source version v0.15.35 -> v0.15.36 ([bd084bb](///commit/bd084bb57a46ea1c1f3aef8058d2e02af9944002))
* **terraform-aws-rds-cluster:** add option for setting auto_minor_version_upgrade parameter ([cf6850e](///commit/cf6850e43d26a2c9d3c59bb35ffbd3ef453d505d))

### [0.15.35](///compare/v0.15.34...v0.15.35) (2020-05-03)


### Chore

* Update dependency module source version v0.15.34 -> v0.15.35 ([f3c2532](///commit/f3c25322c23eb721d16fe1cdb883c13ba3a98c64))
* **terraform-aws-lambda-rotate-secret:** Add tags to Lambda function ([f394b24](///commit/f394b24ad4ae3a1aacc297f2046d1576bfa1d3b0))

### [0.15.34](///compare/v0.15.33...v0.15.34) (2020-05-03)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** local rds_password expression ([eceb898](///commit/eceb898767e812f84b2187dd9af9038efec75b9f))


### Chore

* Update dependency module source version v0.15.33 -> v0.15.34 ([e8a5554](///commit/e8a5554b14f2b2abf83d3914a105e2cefc357b19))

### [0.15.33](///compare/v0.15.32...v0.15.33) (2020-05-03)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** RDS_PASWORD was missing in locals.tf ([ffe142c](///commit/ffe142c1e8c20b528df1734e3a2ae36c1b3cafb8))


### Chore

* Update dependency module source version v0.15.32 -> v0.15.33 ([cff096c](///commit/cff096c9942b3566c0cd2e96b2b8bff4e56876c3))

### [0.15.32](///compare/v0.15.31...v0.15.32) (2020-05-03)


### Chore

* Update dependency module source version v0.15.31 -> v0.15.32 ([037ca97](///commit/037ca97a9bd2a557c972c1770ab9d1a8236ce72b))
* **terraform-aws-elastic-beanstalk-environment:** Format locals.tf, update rds_password local variable ([88aadd0](///commit/88aadd05fa5d42592cd5a65ac1158e6e52bfd691))

### [0.15.31](///compare/v0.15.30...v0.15.31) (2020-05-02)


### Chore

* Update dependency module source version v0.15.30 -> v0.15.31 ([9454c84](///commit/9454c847963329bbd68b7fb2ceb6fa8a34a4f077))
* **terraform-aws-secret-manager:** After created, secret will be rotated automatically ([685feaa](///commit/685feaace48c86f39d6b5808a3abbc5cebdd0054))

### [0.15.30](///compare/v0.15.29...v0.15.30) (2020-05-02)


### Chore

* Update dependency module source version v0.15.29 -> v0.15.30 ([1cd0413](///commit/1cd04135cbfc62aee8269c7d848454dac54d360e))
* **terraform-aws-secret-manager:** Secret will now ignore changes to rotation_lambda_arn - avoid setting/enabling automatic rotation ([34c06d8](///commit/34c06d8dd35918bf932912369246d38fd1d929de))

### [0.15.29](///compare/v0.15.28...v0.15.29) (2020-05-02)


### Chore

* Update dependency module source version v0.15.28 -> v0.15.29 ([4877883](///commit/48778837c1bfad9331eca87f579ac84fdc566167))
* **terraform-aws-elasticache-redis:** Add region var ([a5534bd](///commit/a5534bdd820163a2b6598d3685e81c606fceff0e))

### [0.15.28](///compare/v0.15.27...v0.15.28) (2020-05-01)


### Chore

* Update dependency module source version v0.15.27 -> v0.15.28 ([1fc8edb](///commit/1fc8edba190fba1236ae360991e850d35536a975))
* **terraform-aws-secret-manager:** Disable rotating secret from terraform - delete null_resource.secret ([dd13119](///commit/dd131192de4abb147a9cf22b8af34e1c2bc93b12))
* **terraform-aws-secret-manager:** Update secret rotation null resource ([d29c059](///commit/d29c059910f984482b2d81aa626bc4deaa039979))

### [0.15.27](///compare/v0.15.26...v0.15.27) (2020-05-01)


### Chore

* Update dependency module source version v0.15.26 -> v0.15.27 ([c7dd110](///commit/c7dd110e82eac7ccae4f1820d1365e66d94441a6))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function - disable/cancle secret rotation ([089d7d2](///commit/089d7d2c4e20ed9d15bfe2fb2342f1b7edc919c1))
* **terraform-aws-secret-manager:** Disable cancle secret rotation - it's set in Lambda function ([accc13f](///commit/accc13fc5f94d9db54f28ca2ebd46817973d30ce))

### [0.15.26](///compare/v0.15.25...v0.15.26) (2020-05-01)


### Chore

* Update dependency module source version v0.15.25 -> v0.15.26 ([cac723f](///commit/cac723fd9dac7e982777e5a5d7ecd2658eb929ae))
* **terraform-aws-secret-manager:** Cancle secret rotation after rotating secret - disable automatic rotation ([a603637](///commit/a603637a314693fffc373018b8d1aedbf34a9a7f))

### [0.15.25](///compare/v0.15.24...v0.15.25) (2020-05-01)


### Chore

* Update dependency module source version v0.15.24 -> v0.15.25 ([9257f7e](///commit/9257f7eed748002504cd00a77cc45a79b74fbf6a))
* **terraform-aws-lambda-rotate-secret:** Update Lambda functio - describe methodes, fix typos ([5ffbcf3](///commit/5ffbcf37a456f6004b47b2e25b62ce2aadf156b4))

### [0.15.24](///compare/v0.15.23...v0.15.24) (2020-05-01)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Update Lambda function - fix error: servcie:client not defined ([f6fd285](///commit/f6fd2850bf9ea140101b70c14a83f7483882313a))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function - fix error: token name not found/defiend ([83d0ab2](///commit/83d0ab2b99ae303ab506fd3e0ca22671df185092))


### Chore

* Update dependency module source version v0.15.23 -> v0.15.24 ([d54b299](///commit/d54b29998f503ce65702ca3850790467ab123718))

### [0.15.23](///compare/v0.15.22...v0.15.23) (2020-04-29)


### Chore

* Update dependency module source version v0.15.22 -> v0.15.23 ([8f28c8d](///commit/8f28c8d2858bfc7647457906cb75141428eec20a))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function; Set RDS_PASSWORD from Secrets Manager ([28d2f6a](///commit/28d2f6aaffdf0e3a95b9bd8757f68edc8884c8bc))

### [0.15.22](///compare/v0.15.21...v0.15.22) (2020-04-29)


### Chore

* Update dependency module source version v0.15.21 -> v0.15.22 ([82d6308](///commit/82d63082cbfba2c18d70f7ea73646b27b7115e5f))
* **terraform-aws-elastic-beanstalk-environment:** disable ignore changes on environment tags ([e6f528f](///commit/e6f528fde00adc050007d8ab1606111626335bb9))

### [0.15.21](///compare/v0.15.20...v0.15.21) (2020-04-28)


### Chore

* Update dependency module source version v0.15.20 -> v0.15.21 ([757f1ed](///commit/757f1edeb465af910d6bd82c85d99f8efebbff9c))
* **terraform-aws-elastic-beanstalk-environment:** Idea for not displaying RDS passw in EB console didn't work. Reverting back to settings as before ([11451eb](///commit/11451eba5e6669e892aaa989416d404af9d4ce7d))

### [0.15.20](///compare/v0.15.19...v0.15.20) (2020-04-27)


### Chore

* Update dependency module source version v0.15.19 -> v0.15.20 ([324c3b6](///commit/324c3b67d6c44d71b44b16ed57554b5e52aea0aa))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function - EB env will be updated after secret rotation only if secret is part of same RDS_STACK as set in EB env ([b9922fa](///commit/b9922fa89ac311d5d05e9c6249f0e7ba0f46a992))

### [0.15.19](///compare/v0.15.18...v0.15.19) (2020-04-27)


### Chore

* Update dependency module source version v0.15.18 -> v0.15.19 ([054b159](///commit/054b159e06eb315c5636ee034bf698831e8dfefc))
* **terraform-aws-secret-manager:** Option to set custom name for tag ([e814e70](///commit/e814e7089b1feb38ee450db6d44a0ded2573bf67))

### [0.15.18](///compare/v0.15.17...v0.15.18) (2020-04-26)


### Style

* **terraform-aws-elastic-beanstalk-environment:** code cleanup ([c3dd8d3](///commit/c3dd8d38eb0f638f54867a9bbc2b6b5d7b730c84))


### Chore

* Update dependency module source version v0.15.17 -> v0.15.18 ([828ecbd](///commit/828ecbde3ed7e8241b274c331e4721b1863ec788))

### [0.15.17](///compare/v0.15.16...v0.15.17) (2020-04-26)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** A local value with the name app has not been declared. ([9f74d11](///commit/9f74d116bc40cd5f66afb7d6c4ba744588b32aea))


### Chore

* Update dependency module source version v0.15.16 -> v0.15.17 ([fb8cf24](///commit/fb8cf24390c7d66c1b96a3cf3f2fbca453c26d26))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function; Install jq; ([aabf62b](///commit/aabf62bda721fbd0b6af79024683e1fdf93a9231))

### [0.15.16](///compare/v0.15.15...v0.15.16) (2020-04-26)


### Chore

* **terraform-aws-lambda-rotate-secret:** Update Lambda function; Use EB Environment Name instead of id ([d37cfae](///commit/d37cfaec1f4b2b61d5ca4e2513e7923e5114d554))
* Update dependency module source version v0.15.15 -> v0.15.16 ([e01cca5](///commit/e01cca5829dfc0aed610704ad0c6589bcac68247))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function; Use EB Environment Name instead of id ([00c46c8](///commit/00c46c8cf705f274ed2d3f5957743b8b13d76f71))

### [0.15.16](///compare/v0.15.15...v0.15.16) (2020-04-26)


### Chore

* Update dependency module source version v0.15.15 -> v0.15.16 ([e01cca5](///commit/e01cca5829dfc0aed610704ad0c6589bcac68247))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function; Use EB Environment Name instead of id ([00c46c8](///commit/00c46c8cf705f274ed2d3f5957743b8b13d76f71))

### [0.15.15](///compare/v0.15.14...v0.15.15) (2020-04-26)


### Refactor

* **terraform-aws-elastic-beanstalk-environment:** Module dependencies will now be set directly in terragrunt using dependency {} block ([bb83aa9](///commit/bb83aa9b879ffb6ba72b3a9f48d6957ba73ea2a2))


### Chore

* Update dependency module source version v0.15.14 -> v0.15.15 ([fc440f5](///commit/fc440f58ec326a99859dce83d3dfa72c05430f0c))
* **terraform-aws-lambda-rotate-secret:** Update Lambda function. Set RDS_PASSWORD for EB environment variable ([0b817d8](///commit/0b817d84cd49969bbd8f64c90a5187a38b493445))

### [0.15.14](///compare/v0.15.13...v0.15.14) (2020-04-26)


### Bug Fixes

* **terraform-aws-secret-manager:** Only reset RDS master password when rotating secret for RDS master user -> admin ([1f070ca](///commit/1f070ca7496bd13664c7ee22dd8b5e78ef2da972))


### Chore

* Update dependency module source version v0.15.13 -> v0.15.14 ([4c4ea66](///commit/4c4ea660095859fb63e603c5cdbd2e253050b0de))

### [0.15.13](///compare/v0.15.12...v0.15.13) (2020-04-26)


### Chore

* Update dependency module source version v0.15.12 -> v0.15.13 ([cc2b7d7](///commit/cc2b7d7034e409e10cd3b2550b06420d45cf26fd))
* **terraform-aws-security-group:** Add option for setting custom name or use default set in moudule ([2ce8745](///commit/2ce8745f902a92e0528821ada1c88ed1dde83513))

### [0.15.12](///compare/v0.15.11...v0.15.12) (2020-04-25)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Update lambda function ([7479bf7](///commit/7479bf7f0ca3fc186bba6fba5b06505ab465ade7))


### Chore

* Update dependency module source version v0.15.11 -> v0.15.12 ([07653e9](///commit/07653e94a0876d7862783ad3e9e46d26473db8a8))

### [0.15.11](///compare/v0.15.10...v0.15.11) (2020-04-25)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Update lambda function ([cf003fd](///commit/cf003fdc1bb5c131d049f53065303fb02dcc22bc))


### Chore

* Update dependency module source version v0.15.10 -> v0.15.11 ([3cd9341](///commit/3cd934143893681bd79f3096bf9150bae2d3e47e))

### [0.15.10](///compare/v0.15.9...v0.15.10) (2020-04-25)


### Chore

* Update dependency module source version v0.15.9 -> v0.15.10 ([bd45069](///commit/bd45069e7df5cf0ba5a8fb66307f1fffebfa0caa))
* **terraform-aws-secret-manager:** Add option to use default or custom resource name ([c520cf0](///commit/c520cf0bf1482f3a7a18fe73859af3e2a6c96d97))

### [0.15.9](///compare/v0.15.8...v0.15.9) (2020-04-25)


### Chore

* Update dependency module source version v0.15.8 -> v0.15.9 ([ee621a6](///commit/ee621a677f2b37a69bc64faef21738f41aadd890))
* **terraform-aws-lambda-rotate-secret:** Update lambda function - do not update Elastic Beanstlak environment if secret has username different that 'APP-NAME' ([aa821eb](///commit/aa821ebe4c7ccfdf01a50450089278f38b86e7cb))

### [0.15.8](///compare/v0.15.7...v0.15.8) (2020-04-24)


### Bug Fixes

* **terraform-aws-rds-cluster:** Because aws_rds_cluster.default has count set, its attributes must be accessed on specific instances. ([4a7069e](///commit/4a7069ed90553a8895a51a29fc28c2b27d1114dc))


### Chore

* Update dependency module source version v0.15.7 -> v0.15.8 ([d1d3843](///commit/d1d38436c6dadf095faae664b8dde3cbd34f555f))

### [0.15.7](///compare/v0.15.6...v0.15.7) (2020-04-24)


### Chore

* Update dependency module source version v0.15.6 -> v0.15.7 ([059d785](///commit/059d7852db90027bb5bb0ac8125c8c85c44d912f))
* **terraform-aws-rds-cluster:** Add additional RDS outputs: engine, engine_version, db_port ([1f0adea](///commit/1f0adea0dd60d3aec8553a97c9b4451b6b5d5142))

### [0.15.6](///compare/v0.15.5...v0.15.6) (2020-04-24)


### Chore

* Update dependency module source version v0.15.5 -> v0.15.6 ([464a1cf](///commit/464a1cfcee9922304958a785c1d4fb52c4022f6a))
* **terraform-aws-rds-clustet:** Use var.cluster_size for setting number of cluster instances instead of local variables ([a02e917](///commit/a02e917f30896bea94f9a7bde6301073b45c6d0a))

### [0.15.5](///compare/v0.15.4...v0.15.5) (2020-04-24)


### Chore

* Update dependency module source version v0.15.4 -> v0.15.5 ([a801667](///commit/a8016678c8a1d26d9bd2b08b81b0bea6caf991f7))
* **terraform-aws-rds-cluster:** delete locals for DNS route53 entry neeeded in previous module version; add port varible to aws_rds_cluster ([6af48a4](///commit/6af48a4bb2c4797cc1ab13b5fc354e0feb057125))

### [0.15.4](///compare/v0.15.3...v0.15.4) (2020-04-22)


### Chore

* Update dependency module source version v0.15.3 -> v0.15.4 ([e1598fe](///commit/e1598fe9b568811f0bb23beb729be6da1c91ad82))
* **terraform-aws-rds-cluster:** set defualt value for cluster_size to null ([67b0d44](///commit/67b0d441f494bc09d6753d42bce0f25a16448ee4))

### [0.15.3](///compare/v0.15.2...v0.15.3) (2020-04-22)


### Chore

* Update dependency module source version v0.15.2 -> v0.15.3 ([2c7c023](///commit/2c7c023f53f9e563d177bb0fe23f87a4209487e8))
* **terraform-aws-secret-manager:** remove create_before_destroy from null_resource and aws_secretsmanager_secret_version ([650487c](///commit/650487cb93ce5100a1483ff495a8f7a5745ce608))

### [0.15.2](///compare/v0.15.1...v0.15.2) (2020-04-22)


### Chore

* Update dependency module source version v0.15.1 -> v0.15.2 ([d271541](///commit/d2715416af0eefcb0e81bd37f55aa34f47085fcb))
* **terraform-aws-secret-manager:** aws_secretsmanager_secret_version will now ignore any changes made in secret_string ([35c759d](///commit/35c759d890e983898aa03f8b6def815114b7a33d))

### [0.15.1](///compare/v0.15.0...v0.15.1) (2020-04-22)


### Chore

* Update dependency module source version v0.15.0 -> v0.15.1 ([b5e30a9](///commit/b5e30a9497dfe57a454c5484747f1d5cc46c2a46))
* **terraform-aws-secret-manager:** null_resource now depends on secret and secret version resource; null_resource ha lifecycle create_before_destroy; ([1b57786](///commit/1b5778651f4b5e0d31b596850fd17d72f36e6adc))

## [0.15.0](///compare/v0.14.3...v0.15.0) (2020-04-22)


### Chore

* Update dependency module source version v0.14.3 -> v0.15.0 ([1397244](///commit/139724418904823c618956d2f94e4c75855a3eb2))
* **terraform aws provider:** Update provider version from 2.48.0 -> 2.58.0 ([32d7e1a](///commit/32d7e1a720746e04fcb36fa3bcf256041610fe70))

### [0.14.3](///compare/v0.14.2...v0.14.3) (2020-04-22)


### Bug Fixes

* **terraform-aws-rds-cluster:** set master_password in ignore_changes instead var.master_password ([e9692b1](///commit/e9692b1c35d3482e1efa0e36ecbb8930aa2046aa))


### Chore

* Update dependency module source version v0.14.2 -> v0.14.3 ([ff45fb1](///commit/ff45fb112b2fbe3731bc616ce0e8eb7d6f0e633f))

### [0.14.2](///compare/v0.14.1...v0.14.2) (2020-04-22)


### Chore

* update modules version to correct version ([2bd0302](///commit/2bd0302e05d82a8243622cb48f9224d81f9136ba))
* **release:** 0.14.2 - null reosurce will now reset database password before rotating secret, ;  Ignore admin password changes ([d4420d8](///commit/d4420d841312f695b97f57b7bd1a15f4a26f76fb))
* **terraform-aws-elastic-beanstalk-environment:** Update loals.tf ([1c46b76](///commit/1c46b76f410d08c4fb65eb020e39fb4ce70aad38))
* **terraform-aws-rds-cluster:** Ignore admin password changes ([ce863bb](///commit/ce863bba7539ad97f4df5f76a0cbda014f54525a))
* **terraform-aws-secret-manager:** null reosurce will now reset database password before rotating secret ([419d8a0](///commit/419d8a08a969cca406a1a1dff47caa63dc157847))

### [0.14.2](///compare/v0.14.1...v0.14.2) (2020-04-22)


### Chore

* **terraform-aws-elastic-beanstalk-environment:** Update loals.tf ([1c46b76](///commit/1c46b76f410d08c4fb65eb020e39fb4ce70aad38))
* **terraform-aws-rds-cluster:** Ignore admin password changes ([ce863bb](///commit/ce863bba7539ad97f4df5f76a0cbda014f54525a))
* **terraform-aws-secret-manager:** null reosurce will now reset database password before rotating secret ([419d8a0](///commit/419d8a08a969cca406a1a1dff47caa63dc157847))

### [0.14.1](///compare/v0.14.0...v0.14.1) (2020-04-21)


### Bug Fixes

* **terraform-aws-rds-cluster:** Remove DNS outputs from outputs.tf ([38a02f0](///commit/38a02f0deac976c9db1da7d6c2db2aebb5c90246))


### Chore

* Update dependency module source version v0.14.0 -> v0.14.1 ([9bdb64c](///commit/9bdb64cc662af0214547985b8b7fd68bc6b1516d))

## [0.14.0](///compare/v0.13.5...v0.14.0) (2020-04-21)


### Refactor

* **terraform-aws-rds-cluster:** Remove submodules for creating DNS entries in route53 hosted zone ([6ed8eba](///commit/6ed8eba698485540aa74955509264490d9dd539a))


### Chore

* Update dependency module source version v0.13.5 -> v0.14.0 ([947c9b0](///commit/947c9b04b7ec17dc8011857b9fd604f93c9ad63b))

### [0.13.5](///compare/v0.13.4...v0.13.5) (2020-04-21)


### Chore

* Update dependency module source version v0.13.4 -> v0.13.5 ([fd1698f](///commit/fd1698f82b11dbeadefde1fa99865acc5cdf6582))
* **terraform-aws-rds-cluster:** Add var region to DNS modules because we have update dns hostname module ([eac01e3](///commit/eac01e3665441cb97e3a689ff8c8fe1920b3a4d7))

### [0.13.4](///compare/v0.13.3...v0.13.4) (2020-04-21)


### Bug Fixes

* **terraform-aws-route53-cluster-hostname:** Add provider.tf ([0e55178](///commit/0e55178f5e83f628460659cf4a612a9393f86b5a))


### Chore

* Update dependency module source version v0.13.3 -> v0.13.4 ([4c4bc0b](///commit/4c4bc0b4ed788681d2dd0ac07d455ab9b8fbb415))

### [0.13.3](///compare/v0.13.2...v0.13.3) (2020-04-21)


### Bug Fixes

* **terraform-aws-route53-cluster-hostname:** Add missing variable - region {} ([ce724ea](///commit/ce724eab5f72e2802c55d111fea1f8d86f412c00))


### Chore

* Update dependency module source version v0.13.2 -> v0.13.3 ([bb1c9b5](///commit/bb1c9b52a6c9f65a9e692bf5762d1d50bd63408c))

### [0.13.2](///compare/v0.13.1...v0.13.2) (2020-04-21)


### Bug Fixes

* **terraform-aws-route53-cluster-hostname:** Define a terraform backend block ([53e0bce](///commit/53e0bcef0b168e81ace5e3092a493d0506bd33c9))


### Chore

* Update dependency module source version v0.13.1 -> v0.13.2 ([8cdd87d](///commit/8cdd87da32fcbb043b76a948e63b406b3031d1c0))

### [0.13.1](///compare/v0.13.0...v0.13.1) (2020-04-21)


### Bug Fixes

* **terraform-aws-rds-cluster:** Undeclared variable in outputs.tf ([fcd962e](///commit/fcd962e5eb6149647ffc1ac8ccbf0e2e9c9d8aae))


### Chore

* Update dependency module source version v0.13.0 -> v0.13.1 ([f1ce8c2](///commit/f1ce8c23b22ebd853eb8520b85cf837d1fe58ab5))

## [0.13.0](///compare/v0.12.15...v0.13.0) (2020-04-21)


### Refactor

* **terraform-aws-rds-cluster:** decouple secret module, delete lambda security group and rmeove null resource for rotating secret ([ebb3a54](///commit/ebb3a54ac573ed7d2bef4c78182c94a647eb16b5))


### Chore

* Update dependency module source version v0.12.15 -> v0.13.0 ([f66ef82](///commit/f66ef82e6c172365596e20905347c09381a2e690))

### [0.12.15](///compare/v0.12.14...v0.12.15) (2020-04-21)


### Chore

* Update dependency module source version v0.12.14 -> v0.12.15 ([03dda41](///commit/03dda415d5d016989757c15d5295ba91ed78b207))
* **terraform-aws-lambda-rotate-secret/rotate-secret-mysql/lambda_function.py:** Update Elastic Beanstalk environment variable ([fd82af3](///commit/fd82af3701591b9951dc08fd05125c039edc72bb))
* **terraform-aws-rds-cluster:** Set RDS security group to use name_prefix instead name ([2964df5](///commit/2964df5ee93af8d583c54789083d252a1197b362))

### [0.12.14](///compare/v0.12.13...v0.12.14) (2020-04-20)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Typo in lambda_function.py ([10af2ef](///commit/10af2ef912d1b731ca5a15d841f6c37b6714af3e))


### Chore

* Update dependency module source version v0.12.13 -> v0.12.14 ([3fd6693](///commit/3fd66937c30a805493c926b290a00d6567420fbf))

### [0.12.13](///compare/v0.12.12...v0.12.13) (2020-04-20)


### Bug Fixes

* Set correct modules dependency version ([4774b43](///commit/4774b438ff51e61d574729378e3eb33a3ab55157))


### Chore

* Update dependency module source version v0.12.12 -> v0.12.13 ([912efb3](///commit/912efb38f4c9b43a9e06e33d766286c6e949dacc))

### [0.12.12](///compare/v0.12.11...v0.12.12) (2020-04-20)


### Chore

* **terraform-aws-secret-manager:** Update secret string ([5c308b3](///commit/5c308b33d4d188c66afa7d6e2fa17b11e55d6d50))

### [0.12.11](///compare/v0.12.10...v0.12.11) (2020-04-20)


### Chore

* Update dependency module source version v0.12.10 -> v0.12.11 ([a344e81](///commit/a344e8140144c3b17b4c2da5114c165338846300))
* **terraform-aws-secret-manager:** rename db_cluster_identifier to dbInstanceIdentifier (we are not able to connect to database) ([46a5e65](///commit/46a5e655f8219df07dbc636b776b4d080b0a7bd5))

### [0.12.10](///compare/v0.12.9...v0.12.10) (2020-04-20)


### Chore

* Update dependency module source version v0.12.9 -> v0.12.10 ([4d48745](///commit/4d48745e2ea34771a1155ae3a86026f0ed1e879b))
* **terraform-aws-lambda-rotate-secret:** Update lambda function - Elastic Benastlak will be updated in last step of secret rotation 'finisSecret' ([cc711e2](///commit/cc711e242b3a1f760b7655f1b22af2a14ef0b283))

### [0.12.9](///compare/v0.12.8...v0.12.9) (2020-04-19)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Typo in lambda environment key variable ([db0c68b](///commit/db0c68b98cb92fd747cd5bef3a07aa9a967426ad))
* **terraform-aws-secret-manager/main.tf:** Database engine must be set to 'mysql' in order to use rotation lambda function ([9075397](///commit/9075397db8f06c0517a168fce312a77e05da542c))


### Chore

* Update dependency module source version v0.12.8 -> v0.12.9 ([e4d813c](///commit/e4d813c6b585e819e54704e7f23d5b7b73bf9450))

### [0.12.8](///compare/v0.12.7...v0.12.8) (2020-04-19)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Update filename variable to point to correct dir ([9dc23cd](///commit/9dc23cd22c57e1ea30303778dfb170644675464b))


### Chore

* Update dependency module source version v0.12.7 -> v0.12.8 ([387bdc4](///commit/387bdc4ded9cd884b98830b38d6fc26e91594200))

### [0.12.7](///compare/v0.12.6...v0.12.7) (2020-04-19)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Put lambda function in dir, add missing pymysql module ([e106fde](///commit/e106fde23577b10d798364d25b2ded074bbaed5f))


### Chore

* Update dependency module source version v0.12.6 -> v0.12.7 ([9e8cdfa](///commit/9e8cdfaf2e134df24694d0816335fbc16f443e8b))

### [0.12.6](///compare/v0.12.5...v0.12.6) (2020-04-19)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** Unable to import module because of worng lambda handler defined. ([1b12344](///commit/1b123442c4ac1e305c494f6ffd2424ccc94573d3))


### Chore

* Update dependency module source version v0.12.5 -> v0.12.6 ([cb1e398](///commit/cb1e398eeb83ac9cfe4d3550cf37d2f210fd0924))

### [0.12.5](///compare/v0.12.4...v0.12.5) (2020-04-19)


### Chore

* Update dependency module source version v0.12.4 -> v0.12.5 ([4f7be25](///commit/4f7be253361c08a7709d1dfe688550ac3fcc33bb))
* Update dependency module source version v0.12.4 -> v0.12.5 ([368ce60](///commit/368ce6097a9512441eb345c9df7776c12d3d8216))
* **terraform-aws-secret-manager:** format secret string, add missing comma ([d976423](///commit/d976423624c100b56da4e5420c7e0ef131a3e089))

### [0.12.5](///compare/v0.12.4...v0.12.5) (2020-04-19)


### Chore

* Update dependency module source version v0.12.4 -> v0.12.5 ([368ce60](///commit/368ce6097a9512441eb345c9df7776c12d3d8216))
* **terraform-aws-secret-manager:** format secret string, add missing comma ([d976423](///commit/d976423624c100b56da4e5420c7e0ef131a3e089))

### [0.12.4](///compare/v0.12.3...v0.12.4) (2020-04-19)


### Chore

* Update dependency module source version v0.12.3 -> v0.12.4 ([12f45ca](///commit/12f45ca49c4442d4c0f57cd66f0b3549c1a0742d))
* **terraform-aws-secret-manager:** format secret string ([bca1492](///commit/bca1492bc597bb01622fcf4ed796c5c04b4ae3d6))

### [0.12.3](///compare/v0.12.2...v0.12.3) (2020-04-19)


### Chore

* Update dependency module source version v0.12.2 -> v0.12.3 ([de02366](///commit/de023667d974d97fd6ce2d2abc6ca36e655ecde8))
* **terraform-aws-secret-manager:** Update aws_secretsmanager_secret name_prefix ([4256eeb](///commit/4256eeb290d660aa65faa3ad503c0b4114dff8db))

### [0.12.2](///compare/v0.12.1...v0.12.2) (2020-04-19)


### Chore

* Update dependency module source version v0.12.1 -> v0.12.2 ([6a6b1ba](///commit/6a6b1ba182b3180f0e9e62077a31e7aa19837a3f))
* **terraform-aws-secret-manager:** Add null resource which, when db pssword is changed, will trigger secret rotation ([dd09fff](///commit/dd09fff8bebf9409fb0171b47f0686d6498722cb))

### [0.12.1](///compare/v0.12.0...v0.12.1) (2020-04-19)


### Chore

* Update dependency module source version v0.12.0 -> v0.12.1 ([dd8072f](///commit/dd8072f06bbefbbd01f30256086d477f43e6774c))
* **terraform-aws-lambda-rotate-secret:** Add test version for lambda function so we can easily switch between lambda functions ([8eebf8d](///commit/8eebf8d22683ab984680941274ee0eea9e390374))

## [0.12.0](///compare/v0.11.6...v0.12.0) (2020-04-19)


### Features

* **terraform-aws-secret-manager:** New terraform module for creating and storing secret in AWS Secrets Manager ([40050bd](///commit/40050bdf38a6285a8a3b51f1a201c6cb97cc3758))


### Chore

* Update dependency module source version v0.11.6 -> v0.12.0 ([3e48479](///commit/3e484793d56c2919202c4486200170f4aed7274d))

### [0.11.6](///compare/v0.11.5...v0.11.6) (2020-04-19)


### Chore

* **terraform-aws-lambda-rotate-secret:** Decouple lambda security group, it's now referenced as input variable ([ac64573](///commit/ac645738baaac92989156f7c1f14cce94c91daba))

### [0.11.5](///compare/v0.11.4...v0.11.5) (2020-04-19)


### Chore

* Update dependency module source version v0.11.4 -> v0.11.5 ([d788a66](///commit/d788a669bd35dd8c17f28afbaa8a2cfb15adafd2))
* **terraform-aws-lambda-rotate-secret:** Change lambda function file name ([6b58287](///commit/6b5828780d7f96fcc66b748ce154552203b37ae1))

### [0.11.4](///compare/v0.11.3...v0.11.4) (2020-04-19)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** function_name doesn't comply with restrictions, rename function filename ([4b7250a](///commit/4b7250a76d50defd5333f8afe90432df693a4f1d))


### Chore

* Update dependency module source version v0.11.3 -> v0.11.4 ([cb7489a](///commit/cb7489ac188ddd3aaaede4541a892d1d0a30cbae))

### [0.11.3](///compare/v0.11.2...v0.11.3) (2020-04-19)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** error archiving directory: could not archive directory that is a file - use source_file instead source_dir ([075c69c](///commit/075c69cb2147b1db1de363ed815c5d65bbe1cdcf))


### Chore

* Update dependency module source version v0.11.2 -> v0.11.3 ([1ed2b8d](///commit/1ed2b8df6cd67488577d219c7044cea36bf8c9e6))

### [0.11.2](///compare/v0.11.1...v0.11.2) (2020-04-19)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** error archiving directory: could not archive directory that is a file - use source_file instead source_dir ([4a68460](///commit/4a684603801f2fa0b44edd56f3bf690326642261))


### Chore

* Update dependency module source version v0.11.1 -> v0.11.2 ([29cebb8](///commit/29cebb88d9505e6b0494d68b52843f12586147f3))

### [0.11.1](///compare/v0.11.0...v0.11.1) (2020-04-19)


### Bug Fixes

* **terraform-aws-lambda-rotate-secret:** error archiving directory: could not archive directory that is a file - add .py exstension ([d870a9c](///commit/d870a9cc4fd6372090c715db150f8e34cb3afd8f))


### Chore

* Update dependency module source version v0.11.0 -> v0.11.1 ([fd45346](///commit/fd45346948f386bcf4841cb58dadc9e2523ec45a))

## [0.11.0](///compare/v0.10.17...v0.11.0) (2020-04-19)


### Features

* **terraform-aws-lambda-rotate-secret:** Terraform module for creating lambda function used for rotating secret ([d488bdf](///commit/d488bdff96322195223a57acf98dd67fdf195e54))


### Chore

* Update dependency module source version v0.10.17 -> v0.11.0 ([9e15bef](///commit/9e15befd29cd1f32e348d8b4ba73a5d6f387b804))

### [0.10.17](///compare/v0.10.16...v0.10.17) (2020-04-19)


### Chore

* Update dependency module source version v0.10.16 -> v0.10.17 ([51011d1](///commit/51011d13680e7a714a67a0e1657fbfc7dde3e7c4))
* **terraform-aws-iam-assumable-service-role:** Option to set custom resource name rather then using name format specified in module itself ([f68f6a4](///commit/f68f6a444c190d89e0df37acdff62e435c5b5311))

### [0.10.16](///compare/v0.10.15...v0.10.16) (2020-04-19)


### Chore

* Update dependency module source version v0.10.15 -> v0.10.16 ([490f057](///commit/490f057c9eff540ddc2e0ff5629decee0e254c84))
* use latest stable version for secret manager and rds cluster; Create secret manager backup ([2aac280](///commit/2aac280147fbb06ab18c1395934ccd6cd161f837))

### [0.10.15](///compare/v0.10.14...v0.10.15) (2020-04-17)


### Bug Fixes

* **terraform-aws-rds-cluster:** AWSPENDING state was not the problem. Trying with lifecycle ignore_changes secret_string ([1dd6f3e](///commit/1dd6f3e919261ba12ea1e42ee0670d13e447d7fa))
* **terraform-aws-rds-cluster:** Update script for rotating secret - add missing aws region parameter ([6cec27f](///commit/6cec27ff20edd11c0e21ce835a9e0193ac03336f))


### Chore

* Update dependency module source version v0.10.14 -> v0.10.15 ([1fe8f8e](///commit/1fe8f8e078584cb8f716105f09d2a4f13586e45a))

### [0.10.14](///compare/v0.10.13...v0.10.14) (2020-04-17)


### Chore

* Update dependency module source version v0.10.13 -> v0.10.14 ([4dc4dd7](///commit/4dc4dd7f4f6980246c4fc055ee69fa82a4616c5f))
* **terraform-aws-rds-cluster:** Update script for rotating secret; After rotation wait for Secret Manager to remove staging label AWSPENDING from current version id ([cfe254c](///commit/cfe254ce4e57c60d671639dae8ecbc0342a62d5a))

### [0.10.13](///compare/v0.10.12...v0.10.13) (2020-04-17)


### Chore

* Update dependency module source version v0.10.12 -> v0.10.13 ([bfb41e3](///commit/bfb41e3eb197745df7669593d686d6392d9ed101))
* **terraform-aws-rds-cluster:** Update script for rotating secret; After rotation wait for Secret Manager to remove staging label AWSPENDING from current version id ([d240235](///commit/d24023523870be0fceb0d6a4e598e87331852989))

### [0.10.12](///compare/v0.10.11...v0.10.12) (2020-04-17)


### Bug Fixes

* **terraform-aws-secret-manager-with-rotation:** use arn instead secret id ([e5c2e0d](///commit/e5c2e0dd39eb5243eb498d76e7c354507be103de))


### Chore

* Update dependency module source version v0.10.11 -> v0.10.12 ([5976d6f](///commit/5976d6f391809d22bddd1d0fb0f24f552ef5f351))

### [0.10.11](///compare/v0.10.10...v0.10.11) (2020-04-17)


### Refactor

* **terraform-aws-secret-manager-with-rotation:** Get secret id from data source so we can retrieve latest version id ([3139eb6](///commit/3139eb6d8f4eb98603d8c1dfbda566ff08e6a4f1))


### Chore

* Update dependency module source version v0.10.10 -> v0.10.11 ([868ed44](///commit/868ed446094e18b62fdc811a797ef676f59bfcbf))

### [0.10.10](///compare/v0.10.9...v0.10.10) (2020-04-17)


### Bug Fixes

* **terraform-aws-secret-manager-with-rotation:** remove version_stages = [AWSPREVIOUS, AWSCURRENT] to aws_secretsmanager_secret_version ([e4a5fac](///commit/e4a5fac4708d50bdea07e9b06f630c5204fa73e9))


### Chore

* Update dependency module source version v0.10.9 -> v0.10.10 ([a6dc34b](///commit/a6dc34ba2b32334534d0cae58b9b293156d9819f))

### [0.10.9](///compare/v0.10.8...v0.10.9) (2020-04-17)


### Chore

* Update dependency module source version v0.10.8 -> v0.10.9 ([abac2eb](///commit/abac2eb15f4d95100df4ec9b9bbe4ec857125421))
* **terraform-aws-secret-manager-with-rotation:** add version_stages = [AWSPREVIOUS, AWSCURRENT] to aws_secretsmanager_secret_version ([d80aa2d](///commit/d80aa2d556433a1e0d76a6e1b8d69270fa1f5b44))

### [0.10.8](///compare/v0.10.7...v0.10.8) (2020-04-17)


### Bug Fixes

* **terraform-aws-secret-manager-with-rotation:** remove version_stages = [AWSPREVIOUS, AWSCURRENT] to aws_secretsmanager_secret_version ([6199882](///commit/619988286373c158ca10b80aa53ba124b55c12ed))


### Chore

* Update dependency module source version v0.10.7 -> v0.10.8 ([b82c9a6](///commit/b82c9a65b320ee3221e10b5a9ac61906470ccd6a))

### [0.10.7](///compare/v0.10.6...v0.10.7) (2020-04-17)


### Chore

* Update dependency module source version v0.10.6 -> v0.10.7 ([8420ccd](///commit/8420ccd4d9944946e041953bab5d5511472659fd))
* **terraform-aws-secret-manager-with-rotation:** add version_stages = [AWSPREVIOUS, AWSCURRENT] to aws_secretsmanager_secret_version ([52d8b47](///commit/52d8b4767bd9cbf0a0a2f85ca503b9e27fa3a192))

### [0.10.6](///compare/v0.10.5...v0.10.6) (2020-04-17)


### Chore

* Update dependency module source version v0.10.5 -> v0.10.6 ([c668afb](///commit/c668afb6b8189a45de2a40e4a9ce52b85020e0de))
* **terraform-aws-secret-manager-with-rotation:** add version_stages = [AWSCURRENT] to aws_secretsmanager_secret_version ([4382b36](///commit/4382b3600b88fcda5f62632a6a367dc33696ed13))

### [0.10.5](///compare/v0.10.4...v0.10.5) (2020-04-17)


### Chore

* Update dependency module source version v0.10.4 -> v0.10.5 ([3572037](///commit/35720374abce82a7798cec43907c8b5e5a478765))
* **terraform-aws-secret-manager-with-rotation:** add lifecycle create before destroy to aws_secretsmanager_secret_version resource ([14564ee](///commit/14564ee1465af41ddeadf394fd4d9ade8ceffd78))

### [0.10.4](///compare/v0.10.3...v0.10.4) (2020-04-17)


### Bug Fixes

* **terraform-aws-rds-cluster:** error cycle because rds default security group depends_on.module.secret property ([bba2412](///commit/bba24128d4855b7fdaf27d5cbafc71499401b368))


### Chore

* Update dependency module source version v0.10.3 -> v0.10.4 ([a623f26](///commit/a623f26add59e4e7695700976cb5c80ddda88b62))

### [0.10.3](///compare/v0.10.2...v0.10.3) (2020-04-17)


### Bug Fixes

* **terraform-aws-rds-cluster:** error cycle because rds default security group depends_on.module.secret property ([975a940](///commit/975a9402c19782e417995611234b4d2528716dc8))


### Chore

* Update dependency module source version v0.10.2 -> v0.10.3 ([8533986](///commit/8533986e9bb80e3d0971c0b27dee4709be691159))

### [0.10.2](///compare/v0.10.1...v0.10.2) (2020-04-17)


### Bug Fixes

* **terraform-aws-rds-cluster:** error cycle - delete version_id from secret output ([3bffd04](///commit/3bffd0495a663475b6a937f4484103270da55514))


### Chore

* Update dependency module source version v0.10.1 -> v0.10.2 ([22b3330](///commit/22b333070f5f5012efd0fc08dbe3fd58e832b255))

### [0.10.1](///compare/v0.10.0...v0.10.1) (2020-04-17)


### Bug Fixes

* **terraform-aws-rds-cluster:** error cycle because rds default security group depends_on.module.secret properti ([9ceb9b0](///commit/9ceb9b09b4b3d294de4bb645308815f7e2bf61ad))


### Style

* **terraform-aws-cloudwatch-event:** Style and code formating ([8e719d6](///commit/8e719d6636169700e7a74e645ac969775c27ecf7))


### Chore

* Update dependency module source version v0.10.0 -> v0.10.1 ([9501964](///commit/9501964407368633a81e9d58cf0dff452c09c396))

## [0.10.0](///compare/v0.9.2...v0.10.0) (2020-04-17)


### Refactor

* **terraform-aws-cloudwatch-event:** New variable - template_variables (use one template variables for event pattern and target input templates). Option to set custom target tag key and target tag values. ([0ca9641](///commit/0ca96415d46f85871d2b78901e61f2c1451cb6d0))


### Chore

* Update dependency module source version v0.9.2 -> v0.10.0 ([ca4b072](///commit/ca4b072782aca615b8970af9845daf1d519c957c))

### [0.9.2](///compare/v0.9.1...v0.9.2) (2020-04-17)


### Chore

* Update dependency module source version v0.9.1 -> v0.9.2 ([7b3b8a4](///commit/7b3b8a4551afb90148ae59910375977b59766e57))
* **terraform-aws-rds-cluster:** RDS default security group now depends_on null_resource.secret. This will make sure that secret has been rotated before Elastic Beanstalk gets created/updated ([713d10c](///commit/713d10c91faa874db2d39bbe47f4c5e91fedb921))

### [0.9.1](///compare/v0.9.0...v0.9.1) (2020-04-16)


### Chore

* Update dependency module source version v0.9.0 -> v0.9.1 ([5f689ca](///commit/5f689caa321dcc7312e785db97ca3e5994a37b0d))
* **terraform-aws-sns-topic:** Add resource tags; Add lifecycle block ([e8c1df1](///commit/e8c1df12f5f84f0777d67ef874c4d99543accfab))

## [0.9.0](///compare/v0.8.2...v0.9.0) (2020-04-16)


### Features

* **terraform-aws-sns-topic:** New module for creating SNS topic ([413a610](///commit/413a610dc8923f6fbf66fb4bbc7ec13ab739df2e))


### Chore

* Update dependency module source version v0.8.2 -> v0.9.0 ([57d7dd9](///commit/57d7dd95ea3d4787b3cbbbacf7163f875901cb00))
* **terraform-aws-security-group:** Add versions.tf ([c2e6ce8](///commit/c2e6ce811d176b98570494d9191890c2a2238657))

### [0.8.2](///compare/v0.8.1...v0.8.2) (2020-04-13)


### Chore

* Update dependency module source version v0.8.1 -> v0.8.2 ([2e328c9](///commit/2e328c92c787f3a0588a9380d1f2d9bc8a2faf4e))
* **terraform-aws-rds-cluster:** Don't change/update Elastic Beanstalk deployment policy after rotating the secret ([f21ef74](///commit/f21ef74245d2231da40cd887afa1ff004e7fa637))

### [0.8.1](///compare/v0.8.0...v0.8.1) (2020-04-05)


### Chore

* Update dependency module source version v0.8.0 -> v0.8.1 ([559e5bd](///commit/559e5bd5d0a594c43b22e04c93aaa415adfae899))
* **terraform-aws-route53-cluster-zone:** Remove quotes from ignore_changes, quoted references are now deprecated and will be removed in a future version of Terraform ([aca0f2e](///commit/aca0f2ea6e7db974f9d6fb7f45cc837bc000548f))

## [0.8.0](///compare/v0.7.0...v0.8.0) (2020-04-05)


### Features

* **terraform-aws-route53-cluster-zone:** Ignore any VPC changes in order to manage additional VPC associations with private hosted zone ([19a0540](///commit/19a05409dfcd6237d21b72f1ff3abe022af970f6))


### Chore

* Update dependency module source version v0.7.0 -> v0.8.0 ([87b3a50](///commit/87b3a5077a170b11245e848d81add42ab3eceb3f))

## [0.7.0](///compare/v0.6.1...v0.7.0) (2020-03-26)


### Chore

* Update dependency module source version v0.6.1 -> v0.7.0 ([8b54304](///commit/8b54304b36c9a66e7fbcb69b069348af512cb483))
* **terraform-aws-webserver-cluster:** Prepare for attaching EBS feature ([6585059](///commit/658505903642d1b757a7a9172b3b1c51c5876ae6))

### [0.6.1](///compare/v0.6.0...v0.6.1) (2020-03-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** autoscaling group name was set wrongly ([56189fc](///commit/56189fc79f18f2e2c7cb89acb853d93f59665480))


### Chore

* Update dependency module source version v0.6.0 -> v0.6.1 ([d016d3c](///commit/d016d3ccc799d21c1627fb0efd8aaeec55519456))

## [0.6.0](///compare/v0.5.7...v0.6.0) (2020-03-25)


### Refactor

* **terraform-aws-webserver-cluster:** Remove settings for creating build server, module should be decoupeld or better structured ([320618f](///commit/320618f18c4fe282bcc856030b39a994e039aac4))


### Chore

* Update dependency module source version v0.5.7 -> v0.6.0 ([6dfd527](///commit/6dfd5274c2ab8d46dc6aef000d5c964c8a6e952e))

### [0.5.7](///compare/v0.5.6...v0.5.7) (2020-03-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** image_id: required field is not set ([8db9c07](///commit/8db9c07b9b224e46f15410113c0cb12c3f7b9e5f))


### Chore

* Update dependency module source version v0.5.6 -> v0.5.7 ([7338625](///commit/7338625ca8456d8a46d8abde6138e22321281701))
* Update dependency module source version v0.5.6 -> v0.5.7 ([27e5c41](///commit/27e5c414510b070870551c561df30afcfe81afae))

### [0.5.7](///compare/v0.5.6...v0.5.7) (2020-03-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** image_id: required field is not set ([8db9c07](///commit/8db9c07b9b224e46f15410113c0cb12c3f7b9e5f))


### Chore

* Update dependency module source version v0.5.6 -> v0.5.7 ([27e5c41](///commit/27e5c414510b070870551c561df30afcfe81afae))

### [0.5.6](///compare/v0.5.5...v0.5.6) (2020-03-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** image_id: required field is not set ([a8549f7](///commit/a8549f7353d90adc0231bbe5d290d0289d0deb1f))


### Chore

* Update dependency module source version v0.5.5 -> v0.5.6 ([7f1d869](///commit/7f1d86970cb5be1e3714c3e32a0488f0eea8fed2))

### [0.5.5](///compare/v0.5.4...v0.5.5) (2020-03-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** Was creating two singe Ec2 instances instead of just one ([d413a00](///commit/d413a00167a9ea2edf91c5d1ad2dbb5597e6a7bc))


### Chore

* Update dependency module source version v0.5.4 -> v0.5.5 ([8c2e85c](///commit/8c2e85c9c1bd42f58ab7ef193bb344b662f764a5))

### [0.5.4](///compare/v0.5.3...v0.5.4) (2020-03-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** count for aws_launch_configuration->custom_ami will now return false if custom_ami is true ([60ae52c](///commit/60ae52c4f5b8c79b32c623d01ebed2e74a8d2719))


### Chore

* Update dependency module source version v0.5.3 -> v0.5.4 ([8a84832](///commit/8a84832cfcf01e075319b942acbedf95ad71703a))

### [0.5.3](///compare/v0.5.2...v0.5.3) (2020-03-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** Do not create launch configuration for autoscaling if single_ec2 is true ([675d853](///commit/675d853877e7c2682c62265d305839df10df859d))


### Chore

* Update dependency module source version v0.5.2 -> v0.5.3 ([be31046](///commit/be310467a87af26560a927bb0686e750676c9808))

### [0.5.2](///compare/v0.5.1...v0.5.2) (2020-03-25)


### Bug Fixes

* **terraform-aws-webserver-cluster:** Do not create launch configuration for autoscaling if single_ec2 is true ([79813dc](///commit/79813dcc9f996e298a06d3440c9cafeb0e298648))


### Chore

* Update dependency module source version v0.5.1 -> v0.5.2 ([58d707e](///commit/58d707ee54377878e8dc0b42e6cd8d9ad0d55b4b))

### [0.5.1](///compare/v0.5.0...v0.5.1) (2020-03-25)


### Features

* **terraform-aws-webserver-cluster:** Single Ec2 with custom AMI id can now be created, custom_ami and ami_id needs to be set ([5d80e1b](///commit/5d80e1bb9cd644a514b3cd6ee83671c17172678e))


### Bug Fixes

* **terraform-aws-webserver-cluster:** Associate Elastic IP when deplyoing single Ec2 with custom AMI ([213f370](///commit/213f37043acab960259bbac3d8a8d95e415645b6))


### Chore

* Update dependency module source version v0.5.0 -> v0.5.1 ([b24b580](///commit/b24b580581c13599c0cc03fe029cc7868d216040))

## [0.5.0](///compare/v0.4.12...v0.5.0) (2020-03-24)


### Features

* **terraform-aws-elastic-beanstalk-environment:** phpini can now be increased by defining phpini_memory variable ([02d0e49](///commit/02d0e49d1390a491319c3ff42df9c585e6743edc))


### Chore

* Update dependency module source version v0.4.12 -> v0.5.0 ([8d5c184](///commit/8d5c1847a1c13d2464f282221602a82590ee4463))

### [0.4.12](///compare/v0.4.11...v0.4.12) (2020-03-23)


### Bug Fixes

* **terraform-aws-rds-cluster:** must wait for EB to finish updating (sleep) ([b125c00](///commit/b125c00068c078ac00dd6d8e8eb5bb9e07ad5eeb))


### Chore

* Update dependency module source version v0.4.11 -> v0.4.12 ([6bd540e](///commit/6bd540e72f7a739094d87ae0e869cfe020d47b8d))
* **terraform-aws-rds-cluster:** Decrease sleep time when rotating secret from 120s to 60s ([5a4be4f](///commit/5a4be4f0fd09427077139db7fe08eef731fcd667))

### [0.4.11](///compare/v0.4.10...v0.4.11) (2020-03-23)


### Chore

* Update dependency module source version v0.4.10 -> v0.4.11 ([9e3097b](///commit/9e3097bcd9c3c413b89370e60d2300997a63cdb8))
* **terraform-aws-rds-cluster:** When changing DB password set Elastic Benastalk deployment polcy to Rolling in order to minimize downtime ([959fb19](///commit/959fb19e0366d692799e023863a97c7208f981be))

### [0.4.10](///compare/v0.4.9...v0.4.10) (2020-03-23)


### Bug Fixes

* **terraform-aws-secret-manager-with-rotation:** Cycle between resources ([39bab7a](///commit/39bab7a002515d4d7926f3cd6aa408a8de22c332))


### Chore

* Update dependency module source version v0.4.9 -> v0.4.10 ([6214bce](///commit/6214bceb34266297d66b2fdc4bb2e91378372615))

### [0.4.9](///compare/v0.4.8...v0.4.9) (2020-03-23)


### Bug Fixes

* **terraform-aws-secret-manager-with-rotation:** define dependencies between resources [depends_on] ([d7ae9b6](///commit/d7ae9b6de514684018e91ca5d13e51ac0b4bb612))


### Chore

* Update dependency module source version v0.4.8 -> v0.4.9 ([2ea6ac4](///commit/2ea6ac410e82b80dc4755f38288419479e401447))

### [0.4.8](///compare/v0.4.7...v0.4.8) (2020-03-23)


### Chore

* Update dependency module source version v0.4.7 -> v0.4.8 ([769cae1](///commit/769cae1a64a4814013fad945f44b3af37773e595))
* **terraform-aws-secret-manager-with-rotation:** Use name_prefix instead just name for aws_secretsmanager_secret resource ([d26584c](///commit/d26584c0b3c8234705123c9158050dba97875617))

### [0.4.7](///compare/v0.4.6...v0.4.7) (2020-03-23)


### Chore

* Update dependency module source version v0.4.6 -> v0.4.7 ([56e44c6](///commit/56e44c6c43b48dd47ad0e90ce4a8abe8d4fc079d))

### [0.4.6](///compare/v0.4.5...v0.4.6) (2020-03-23)


### Bug Fixes

* **terraform-aws-rds-cluster:** Remove count from aws_security_group.lambda resource ([248ad3b](///commit/248ad3bd18a264ac92dfb2ce90d2897fdf1f9e7a))


### Chore

* Update dependency module source version v0.4.5 -> v0.4.6 ([6e24fd8](///commit/6e24fd88f602f81744d37adab7afd780a69da3a1))

### [0.4.5](///compare/v0.4.4...v0.4.5) (2020-03-23)


### Chore

* Update dependency module source version v0.4.4 -> v0.4.5 ([97880b4](///commit/97880b4c417514bbcc7599607fa1bb4398412f38))
* **terraform-aws-rds-cluster:** New security group that allows ingress from Lambda function for rotating secret ([e7ef9d3](///commit/e7ef9d3ccb4e1dc1bbcd32e9097b3754cb224f1e))
* **terraform-aws-secret-manager-with-rotation:** Output lambda security group id ([9753d35](///commit/9753d3576ee99e162f7fcf496697762259eb090c))

### [0.4.4](///compare/v0.4.3...v0.4.4) (2020-03-23)


### Bug Fixes

* **terraform-aws-rds-cluster:** Rotate secret even if TERRAGRUNT_IAM_ROLE is not exported, use aws_iam_role defined in common.hcl ([abeb318](///commit/abeb3186502de1426f6a4a94181a8349cbc5f37d))


### Chore

* Update dependency module source version v0.4.3 -> v0.4.4 ([1118771](///commit/1118771146454bd806e8a8b1e08ff45ea76cc409))

### [0.4.3](///compare/v0.4.2...v0.4.3) (2020-03-22)


### Chore

* Update dependency module source version v0.4.2 -> v0.4.3 ([093229b](///commit/093229bcef93798f66a6085e07ee1546a8b1ef7d))
* **terraform-aws-security-group:** Delete random_id resource ([fc1d899](///commit/fc1d8993c5a1aafcd53436118c48f2882dda3037))

### [0.4.2](///compare/v0.4.1...v0.4.2) (2020-03-22)


### Bug Fixes

* **terraform-aws-security-group:** Do not destroy first random_id, just change secutiy group name ([6ca4a29](///commit/6ca4a29fbfc9c2cacf88175e5b1917d7005038a6))


### Chore

* Update dependency module source version v0.4.1 -> v0.4.2 ([e1c1fe3](///commit/e1c1fe3096bf13e509bf09a88354688890491f47))

### [0.4.1](///compare/v0.4.0...v0.4.1) (2020-03-22)


### Style

* **terraform-aws-security-group:** Format code, delete old comments ([6703a22](///commit/6703a22c74dd8a318d96d3a913eef7315fedb661))


### Chore

* Update dependency module source version v0.4.0 -> v0.4.1 ([6267859](///commit/6267859b16272371320a4beddd84d546701064e8))

## [0.4.0](///compare/v0.3.9...v0.4.0) (2020-03-21)


### Refactor

* **terraform-aws-security-group:** use name_prefix as security group name instead of just name. revoke_rules_on_delete can now be set as input (defaults to false). ([0100c78](///commit/0100c78596ca714a9d2aa1292c7073fe08c9ec8e))


### Chore

* Update dependency module source version v0.3.9 -> v0.4.0 ([41bbda4](///commit/41bbda486485cebd5a614a1470352ca9b4a2506c))

### [0.3.9](///compare/v0.3.8...v0.3.9) (2020-03-21)


### Style

* **terraform-aws-elastic-beanstalk-application:** Code format, clean comments, remove unused variables ([ae99447](///commit/ae9944746b4e24b094278b858988c88ce152a7bc))
* **terraform-aws-security-group:** Code format, clean comments, remove unused variables ([e6603c0](///commit/e6603c0846f90c798fae7d9af05c61c18affb816))


### Docs

* Update README.md ([c47f37f](///commit/c47f37f64cf234f14081f88e7670dd37006d3fa3))
* **terraform-aws-elastic-beanstalk-environment:** Update README.md ([44398af](///commit/44398af0df3ec00cf1bb1b50006d30e16fecb8fe))


### Chore

* Update dependency module source version v0.3.8 -> v0.3.9 ([457b3bd](///commit/457b3bd423290bfa1bd74aa5dc84ea724450554a))

### [0.3.8](///compare/v0.3.7...v0.3.8) (2020-03-14)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** Delete default security group (finally) ([3df86cd](///commit/3df86cd95184226896097d925f19a66e48054aa2))


### Chore

* Update dependency module source version v0.3.7 -> v0.3.8 ([03d2fb5](///commit/03d2fb55c59d2509d195be6cf7eb47c66f29485b))

### [0.3.7](///compare/v0.3.6...v0.3.7) (2020-03-14)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** Forgot to uncomment tf variables ([2fb6415](///commit/2fb6415f12d599e0682af82721dd690176376bb5))


### Chore

* Update dependency module source version v0.3.6 -> v0.3.7 ([e7e8721](///commit/e7e8721753dfbe82d0269dceb2f21260304fc062))

### [0.3.6](///compare/v0.3.5...v0.3.6) (2020-03-14)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** Delete default security group ([2e3ded4](///commit/2e3ded487d4a34511a9aca2eb4fff70b849a9be1))
* **terraform-aws-elastic-beanstalk-environment:** Eb settings for security group value must be string type ([e32d4bf](///commit/e32d4bf0018c60b235b805eca8b559bc5d49178b))


### Chore

* Update dependency module source version v0.3.5 -> v0.3.6 ([6465c93](///commit/6465c935d5a2044bc4d4ca57b242a693563b9746))

### [0.3.5](///compare/v0.3.4...v0.3.5) (2020-03-14)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** Leave default security group, first change sg in launch config settings No.2 ([d6819b1](///commit/d6819b1345c563b3bc0d8e7bec5478d182c0b089))


### Chore

* Update dependency module source version v0.3.4 -> v0.3.5 ([3933805](///commit/39338052eef2ade5b8ba24891949b23c9b6eb327))

### [0.3.4](///compare/v0.3.3...v0.3.4) (2020-03-14)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** Leave default security group, first change sg in launch config settings ([c2ddcbd](///commit/c2ddcbd9b03ea98b80004e160d5255f7054cf176))


### Chore

* Update dependency module source version v0.3.3 -> v0.3.4 ([5b67a4d](///commit/5b67a4d7cafbde1b2ed5c6aac3ca027306795d83))

### [0.3.3](///compare/v0.3.2...v0.3.3) (2020-03-14)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** cycle between dependencies ([a37aa21](///commit/a37aa2118e27c5099b68ae820e52a1c985c64943))


### Chore

* Update dependency module source version v0.3.2 -> v0.3.3 ([05a8f40](///commit/05a8f4098be8ba2a2e93d1b999f296b3c81e0ce7))

### [0.3.2](///compare/v0.3.1...v0.3.2) (2020-03-14)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** Error when applying Elastic Beanstalk. Revert back changes No.1 ([f835fc3](///commit/f835fc3363233ce9ed6bb7c38a60551fb5ceb018))


### Chore

* Update dependency module source version v0.3.1 -> v0.3.2 ([d163198](///commit/d16319803b653d9f2506403468fe58b954b9fe4f))

### [0.3.1](///compare/v0.3.0...v0.3.1) (2020-03-14)


### Chore

* Update dependency module source version v0.3.0 -> v0.3.1 ([c50c7fc](///commit/c50c7fc534abcc52b3d6f27b5b94a65511fb9e28))
* **terraform-aws-security-group:** Output security group id ([ea3f509](///commit/ea3f509854494fd06f74a4c9b839c3cc91cfd944))

## [0.3.0](///compare/v0.2.4...v0.3.0) (2020-03-14)


### Features

* **terraform-aws-security-group:** New module which will create needed security group(s). ([73d93ce](///commit/73d93cea5235eb9de53b6739806f3cb3301d3c92))


### Refactor

* **terraform-aws-elastic-beanstalk-environment:** Provide Ec2 security group id variable. Security group for Ec2 will now be created in terraform-aws-secrity-group module and id will be passed as dependency variable ([2b6e611](///commit/2b6e611c29f80481236c8921806917910e32d1cc))


### Chore

* Update dependency module source version v0.2.4 -> v0.3.0 ([43f30a2](///commit/43f30a28c5f8290e74899d1b321b65367c827f09))

### [0.2.4](///compare/v0.2.3...v0.2.4) (2020-03-06)


### Bug Fixes

* typo No.2 in referencing source version ([44b395f](///commit/44b395f57d530a0fac708cfe4e6140d872bf78bb))


### Chore

* Update dependency module source version v0.2.3 -> v0.2.4 ([51c55d0](///commit/51c55d028354f1437400ad529fd7d4a01fdb4414))

### [0.2.3](///compare/v0.2.2...v0.2.3) (2020-03-06)


### Chore

* Update dependency module source version v0.2.2 -> v0.2.3 ([61ca9ad](///commit/61ca9ad94da6f0d09d1aad96215a7979956cdf89))

### [0.2.2](///compare/v0.2.1...v0.2.2) (2020-03-06)


### Bug Fixes

* **release.sh:** Exit on quit - exit 1 ([3c60000](///commit/3c60000841f47b2cc1f98d6688bb2cd525a06e1f))


### Chore

* Update dependency module source version v0.2.1 -> v0.2.2 ([d57508e](///commit/d57508efedcdbe590a6fdcb02f667ddeb4f60dfd))

### [0.2.1](///compare/v0.2.0...v0.2.1) (2020-03-06)


### Chore

* release.sh script ([f25570f](///commit/f25570f1e6ecdb0016b21422bd9476f7db213780))
* Update dependency module source version v0.2.0 -> v0.2.1 ([a4c8694](///commit/a4c8694c9a0623b692b79cc31310eee06299e8b3))

## [0.2.0](///compare/v0.1.5...v0.2.0) (2020-03-06)


### Features

* **terraform-aws-webserver-cluster:** Redirects HTTP to HTTPS. Additional Load Balancer listener and listener rule. ([e27a4e0](///commit/e27a4e0725d032f66283d95e478434b7d02a781c))


### Chore

* Update dependency module source version v0.1.5 -> v0.1.6 ([9045c4b](///commit/9045c4b4992a3f0381a097154e88b98d434e82c2))
* Update dependency module source version v0.1.5 -> v0.2.0 ([45edd85](///commit/45edd8525effd3f8189427debb66e221d9f06bd3))

### [0.1.5](///compare/v0.1.4...v0.1.5) (2020-03-01)


### Bug Fixes

* **terraform-aws-elastic-beanstalk-environment:** local sengrid_smtp_secret_id variable was not set correctly ([97118ba](///commit/97118ba43fa7e662f4dff1fb7800171a7ac47558))

### [0.1.4](///compare/v0.1.3...v0.1.4) (2020-03-01)


### Features

* **terraform-aws-elastic-beanstalk-environment:** Get Sengrid SMTP mail server username and password by providing secret id (AWS Secrets Manager) and export it as Elastic Beanstalk environment variable ([a4a59d4](///commit/a4a59d42f574640afced9c3c4503a61193157256))

### [0.1.3](///compare/v0.1.2...v0.1.3) (2020-02-27)


### Chore

* **terraform-aws-iam-assumable-service-role:** define IAM role name as environment-name ([e72d402](///commit/e72d402d723a02e9dbd2025af6de7868aa44f511))

### [0.1.2](///compare/v0.1.1...v0.1.2) (2020-02-25)


### Chore

* **aws-iam-assumable-service-role:** change use_fullname variable type from string to bool ([52b7dde](///commit/52b7dde559e9534499a1df3d850015ca3643a21c))
* **aws-webserver-cluster:** set default bool value for variable enable_autoscaling to false ([771b120](///commit/771b120cddcc73b0a03b0b13637d571787d106f1))


### Refactor

* **aws-cloudwatch-event:** add optional variable to set autoscaling group name (ec2_autoscaling_group_name). In terragrunt use as dependency {} ([33f5dcb](///commit/33f5dcbe52c796c54f0e5d0f52ee92d0854c6bd0))

### [0.1.1](///compare/v0.1.0...v0.1.1) (2020-02-23)


### Bug Fixes

* **iam-assumable-service-role:** Duplicated outputs ([9ddd1db](///commit/9ddd1db7a755e5713028977212a75c2156014515))


### Chore

* **elastic-beanstalk-environment:** Update script for creating backupo of configuration template so it does not exit if TERRAGRUNT_IAM_ROLE is not exported like it was previous case ([f8df4f4](///commit/f8df4f4fc943f99f44ee8cf110a9abdc8339a1fd))


### Refactor

* **cloudwatch-event:** Get output for autoscaling group name from elastic-beanstalk. Output is used is then passed in data template as variable ([fa39bb7](///commit/fa39bb7a0ee21f7ec52a8c41726c0c91395f42a1))
* **webserver-cluster:** AWS IAM instance profile role is now fetched from output of iam module ([d3c1009](///commit/d3c10094391aa0792030fcaccd08c99576d48279))

## 0.1.0 (2020-02-19)


### Chore

* Set initial version v0.1.0 ([dcb0425](///commit/dcb042552d1ee2c4d708e674d2d212e6cc838d39))
