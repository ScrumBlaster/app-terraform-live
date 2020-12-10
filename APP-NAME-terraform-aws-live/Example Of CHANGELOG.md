# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [3.15.0](https://enbw.visualstudio.com/EnPowerX/_git/powercloud-terraform-aws-live/branchCompare?baseVersion=GTv3.14.0&targetVersion=GTv3.15.0) (2020-08-24)


### Chore

* **release.sh:** Update release.sh script ([59e70fb](https://enbw.visualstudio.com/EnPowerX/_git/powercloud-terraform-aws-live/commit/59e70fb9839844fe1b494100a7f5f001558410ec))

## [3.14.0](https://enbw.visualstudio.com/EnPowerX/_git/powercloud-terraform-aws-live/branchCompare?baseVersion=GTv3.13.10&targetVersion=GTv3.14.0) (2020-08-24)


### Chore

* **update:** Modules update v0.28.1 --> v0.28.5 ([d554245](https://enbw.visualstudio.com/EnPowerX/_git/powercloud-terraform-aws-live/commit/d55424504bf1c17302cf046f9d8153a8164e9acd))

### [3.13.10](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/branchCompare?baseVersion=GTv3.13.9&targetVersion=GTv3.13.10) (2020-08-24)


### Chore

* Remove duplicated AWS KMS IAM Role from KMS permission policy ([437409b](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/commit/437409b547458054115a404fb8dc188d8096e1b3))

### [3.13.9](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/branchCompare?baseVersion=GTv3.13.8&targetVersion=GTv3.13.9) (2020-08-24)


### Chore

* **terragrunt.hcl:** Update parent terragrunt.hcl ([730fd4d](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/commit/730fd4d60b15b9944c1e771e183afe2686051dd5))


### Docs

* Update README.md ([8be2b93](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/commit/8be2b9334352b393a2c3967ce8dc34cab6cac5a2))
* Update README.md ([5f56759](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/commit/5f5675964d8d3ddb8c924559cab28b20bc3aadeb))
* Update README.md ([539360a](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/commit/539360acdb1ca8d3fd8fb9864fd4fb6ea0052a14))

### [3.13.8](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/branchCompare?baseVersion=GTv3.13.7&targetVersion=GTv3.13.8) (2020-08-24)


### Bug Fixes

* **release.sh:** Add and format --compareUrlFormat and --commitUrlFormat to standard-release command ([de32d82](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/commit/de32d824cdf5ab1a9103ec58b5267fd004d19d52))


### Style

* Fix word typo ([43808b1](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/commit/43808b1470141825e40c0b0212562537b7fe0919))


### Refactor

* .terraform-version and -terragrunt-version are now environemnt-specific instead stage-specific ([e23efd1](https://enbw.visualstudio.com/EnPowerX/_git//powercloud-terraform-aws-live/commit/e23efd1a631093bbebb42cde2d6cf47f1d9e0c72))

### [3.13.7](///compare/v3.13.6...v3.13.7) (2020-08-23)


### Features

* Modules verison has been updated --> v0.27.1 (feat(terraform-aws-ssm-document): Added permissions parameter. We can now share documents with other AWS accounts.) ([8a50a22](///commit/8a50a228243872154b6dc7efde93e58b87502d61))
* Modules verison has been updated --> v0.27.2 (fix(terraform-aws-ssm-document): Define account_ids as string type variable) ([ce94bb5](///commit/ce94bb5404b3c9d7801d499f4d1368ec169d9276))
* Modules verison has been updated --> v0.27.3 (chore(terraform-aws-secret-manager): After secret is rotated wait for 5min before proceeding in order to give EB time to update environment.) ([b7b9438](///commit/b7b9438b9f2b71bf5189b761bf274163208a9919))
* **pseudo:** Add new SSM Documents -> runCommand ([d3a0cb8](///commit/d3a0cb887acddf2946d8008cdfc97a3b9a35105b))
* **pseudo): Modules version updated to v0.27.0 -> refactor(terraform-aws-webserver-cluster:** Default and custom tags are now mergerd and used in ASG ([f8eb167](///commit/f8eb167014327eda341b4aac201a5e5c149d49c1))
* **test:** Add new SSM Documents -> runCommand ([6871ab0](///commit/6871ab06b740afce0ea89ecfa417bed118b907e5))
* **test:** Added new AWS SSM document for exporting mysql user table ([6fe4ea5](///commit/6fe4ea519031583e3d25e831acc3221aa5901ef4))
* **test:** New AWS SSM Document which will export cron tables ([1eeda51](///commit/1eeda51d1fab3b2ce861f6d0cf4fab44cb0ee5c2))


### Bug Fixes

* **infra-app:** dependnecy cycle; increase lambda function timeout ([395c2a0](///commit/395c2a080da7151e7486604052585ec26ae06926))
* REVERT Set EB dependency mocked value secret_id --> rds_powercloud_secret ([07f48da](///commit/07f48daad18e030c591adabf3795167f4b7337dc))
* Set EB dependency mocked value secret_id --> rds_powercloud_secret ([9a52402](///commit/9a52402019fcec3641c83e1fd8438f42d968540d))
* **infra-app:** fix phpmyadmin userdata.sh script ([d0a3a71](///commit/d0a3a71b42625af6e4b24baf97068490343e486c))
* **infra-app:** Update lambda IAM role permissions for rotating secret ([fc97683](///commit/fc976837180d6b751813d499553d0702cdb8c939))
* **test-prod:** Fixed failing run command - correct S3 bucket name is now set ([61c8959](///commit/61c89591926f971ef381b26fc0af0dc1b08b99d9))


### Refactor

* **aws-rds-cluster:** rds_snapshot_identifier can now be set with exported environment variable RDS_SNAPSHOT_IDENTIFIER ([b430f01](///commit/b430f0158806d47981cd9382a1a6408162c76bf8))
* **dev:** Created new database cluster; database endpoint has changed ([4c62cdf](///commit/4c62cdf0ceb1833e09e9fe9a9e78975caa578dc4))
* **infra-app:** Modify dependencies between EB, RDS and secret modules. Secret module should be deployed only after EB is deployed ([bfb01d2](///commit/bfb01d2893024b6db6110b5469a9062e6ba84047))
* **infra-app:** Modify dependencies between EB, RDS and secret modules. Secret module should be deployed only after EB is deployed ([738a64c](///commit/738a64c81f882b6d867b4ba61c2991ac3372e366))
* Move AWS SSM Documents from test env into pseudo common and share documents so they can be reused ([d0e42c0](///commit/d0e42c0a319a80a028ced4dec0ac5e47121bc94b))
* **pseudo:** CloudWatch rules deleted - not needed ([e19406a](///commit/e19406a929ea3bed4a6850826e0520dc7d137175))
* **pseudo:** CloudWatch rules deleted - not needed ([b93a4fa](///commit/b93a4fa16b0da434db985bbc3c1b4f03c2d7c6e3))
* **pseudo:** EB now depends on phpmyadmin; phpmyadmin now depends on RDS; ([3c7d89b](///commit/3c7d89bb2c5701bf1ff5ab6b069d6a92d8bf63f5))
* **pseudo:** Give phpmyadmin Ec2 instance permissions on master secret KMS key ([79d5231](///commit/79d523183b16bf62ab6a5541ec6d7a9fc1d819ff))
* **pseudo:** Set kms admin role to EnBWContributorRole ([c404eeb](///commit/c404eeb9973ad9551468d54f2f9525fc966e1cf1))


### Style

* typo ([45a3c3a](///commit/45a3c3aa4b1c495a0c5e14b7d9b0fec328b91f08))
* **terragrunt.hcl:** Update comments ([396d0de](///commit/396d0de6ce18a6b1ca3873de8c170d63a01a38b3))


### Chore

* Modules version update to v0.28.1 ([730dce6](///commit/730dce675291f4baab3f6fa9e6f634a16f43c4a8))
* remove usage of SSH keys ([99bd807](///commit/99bd80788f936ff1d2a485755cf2a533d44c2b5a))
* Renamed 'extra_arguments common_var' from terraform to 'extra_arguments vpc_vars' ([0b99c19](///commit/0b99c193d08a57e28581cd94556d7ec92f77a9bc))
* **infra-app:** update snapshot identifier ([59da5d9](///commit/59da5d974cf08e41b36577c9778ed529d299ebde))
* **infra-app:** update snapshot identifier ([14200d1](///commit/14200d12355379ea3ab7f1c1de06d7ddd7a18132))
* **phpMyAdmin:** Add security group ingress rule which will allow incomming traffic from VPN Client SG ([cc856ab](///commit/cc856ab909cf6f195619f82110d0c9d3e492d9dc))
* **phpMyAdmin:** Add security group ingress rule which will allow incomming traffic from VPN Client SG ([3af4c01](///commit/3af4c01d89aa19d4e2a15a21a0755f4c7b31c922))
* **pipeline:** Increase default token expiration time ([c0e3d65](///commit/c0e3d65b815a8824ebc3dcbcd9358e079a6f0267))
* **pipeline:** Set task display name ([f4496a4](///commit/f4496a4d26f1608fa2d2aaa0e600154e179d1e83))
* **prod:** Update userdata.sh script for phpMyAdmin instance ([26d226d](///commit/26d226dff1241a4515227bfb206af25cfe99a9d6))
* **pseud:** Update SSM Document for exporting crons ([239ae7e](///commit/239ae7e18338fcf2df63bab98b9c6adfbc6490f8))
* **pseudo:** Add phpMyAdmin instance permissions on secret KMS key ([d42195e](///commit/d42195eccc3d00fa0db235d83479aae8784ccc39))
* **pseudo:** Created new SSM Document for  exporting Powercloud tables for Wirtschaftsprüfer ([5208d0d](///commit/5208d0d284ac653773ca7e8d647c6ed29dadf404))
* **pseudo:** Enable set SA_STRICT to 0 for free Superadmin login ([37177aa](///commit/37177aaa82b1030ab2b09ba50d5e9ec122510e72))
* **pseudo:** Remove custom tag from phpmyadmin instance ([2777695](///commit/277769542a1cf5c25bd0fc1eeb3c9e941ff2e1a1))
* **pseudo:** Scale up Aurora Capacity Units to 32 in order to match Powercloud recomended database size for performing pseudonymization ([266b056](///commit/266b056e0b03836eba42c9d2d9f6e32d3bfc033f))
* **pseudo:** Set custom tag RDS_SECRET_ID as string type ([b1d82af](///commit/b1d82afa8ec3e8b0c1915a43e01c60d0575512c5))
* **pseudo:** Set RDS_SECRET_ID tag for phpMyAdmin instance ([297f3e9](///commit/297f3e9ab4012cddda7d6c298d1cc1e19c4c0a3d))
* **pseudo:** Set RDS_SECRET_ID tag for phpMyAdmin instance ([c270db7](///commit/c270db71a87f11b6224224ec18ebf07431765502))
* **pseudo:** Update AWS SSM documents ([3dccef5](///commit/3dccef5485db55b7801b1a76c20230266f6f3f80))
* **pseudo:** Update AWS SSM Documents ([64a2a5a](///commit/64a2a5a703169f8ee410aa98ba658b888067f3bc))
* **pseudo:** Update AWS SSM Documents ([8e03204](///commit/8e03204fff9bc0a85f4c44928d074f33ca7d6139))
* **pseudo:** Update AWS SSM Documents ([31e2b79](///commit/31e2b799d7d27ba096ab7eeb7234d597eb03b299))
* **pseudo:** Update AWS SSM Documents description; Created new document for generating presign S3 URL ([77f2196](///commit/77f2196808f3a6fe5003ba6d8a7e4ae75a8f9470))
* **pseudo:** Update phpMyAdmin Ec2 IAM role permissions for accessing correct S3 bucket ([d1334a3](///commit/d1334a346a27c19f982954b690972b19dcea8e9b))
* **pseudo:** Update phpmyadmin Ec2 user data script - install mysql client ([bd76f83](///commit/bd76f83b5fbc2b4e502510d4577f4cbb154633ef))
* **pseudo:** Update SSM Documents, they are now shared with terratest account ([881b1e6](///commit/881b1e6496b4ad3b0af0b8193910d3a2b8591d7c))
* **pseudo:** wirtschaftsprufer --> export missing table ([60cbc29](///commit/60cbc290a2178ef4fb4cf0f35a189a5c6809cb6b))
* **psuedo:** Updated secret Lambda role permissions ([c76d2f8](///commit/c76d2f8391a8fccea5113507792137b09189ff0d))
* **terratest:** Enable superamdin login (disable SA_STRICT) ([1abc693](///commit/1abc693d2fabe187075045698a99f4ad433b0bae))
* **terratest:** Set RDS snapshto identifier - Powercloud database user permissions were updated (SELECT permissions on mysql database) ([143c1b4](///commit/143c1b436ba6557a887909d7810fb0fbf550cd86))
* **terratest:** Update EB security group - remove k8s ingress ([f112683](///commit/f112683a447094381993bd05cc805719e73e50f3))
* **terratest:** Update EB security group to allow traffic from VPN Clcient SG ([6d78b35](///commit/6d78b352c68967c3fc792dc3738a315d20f88d21))
* **vpn-client:** Update environment ([948a11b](///commit/948a11bd97c65e95825ce5dac6bdab4e541825db))
* Increase lambda function timeout (secret rotation) ([cd30627](///commit/cd306270ceb773eb40b9e7e93ef5fb4994046de4))
* Update powercloud Ec2 IAM role permissions ([6ef01ed](///commit/6ef01ed0f24179e133c0556d28d1e601cab31066))
* **test:** Share AWS SSM Documents ([ce1563a](///commit/ce1563a2fec1e790a8e25174282b0769e24aa823))
* **test:** Updated AWS SSM Documents ([e0475dc](///commit/e0475dc61a56e2ce92ae81a0972320ec696f9a06))
* Update lambda rotation IAM role policy permissions ([601a909](///commit/601a90970d8838f4adcc3bfeac721c57f4362b5e))
* Update userdata.sh script for phpMyAdmin instance ([bc39b14](///commit/bc39b146478b3bf3652d127158233e88d7ada53c))
* **test:** Update AWS SSM documents ([c2fce87](///commit/c2fce8781aefdc11f86d4494c8c7e7da37716a86))

### [3.13.6](///compare/v3.13.5...v3.13.6) (2020-07-22)


### Features

* Update modules version to v0.26.2 (option to deploy EB app from S3) ([fc07a72](///commit/fc07a72acf1d0e473c6cb5f54b5a77b687d5aebe))
* **demosystem:** Update modules version to v0.26.2 (option to deploy EB app from S3) ([718a98f](///commit/718a98f7db43fa1036a087f54767502ebd6736e1))
* **test:** Add ssm document resources; Updated modules version; ([e890539](///commit/e890539e6ed330113b16533efd9aa7b3c7f547da))


### Refactor

* **pseudo:** Change IAM role responsible for pipeline usage, use EnBWContributor role so we can delete KMS keys ([d997baf](///commit/d997baf591dd0b70bf2cb0eddb8fc9ea936829a8))


### Chore

* Update Ec2 service role permissions - S3 - s3:PutObjectAcl for uploading objects into pseudo S3 (cross account) ([be064d2](///commit/be064d2532571f787e98f5c7b8e4fd6d9bb47cba))
* **demosystem:** Because we created new EB name, we needed to update relative resources depending on EB environment ([502866f](///commit/502866ff918b72d682acf6cb4f163278bd9b4058))
* **non-prod:** Updated Ec2 IAM role - Cloudwatch and S3 permissions ([0ec330d](///commit/0ec330ddad86750681af2dd4e2f78525742b7137))
* **pseudo:** EB - Powercloud application version updated ([d02e07b](///commit/d02e07bcd7ba70637fd0dff81219d9cd3da5f1bb))
* **pseudo:** Optimize environment infrastructure - removed SNS resources ([35acabb](///commit/35acabbe6ae3c031a1e6765ac7ecf27ccdb204f9))
* **pseudo:** Put bucket name in locals ([210334f](///commit/210334f1b546d52bde116f1fcde261707597952d))
* **pseudo:** Update mysql S3 bucket policy ([d1f9acd](///commit/d1f9acde23737c74ec36c31a185fead7953b3e9b))
* **pseudo:** Update ssm document ([912bde9](///commit/912bde9c94e0d752bd22ba855674e3f37f3640e4))
* **test-prod:** Scale down elasticache cluster instance type ([aec950e](///commit/aec950e803cf0de41fc2d8673db04bb8ad15c7a7))
* **test002:** Set elasticache instance type back to cache.t2.small ([562219b](///commit/562219b969fdfca0a41de5757818b0fdb322b1d1))

### [3.13.5](///compare/v3.13.4...v3.13.5) (2020-07-20)


### Features

* **pseudo:** Deploy S3 bucket for storing exported mysql files ([36f9c58](///commit/36f9c58ef327a277246910b806c92f7d1a71f1bc))

### [3.13.4](///compare/v3.13.3...v3.13.4) (2020-07-18)


### Refactor

* **pseudo:** RDS snapshot identifier can now be set through exported environment variable ([e6bc2ce](///commit/e6bc2cec1f45e2c2fc30a306bf60488d170d5807))

### [3.13.3](///compare/v3.13.2...v3.13.3) (2020-07-17)

### [3.13.2](///compare/v3.13.1...v3.13.2) (2020-07-16)


### Bug Fixes

* **terragrunt.hcl:** Update DenyPowercloud tag logic expression - reason is that we can have multiple EB environments or different EB env name so using local.stack will not work ([06141db](///commit/06141db1c22741dd2582159143fef413dcbb8e42))

### [3.13.1](///compare/v3.13.0...v3.13.1) (2020-07-16)


### Features

* **pipeline - pseudo:** Deploy common environment ([9e17214](///commit/9e17214381234b16cfe44edce7920f6185fd08a5))


### Bug Fixes

* **terragrunt.hcl:** Update DenyPowercloud tag logic expression - reason is that we can have multiple EB environments or different EB env name so using local.stack will not work ([973e658](///commit/973e658bc4ac92e37ffc369ec6930ee0a40633b2))
* **terragrunt.hcl:** Update DenyPowercloud tag logic expression - reason is that we can have multiple EB environments or different EB env name so using local.stack will not work ([9c53ca7](///commit/9c53ca7e7fbded9efd077e7b60a00f0443f8edd6))


### Chore

* **infra-app:** Update powercloud.zip version (latest test002 version) ([e165eb9](///commit/e165eb954a4b52954c1f73b109625897f28f40c8))
* **infra-app:** Updated EB platform version ([687050a](///commit/687050a0090c82210a9212a469734d46f7cdc52a))
* **pipeline templates:** Update templates ([87e07dd](///commit/87e07dd820bf0873ff192f470b5c70c1f2c2d095))
* **powercloud-ec2-role:** Update CloudWatch logs access policy ([3e21a1d](///commit/3e21a1dcc5661834bae20232ddfc7c51f9f78bf2))

## [3.13.0](///compare/v3.12.0...v3.13.0) (2020-07-15)


### Features

* **dev001:** Added Digital Layer proxy services as ingrass rule for EB load balancer ([6be0066](///commit/6be0066e2b8f318d121c19b28ecbcb61473f5058))
* **dev001:** Added ingress rule for Powercloud RLM service ([fffd862](///commit/fffd862c37a1d411a3acd0235ac5d7312e61ebe9))
* **pseudo:** update phpMyAdmin userdata script; Created S3 mysql bucket ([457d585](///commit/457d585eefde26f41d46f1c353c4f85e315b2fdc))
* **terratest-common:** AWS SSM documents ([69e8684](///commit/69e8684b7650e84258406df440e2863570eedcaa))


### Bug Fixes

* **pipeline - destroy-infra:** Added stage dependency ([770a62d](///commit/770a62d7283d47346839703aa35a6706acb33ef8))
* **pipeline - destroy-infra:** Update service connection for pseudo environment ([06500cc](///commit/06500ccea50096eb2e58b18d651908f65e228aa1))
* **pipeline - live.custom:** Fix validate command and set working dir script expression ([60635f3](///commit/60635f33b6714826ea52f35d6ce5771af0a15ece))
* **pipeline - live.custom:** name for bash task validate command ([df1fbcd](///commit/df1fbcde7a2b098364332c1d2469b6e16eb7def7))


### Docs

* **pseudo:** Added README.md ([97ef9d5](///commit/97ef9d51a32712b9e3181346ec96e532c46d7307))


### Refactor

* **pseudo:** KMS key moved to common env; phpMyAdmin moved from common to pseudo; ([c969b12](///commit/c969b12e7d157d7aa19316ab399e7e6c8fc1b5f1))


### Chore

* **AWS Secrets Manager:** Update secrets description ([82c5c92](///commit/82c5c9297ff24566078b26b3d7b53f0356846d14))
* **dev:** Set EB env name to TEST001 ([777d06e](///commit/777d06eebe8bea948e172de472ceeb6987606893))
* **dev001:** EB - enable user login ([db13906](///commit/db1390693ceeb541159400af8ece31bf739dcc0d))
* **dev001:** EB - Set SOFT_MAINTENANCE = 1 ([2084b0d](///commit/2084b0dd7d5fc53a85971191ed0fa95d00026510))
* **pipeline - destroy-infra:** Add pseudo stage ([a013d67](///commit/a013d67c5adfe98353cbc6b1a9da4ba8dfff9554))
* **pseudo:** Lower serverless db capacity ([65e0efd](///commit/65e0efd712d36bf9d1ca8a7e6eb083f0580f10ac))
* **pseudo:** Optimize infrastructure for performing pseudo tasks ([a4beeb8](///commit/a4beeb898349e6d0a3d00200dfab723c723db7f7))
* **pseudo:** Optimize infrastructure for performing pseudonymization task ([751337f](///commit/751337fc251632ba45553e59fa01aa173224237e))
* **pseudo:** Optimize infrastructure for performing pseudonymization task ([66201e8](///commit/66201e8bc0e55295c703a52716621395c0168bf3))
* **pseudo:** Remove EB makobis dependency, update README.md ([ad91a05](///commit/ad91a05c44d6ab70bb37d1e5bc16ad840f3aa1c4))
* **test002:** Enable Powercloud user login ([1ae82a7](///commit/1ae82a7fa3ff0cb38f12f7e60a5f2b3ad2bf54d3))
* **test002:** Update  permissions on Konuti IAM role - allow EB access ([5e70192](///commit/5e701921e593f8b3dcf928c2a95e97f0a2f40394))

## [3.12.0](///compare/v3.11.0...v3.12.0) (2020-06-18)


### Features

* Set EB archive bucket to endia -> AR_DEFAULT=endia ([8649d56](///commit/8649d5605318dcc90c9210f51f1c4e7c4cbf4ca0))
* **dev001:** New database snapshot identifier ([d74ff5b](///commit/d74ff5b090bfe6af33d13fd9e48eaa81647a56de))
* set rds_skip_final_snapshot to false - when/if db destroyed take final snapshot before destroying ([bff0a45](///commit/bff0a459a2d25303feae142c331ca1187382c4e9))
* **aws-s3-archive:** Set bucket policy ([d3083ff](///commit/d3083fff428e35ae86ba7838b86b23931e196234))
* **pipeline - pseudo:** Add pipeline for pseudo ([a6d33ab](///commit/a6d33ab1c2754c7ddc14c7e44b4025ca73b09d4e))
* **pseudo:** Add mysql S3 bucket where exporte mysql table will be stored ([f2c02f5](///commit/f2c02f593993282d8793fb6aab58ba2cdfeb6287))
* **pseudo:** New environment initiall commit ([c080943](///commit/c08094398ffd85b626af9bfb73697697d8564fb6))


### Bug Fixes

* **pipeline - destroy-infra:** add stage dependency ([9b5cfec](///commit/9b5cfec23a34e237a3ec6294b36641355fe467ca))
* **pipeline - destroy-infra:** Destroy common env should be last step ([2932edf](///commit/2932edfaf15eceb080040ef98cb4534c5b8a7561))
* **pipeline - destroy-infra:** yaml typo ([cc35553](///commit/cc35553a643c184fbeba68cb656b02d0da941b6f))
* **pseudo:** Set correct environment VPC CIDR ([2de9982](///commit/2de9982b0cf067057379840d8650c52c1e57b54c))
* **pseudo:** Set correct environment VPC CIDR ([67a34c3](///commit/67a34c3fd49f6ad9ef70999162364519a2f7b3a8))
* **pseudo:** Set correct environment VPC CIDR ([1ad5530](///commit/1ad5530cda522fdc7225418fc37cabbc3a89bf31))


### Chore

* **_global:** Add AWS Account IDs ([5514ffc](///commit/5514ffc62ade0b0641ecd7b2047da2dc54cf8127))
* **pipeline - dev.live-plan-all:** New pipeline for dev001 ([fe7db68](///commit/fe7db688d25538aa89d09d66396e4169dee84360))
* **pipeline - live.custom:** add deploy action -> none ([63863ec](///commit/63863ec83c868ce6f22d46672e561deaad6317ba))
* **pseudo:** EB - enable immutable deployments ([0914970](///commit/0914970ee6074c3fcf7c890a908922927a116ee6))
* **pseudo:** EB - enable immutable deployments ([6b15968](///commit/6b159686351f3dcb3999ff707fbcfe13313eeda9))
* **pseudo:** EB - enable immutable deployments ([70541bc](///commit/70541bc806d12cc9ae8e82d22747ccf3d94c8218))
* **pseudo:** EB disable user login ([dbc3434](///commit/dbc34343d1fbfaeca3447053978c37f8aba3c439))
* **pseudo:** Increase Ec2 and RDS instance type ([e16fc3a](///commit/e16fc3a3414002177bd8c5f9f34d811571edc7b6))
* **pseudo:** Increase instance type ([d972b06](///commit/d972b06979600a19f142deaaa586d423e3bc2ffa))
* **pseudo:** RDS Aurora serverless capacity ([4668dec](///commit/4668decd14a1b0ebc4e4687ef37c15719ea76639))
* **pseudo:** Remove sengrid secret id from EB ([2564f3c](///commit/2564f3ceeee816db04628e96b75e8b0d606278ae))
* **pseudo:** Set deployment_policy back to RollingWithAdditionalBatch ([efa320f](///commit/efa320f3b22e3fe5c52fb5b1b0bc4ac55d9a55e3))
* **pseudo:** Set deployment_policy back to RollingWithAdditionalBatch ([ceef77c](///commit/ceef77ce898ddb5775cc3a1152231a5f7fbc73d0))
* **pseudo:** Update security groups ([d3c80ea](///commit/d3c80ea4774a20383c2ef21b4f66f2d963a063ae))
* **pseudo/elastic_beanstlak:** Ignore healtch check ([4130e60](///commit/4130e607e0cf476835973a2d856f82ecd7475505))
* **pseudo/rds:** Set snapshot identifier ([054c0d9](///commit/054c0d9851d66be926522e3cd04dd309743551c3))
* **pseudo/s3-deplyment:** Add prod version of powercloud application ([dd95c41](///commit/dd95c412a22da157a104786d1a673d175fd23379))
* **test002:** Set new snapshot identifer ([a0e69ea](///commit/a0e69ea30eb567911f43576e8f85756cda7caead))
* Update RDS KMS key policy prmissions - remove permissions that allowed Prod account to use KMS Key ([3e5889b](///commit/3e5889be842210dc7c30b880cde53359fbfdcd82))
* Update s3-access policy for EB service role ([2dd1307](///commit/2dd1307a00e850e98c630e94e21b2a80f5c4cb97))


### Style

* Add comment to describe variable ([dcf87b8](///commit/dcf87b8d8c07a5b51050c7b1076a41e2e7b4ab3d))
* Comments deleted ([264a798](///commit/264a798f416ce7b34d46a60f99b2781603439c79))
* **terratest:** Add/update comments ([be6e28c](///commit/be6e28cc42ef2aac1c126506c42be8344a07f343))

## [3.11.0](///compare/v3.10.0...v3.11.0) (2020-06-15)


### Features

* **infra:** Add Powercloud source code to S3 deployment bucket ([98397c8](///commit/98397c8c0f2a8a53a6b64ee5a652873dd4cf9e52))
* **infra:** Deploy Powercloud application from S3 ([9ef44aa](///commit/9ef44aa7c89c702236f5420322f7f32e91f792be))
* **infra/aws-elastic-beanstalk/powercloud/environment:** Set app_version_label ([de1ce2a](///commit/de1ce2aab9ca4bb3709aa2d42ada5d1f7b10a6bb))
* **pipeline - live.custom:** Run in parallel actions plan-all and apply-all ([66ae00c](///commit/66ae00ce8dacac1ced4b8654b3233056cc2c40ae))
* **terratest:** New infraApp environment -> example how to deploy custom (Powercloud) application from S3 deployment bucket ([89b06d4](///commit/89b06d42b79a04ae56145dc58d2e508db897872f))


### Bug Fixes

* **infra:** Update rds snapshot identifier - it's now encrypted with defautl RDS KMS key: aws/rds ([22cd526](///commit/22cd526a4792e13c66d064d9a560fa2f736e6771))
* **infra/aws-elastic-beanstalk:** Fix path to eb_vars.hcl ([e44c1f1](///commit/e44c1f131d405e795dbf3c6fc0415a4f288fc0b2))
* **pipeline - live.custom:** Unexpected mapping typo ([8167870](///commit/8167870d6381017c7ba750a79137118d128fb7f8))
* **pipeline - live.custom:** Unexpected mapping typo ([74832dd](///commit/74832dd4bb11daaab01e440c05d66baf864d1fdd))
* **pipeline - live.custom:** validate command for whole infrastructure deployment (all:all) ([821f6f9](///commit/821f6f995876a6c7ce1c2d476f8f4a7111b6b84c))


### Refactor

* **infra/aws-elastic-beanstalk/powercloud/environment:** create eb_vars.hcl which will be used by both EB environment and application (common EB variables) ([11073a2](///commit/11073a26f008f9197db8b2f0928dd5f23378a2f8))


### Style

* Delete comment(s), moved to docs ([6f6a7d8](///commit/6f6a7d82e0cd06d8691a619fae18e34f68e96f06))


### Chore

* **infra:** deleted acl-serverless-snap rds test instance ([9305aab](///commit/9305aabbb0020436add5f68da535a97331c834f8))
* **infra:** Update rds snapshot identifier - new snapshot - password for powercloud db user has been set/updated ([b2b3a50](///commit/b2b3a509de945de3a8985f0176e7ad361b64ca12))
* **infra:** Update rds snapshot identifier - new snapshot - password for powercloud db user has been set/updated ([23ab726](///commit/23ab72609d4bcb5b54c666c0aa2c680efd53af89))
* **infra/aws-elastic-beanstalk/powercloud/environment:** Set healthcheck_url to /health and ignore_health_check to false ([b62cd1d](///commit/b62cd1dd22c85b7812d56f0ac5b14a261aeb4998))
* **pipeline - destroy.infra:** Add new stages ([b6caae2](///commit/b6caae2cabd94dc5465d38a382f2701587a220e0))
* **pipeline - destroy.infra:** Add new stages ([929c04d](///commit/929c04d46bc18a04f545d98a2e0b7c08b77f1efa))
* **pipeline - destroy.infra:** Add stage ([aaed4e1](///commit/aaed4e1ac7ba32248d965094da335e800faf8efb))
* **pipeline - destroy.infra:** Add stage ([1d07581](///commit/1d075811d064a4362f2c60af75b17ff6cfee99e5))
* **pipeline - destroy.infra:** Delete stages ([b03afc8](///commit/b03afc86079975363098fef72a6ff80673d291a1))
* Delete not used local variables in rds_resource_vars.hcl ([850b5ea](///commit/850b5ea65880cc90e12774f123aabcd361e821f4))
* Set mocked output ([d5f9416](///commit/d5f9416e1462b3a190e15341125f2521e8b143f9))
* **pipleline:** Delete git task ([be5391b](///commit/be5391b0ab32ae5c6827e213dc51e5f6dd0f6dfd))


### Docs

* Update docs ([b8e5b29](///commit/b8e5b2904cdf29000b28fcf3538fa5344f3c5e51))

## [3.10.0](///compare/v3.9.0...v3.10.0) (2020-06-12)


### Features

* **infra:** Enable RDS Backtrack, time windows set to 86400s (24h) ([1212bd3](///commit/1212bd350a980bea6b220d618e3046deedbecc6b))


### Chore

* **pipeline:** Update variable templates ([335b96a](///commit/335b96a54d6e4dfaaaf8b6bf55750fb285c84309))
* **pipeline/infra:** add acl-serverless-snap resource ([05d204c](///commit/05d204cacee430190cdeed2b214089410da89402))


### Style

* Format .tfvars ([17a0646](///commit/17a06460dc6cb4bdfc656a7fcf5ee15d92ebdac4))
* Format .tfvars ([7bc5cd2](///commit/7bc5cd2bf21a9e0ec0f2b2b07b7237bd04132af7))

## [3.9.0](///compare/v3.8.0...v3.9.0) (2020-06-10)


### Chore

* Update IAM policies -> arn:aws:s3:::elasticbeanstalk-*, arn:aws:s3:::elasticbeanstalk-*/* ([c4a7846](///commit/c4a7846767432c98146a22c2005cabb33d13bf40))
* Update Lambda IAM role policy with ec2:DescribeAccountAttributes permission ([a712809](///commit/a71280901baad1cd03ffeab93798efd5456f5919))
* Update version to v0.24.2 - fix(terraform-aws-lambda-rotate-secret): Update Lambda function, conditional check for enable_automatic_rotation fixed ([25caded](///commit/25caded5092e9e67c37163d81e2ffbd6014b6ca2))

## [3.8.0](///compare/v3.7.1...v3.8.0) (2020-06-10)


### Chore

* decouple EB env variables, static variables are now set in env.hcl ([24b9428](///commit/24b94280d63a36de5c2c8b5c04406ae910717198))
* **infra:** Set pc-aurora cluster size to 1 ([98f3c04](///commit/98f3c04e295ec7ff8c31ea6c150dee2fc32273d9))

### [3.7.1](///compare/v3.7.0...v3.7.1) (2020-06-10)


### Features

* Update modules version to v0.24.1 - Update RDS security group Name tag ([fecf174](///commit/fecf174b3b06ef1c2f4a9ea37ca36829b59ce4fa))


### Docs

* Update docs ([4351674](///commit/43516743e3437ffdd11176f0b3c0ccfde3d35cff))

## [3.7.0](///compare/v3.6.5...v3.7.0) (2020-06-10)


### Features

* Update modules version to v0.24.0 - Option to set RDS backtrack window; Rename rds cluster parameter group; ([c45441d](///commit/c45441d9b3f5180567294aa72b4a69a8edc3a6f6))
* **aws-elastic-benastalk:** Add rds_hostname dependency ([4116ff9](///commit/4116ff9707cd44b07f415652f8cd97c46fe187bd))
* **aws-elastic-benastalk:** Set rds_hostname dependency for env_vars_custom ([f9d20ad](///commit/f9d20ad3b19b71f58906769d5b9ffe47a66377fd))
* Update terragrunt version ([c431ff3](///commit/c431ff362883623c17cbd82dd1c837aa2ebeab34))
* **pipeline - live.custom:** Add action for plan-all command ([60c1a99](///commit/60c1a9997ce75161e3a431cd7cc8bd816fd2f157))


### Bug Fixes

* **pipeline - live.custom:** Step name appears more then once ([4b26949](///commit/4b2694941d24dde20ccf60d5fd4ecc77fc3f81a0))


### Docs

* Update README.md ([47f839b](///commit/47f839bda9d6202f78c627d83e29e10507db466a))


### Style

* Add/delete comments ([1a2ac9f](///commit/1a2ac9fa813b4d59e698a3c4356fe2dd803a9a67))
* Old comments deleted ([581e6cd](///commit/581e6cd4c4a802c0259c2ef56f45f2edca6db8ed))


### Chore

* **dev/elastic-beanstalk:** decouple EB env variables ([86d2cd0](///commit/86d2cd093afcce6f793e70302b9023e2561a8be0))
* Define db parameter group parameter as lowercase ([8348469](///commit/8348469d8646230c8e34f2831d19754c13235f16))
* **infra:** EB is now using CNAME from Route53 as RDS_HOSTNAME environment variable; EB env variables are now split in env.hcl file ([ad2b01e](///commit/ad2b01e0a59e93f42b0aa7c1da6ef30a7334904f))
* added docs folder ([a86f9d8](///commit/a86f9d86a16e89a7011a0e0133be25941fbbb7dc))
* **infra:** set root_volume_size to 16 an increase inctance type to small ([073b1ab](///commit/073b1abe4d6cab9ad9b532940a95578333ab83f8))
* **infra:** set version dev -> v0.23.0 ([7764318](///commit/77643187ffc1ec761858ab4465343bcc8277f817))
* **infra:** Split EB env variables, put in env.hcl ([e4b4d20](///commit/e4b4d20b23bdc75bd2ed50f55abffea26de2a227))
* **pipeline - live.custom:** Add plan-all and apply-all when runEnvironmentsInParallel = yes ([ea2a19c](///commit/ea2a19c3de2ed3865696be3deb759f46fbd6aa92))
* **pipeline - live.custom:** Disable plan-all and apply-all actions ([edd7ba4](///commit/edd7ba45f5bd8045a29a563a5549cc4d84fbb662))

### [3.6.5](///compare/v3.6.4...v3.6.5) (2020-06-08)


### Bug Fixes

* **test-prod/cw-exported-logs:** Set correct name for POWERCLOUD_S3_LOG_DEST  -> test.prod ([b37537c](///commit/b37537c76a727339f83b86f122a438e9da5f3227))

### [3.6.4](///compare/v3.6.3...v3.6.4) (2020-06-08)


### Chore

* Lower executionTime to 60s ([6dbadb1](///commit/6dbadb12d21da11452a89738b364f48f93808f97))

### [3.6.3](///compare/v3.6.2...v3.6.3) (2020-06-08)


### Features

* Powercloud exported logs are now grouped by launch date of Ec2 instance ([405f6fd](///commit/405f6fd00e67effbdbf08f2579c426d6b55a6d17))

### [3.6.2](///compare/v3.6.1...v3.6.2) (2020-06-08)


### Chore

* Disable S3 bucket versioning for exported-logs and makobis ([714d55b](///commit/714d55b15cba7d9195e0f290077a197c95dea185))

### [3.6.1](///compare/v3.6.0...v3.6.1) (2020-06-05)


### Features

* **pipeline:** apply-all action can now be used ([16cd52b](///commit/16cd52bc62f83aa7ed8d94c92dfc7ccc5b37c5a8))


### Bug Fixes

* **aws-rds-cluster:** Set mising snapshot_identifier parameter ([ee580c8](///commit/ee580c8da7487bed61164f7dcd02baf07068d487))


### Style

* **pipeline:** Delete comments ([6d11928](///commit/6d119280fe42553206cf6f875a8dc15d4af8c82f))
* add comment ([5069e27](///commit/5069e27fc09c8f4c160d4c4abb6d8665cb45b941))


### Chore

* Set EB ENVIRONMENT_NAME for dev001 -> TEST004 and demosystem -> TEST005 ([f6d2fe6](///commit/f6d2fe667819fb3833168736e9fd04f5680be37c))
* **demosystem:** Elastic Beanstalk - Set correct Powercloud healthcheck_url to /health ([5789ea1](///commit/5789ea1b6666762540dc07ccd1f579edb937d4ed))
* **dev001:** Increase root_volume_size 8GiB -> 16GiB ([49bb3ac](///commit/49bb3ac5c7fd83d0975b52b1ab45b8ef09555d6e))
* **dev001:** Set ENVIRONMENT_NAME to TEST001 ([ebd5b8a](///commit/ebd5b8a4ecbed0a0945ca05bdd0a02e743ebaaf2))
* **dev001:** Set healthcheck_url=/health; Set Load Balancer certificate; ([4e881a3](///commit/4e881a326f8996fd1e2df39385669647f10f8b07))
* Update IAM powercloud user permissions policy for S3 access -> in case of versioning enabled on EB bucket policy should have s3:PutObjectVersionAcl ([26b762d](///commit/26b762dedc0627a9471199ff9e75a835824f27ad))
* Update IAM powercloud user permissions policy for SNS access -> add sns:Subscribe action ([d411a6a](///commit/d411a6af7edb902047ddcd99f18a2fc05c3f72c6))

## [3.6.0](///compare/v3.5.0...v3.6.0) (2020-05-26)


### Features

* **pipeline:** stage for deploying multiple environments ([a759806](///commit/a75980608f4b2629b39dd2a644d111c0600a1f2d))
* **pipeline:** stage for deploying multiple environments ([bbd41ab](///commit/bbd41abb416e0b860c3e7f62d8fcbb36ad604730))
* Update lambda function for rotating secret -> Enable automatic secret rotation for rds-master-secret ([35c246b](///commit/35c246b39420927516318e892fe0d89d65507314))
* Update module versions to v0.23.0 -> Enable/Disable secret automatic rotation | Update Lambda function for rotating secret ([a8bc7e2](///commit/a8bc7e271079779c2027840798d22b934957524d))
* **infra:** Enable rds master secret automatic rotation ([566f8d2](///commit/566f8d27ff57eedf2f85326e7cad36e1b7ee771b))


### Bug Fixes

* **pipeline:** a mapping was not expected ([ef95aed](///commit/ef95aed4b7cc745caefc180e13e11e9016e798ee))
* **pipeline:** job name must be unique ([6340a2b](///commit/6340a2b7542cb81d6ae240e03156a40fa155ad3a))
* **pipeline:** job name must be unique ([f7eed6c](///commit/f7eed6c3f204fad9c818a909161bdd30a4183248))
* **pipeline:** stage name must be unique ([49a5849](///commit/49a584974321b1b09d90fdb382e8ae8a9f17d33c))
* **pipeline:** stage name must be unique ([0267b56](///commit/0267b56e40bae83fd64628db68fba8291349daf7))


### Chore

* **pipeline:** add common environemnt to deploy ([c7fcae6](///commit/c7fcae67dd3193e325e9f96a608c0b666a5d5df7))
* **pipeline:** add xxx-all command options ([1b02d39](///commit/1b02d39ef21084b23abd8decf28f849435d85b57))
* **pipeline:** revert delete pipeline ([3c5ebd0](///commit/3c5ebd04b58cd255e6a7976f14aea4f87192ac06))
* **pipeline:** Update live.deploy-environment pipeline ([9b2bfa3](///commit/9b2bfa35500a96c1aab5f0bcc3694726d6babc76))

## [3.5.0](///compare/v3.4.0...v3.5.0) (2020-05-25)


### Features

* Update Elastic Beanstalk solution stack version to -> v2.9.6 ([6e7cf44](///commit/6e7cf4460aba616dbb6cc7daaf490cd0623ae141))
* **dev:** Update Elastic Beanstalk solution stack version to -> v2.9.6; Decrease phpinmi_memory 512M -> 256M ([41700c5](///commit/41700c5c3d8315bcb147537b7c9bfbdb4e86e8cc))
* **dev001:** New development environment -> dev001 ([9f3c392](///commit/9f3c3920dbe2a3b4659d660590283aa42e5230ab))
* **infra:** Update eb_solution_stack_name v2.9.4 -> v2.9.6 ([0556ce8](///commit/0556ce844e7123c643f20e816324e2da93203dbe))
* **pipeline:** add common dev pipeline stage ([df94967](///commit/df949674080b5ea8454ae95a6d7e5c6f566cb660))
* **pipeline:** dev001 apply module pipeline added ([524a56d](///commit/524a56d854386c17f25449912c23dc5b8e7d9c24))
* **pipeline:** New environemnt deployment pipeline ([a43f7da](///commit/a43f7da283a8627fb53db5514e0ac63520ce54bc))
* **pipeline:** Template now supports apply-all action for deploying whole infrastructure environment at once ([2c9d6ad](///commit/2c9d6ad2bf51aa91eaaa129696373fd740571caa))
* Lower EBS volume disk size dev/test 128GiB -> 16GiB; prod 512GiB -> 256GiB ([ca5740e](///commit/ca5740e7d65f15a50b5ebb37aea7c232ff230e67))
* Update modules to version v0.22.0 (Decouple EB environment variables settings) ([bc3c9e1](///commit/bc3c9e15674b91adde46e0c317700913373d798e))
* Update modules to version v0.22.0 (Decouple EB environment variables settings) ([23d759d](///commit/23d759d9e911d2c5296b94fc3e320a9265788335))
* Update modules to version v0.22.0 (Decouple EB environment variables settings) ([89ea0e4](///commit/89ea0e46946e83254189b8005a9c09d0d7e2eb17))


### Bug Fixes

* **infra:** Set correct secrets username ([e771a7b](///commit/e771a7b3821bb360211b5766df3ff0170fa5ec8e))
* **pipeline:** Correct path to dev001 rds ([948dbb5](///commit/948dbb5c0f7145697e6d242e65891eb8f13e9a88))
* **pipeline:** Correct pipeline template path ([a494e68](///commit/a494e681870e5bfe9bf70e476765ece0da738a6a))
* **pipeline:** Do not perform plan-all when deploying new environment ([e8af9a0](///commit/e8af9a0cd3f78f9c6dbadfc9c3526685a7ad435d))
* **terragrunt.hcl:** s3_bucket_tags[Terraform]' expected type 'string', got unconvertible type 'bool' ([a3dc935](///commit/a3dc9358e4c7b5be696dade6b9ef91d500427326))


### Style

* **terragrunt.hcl:** Add comment, update S3 state bucket tags ([57f08ab](///commit/57f08abd3802f6132fc1b2049bdc3375fbc00ff2))


### Chore

* **pipeline:** rename common pipelines ([635676d](///commit/635676d3aee444661d2adad509258ecdc32487e7))
* Dynamicaly set port 80/443 depending if Load Balancer has certificate ([0d7e4d6](///commit/0d7e4d60cf12fcb157ac2f082ddb97b243d5dc4c))
* **dev001:** Add RDS ingress rule -> allow traffic from VPN client security group ([5e2506a](///commit/5e2506a56d880d5df5eebcd71b4530691e940fa9))
* **infra:** Scale down ELasticache instance -> t2.micro ([acf6209](///commit/acf6209c3223c52e4b28d1df953071fcaba49b6f))
* **pipeline:** set plan-all action when deploying new environemnt ([a248022](///commit/a248022d96b4e782f0f95013be80cb23d38172ea))
* **pipeline:** Update job name for apply-all action ([f993479](///commit/f993479e1083ce63f5daa7b593df283d02eb84ad))
* **pipeline:** Update stage name for apply-all action ([04df896](///commit/04df896cfccf13ab78227a455577df6a4b96f4ff))
* Update to version v0.21.1 -> fix rds module: deleted dependencies.tf ([6733f2b](///commit/6733f2b58b96a04d5b3a8d794e8407054a61c739))
* Update to version v0.21.2 -> fix rds module: deleted dependencies.tf ([4f309d8](///commit/4f309d81afb3f51d07ef39f9fecd0b4e5adcd660))

## [3.4.0](///compare/v3.3.0...v3.4.0) (2020-05-21)


### Features

* Option to use git PAT in terraform module source (to be used in pipelines) ([20c1264](///commit/20c1264308daf9b2da0e240fb2436f3a3da5a06c))
* Option to use git PAT in terraform module source (to be used in pipelines) ([55d7529](///commit/55d7529eb1e6b6ccb5022ca681a26a053bb58603))
* Option to use git PAT in terraform module source (to be used in pipelines) ([4e83c45](///commit/4e83c45637e594a0ee42f60db67f68d5a4d2b9fa))
* Option to use git PAT in terraform module source (to be used in pipelines) ([81c4e59](///commit/81c4e5964a68733e902e6a37eea2562ff5d672a8))
* **dev/common:** Option to use git PAT in terraform module source (to be used in pipelines) ([17ae1e0](///commit/17ae1e015ffd7f8183bb988ea3dc318be48b5666))
* **infra:** Option to use git PAT in terraform module source (to be used in pipelines) | part 1 ([bc88ce9](///commit/bc88ce948f175989631e8571799b45593d169566))
* **infra:** Option to use git PAT in terraform module source (to be used in pipelines) | part 2 ([591536e](///commit/591536ed86ab587adb440daacfa662003b5e859e))
* **infra:** Option to use git PAT in terraform module source (to be used in pipelines) | part 3 ([96cc37c](///commit/96cc37c78af7d7609f075a369ff4f5aca5f45982))
* Update to version v0.20.1 -> update EB elasticache dependency ([caa45fe](///commit/caa45fee5b3e21553d06c5a0774717502b98c1a2))


### Bug Fixes

* **elasticache:** fix path to dependency module ([d986682](///commit/d986682684b4f619326160112e690809cb54667d))
* **elasticache:** fix path to dependency module; update elastic beanstlak ([dcc2c59](///commit/dcc2c590490e81fb51d99522c5776939d9c4372f))
* **pipeline:** Decouple steps for plan-all stage ([a8a37df](///commit/a8a37dfb1d67a60f8805531c01bb3c4e0c0c3817))
* **pipeline:** Decouple steps for plan-all stage ([961acd9](///commit/961acd9134ae28a721f6a7f849297774cf635852))
* **pipeline:** Separate steps for installing dependencies and running terragrunt command ([5fe55a5](///commit/5fe55a52ce74ab4a525b38214496f67fef1b8eac))
* **pipeline:** Separate steps for installing dependencies and running terragrunt command ([877564d](///commit/877564de761d62dfe77505e18422c4fc91361156))
* **pipeline:** Separate steps for installing dependencies and running terragrunt command ([28aed46](///commit/28aed461a3fce2cfab7d9d1703e345ae689de711))
* **test-prod:** CW target rule - set correct S3 name ([cbbc8e9](///commit/cbbc8e9be5dd8ad07dc8f19878156393b3d6f0ca))


### Chore

* **pipeline:** Rename steps.tpl.yml -> terragrunt.tply.yml ([5901fcf](///commit/5901fcfa697e3d2b4b2e10291e1309411ea672c3))
* **pipeline:** Undo delte of step - run-terragrunt-command.yml ([5a08fcb](///commit/5a08fcb1bb4862280922e42ea126f883fd09235d))
* **pipeline:** Update destroy-infra pipeline ([ae8f32f](///commit/ae8f32f4574be908c8c160c116f161cfa1f66931))
* remove permissions from powercloud-ec2 IAM role on rds-master-secret; Remove unused powercloud-ec2 IAM dependency from RDS resource ([c00fe40](///commit/c00fe404c824436c1626172e8dd2b5682a0fffbe))
* Set rds_backup_retention_period from 30 -> 14 days for non-prod environments ([4f39943](///commit/4f399430dea9001e964531c04164ab39401c4027))
* Update powercloud-ec2 iam role -> secret-manager-access policy ([b1faebf](///commit/b1faebf48a3bbb9ea07620298691a0db5f2813a0))
* **dev/elasticache:** Scale down Elasticache node to instance type micro ([3277e33](///commit/3277e33a34adf2065ca057f527747b786ce6694c))
* **elastic-beanstalk:** Update elasticache dependency ([8fccc88](///commit/8fccc88dc4d0200b8e8a55126af52d72776fe2a1))
* **infra:** PoC: define each module version sepratly in versions.hcl ([d5d62ea](///commit/d5d62ea0a4b2719c6410ddda47f876ef5730b120))
* **infra:** set module source to old format ([9ac9344](///commit/9ac9344a6165386942bc43a4a3da9fd562da1280))
* **pipeline:** Set default values (as examples) for terraformMultipleResources parameter in live.custom pipeline ([dbdd238](///commit/dbdd23826ee9622597073648660ad56331884628))
* **pipeline:** Update dev.live-apply-module pipeline ([336ade3](///commit/336ade33ff4b1f5146af57f8901bb279597e5585))
* **pipeline:** Update test-prod.live-apply-module pipeline ([1009147](///commit/1009147e1f31b9bcc92034e6cf359d3651afaf73))
* **stable.sh:** Update script ([7d1b8ea](///commit/7d1b8ea1cf462c79e2286c0cd434b99d6f19f4dd))

## [3.3.0](///compare/v3.2.0...v3.3.0) (2020-05-17)


### Features

* Update to v0.20.0 -> Elasticache DNS entry in Route53; Custom multiple stage deployment pipeline ([d86b193](///commit/d86b19378a4fac6f3f09e3bb4c6bb2fbff357bae))
* **dev:** Update to v0.19.0 -> stop using terraform-null-label ([57c6d7e](///commit/57c6d7ec6c44f341f2523d4df38d3bb83403148c))
* **infra:** Elasticache DNS entry in route53 ([fa26363](///commit/fa26363dd2e768e9652e646221f2035104de9d5d))
* **pipeline:** Custom multiple stage pipeline ([abb3ea1](///commit/abb3ea147e96d00686ec60f86c65cacd818f565d))
* **pipeline:** Custom multiple stage pipeline ([64da0a9](///commit/64da0a9f2ded001d3d5baf4d4c3dcc584e63b16c))
* Update to v0.19.0 -> stop using terraform-null-label ([f524953](///commit/f52495343fc18b2b79eb78358669cbc1dfa5223f))
* **pipeline:** New pipeline test.live-plan-all.yml ([c518c37](///commit/c518c37dbcbca1fe138e57d8f7db74e40932201c))


### Bug Fixes

* **elasticache:** record dependency output ([d3130b9](///commit/d3130b9c68cbc9cc7e067a2a90199cdd0abd0d79))
* **infra/elasticache:** Dependency output ([5722c2c](///commit/5722c2c8987834822d2dc6b7135c660481c8a16f))
* **pipeline:** fix path to aws-rds-cluster module for each pipeline ([5015cc1](///commit/5015cc1518884cdd83270acebf38e070db0db4ed))
* **pipeline:** fix path to aws-rds-cluster module for each pipeline ([ea6f40c](///commit/ea6f40c771b54280f5c11bfab738adee4e3e1d4e))
* **pipeline:** prepare for feature update ([fb5d325](///commit/fb5d325424449d5deaca702ebfdcc2ce2c3fa5b3))
* **pipeline:** prepare for feature update ([2e3cb9c](///commit/2e3cb9c114bd5c9bb95882d8a5216821baf6142c))
* **pipeline:** Stage for infra ([147a75f](///commit/147a75f16f58c48d1d12cfef905c0e48e782bf10))
* **pipeline:** typo in parameter name ([f3373a1](///commit/f3373a1968c45748ca5e667739b14db80f9e0eea))


### Chore

* **lambda-rotate-secret-sg:** use default name ([c55f37b](///commit/c55f37b09df3305698ed2e566df0932038e406af))
* **pipeline:** Add common environment to live-plan-all pipeline ([01abacb](///commit/01abacb656e87db16f138c72238dd3226c007c4a))
* **pipeline:** Add common environment to live-plan-all pipeline ([c4ef805](///commit/c4ef805b3ba71a0ecb2243465401a5aed5ab3ed1))
* **pipeline:** Add new terraform resource to pipeline ([374ae75](///commit/374ae751b5cae89a616c659c85306a1212260685))
* **pipeline:** add phpMyAdmin resource to infra plan-all pipeline ([2aa1f31](///commit/2aa1f31c5aa31105abd0bcc0f0580b7c85cee1d9))
* **pipeline:** prepare for feature update ([bfe0807](///commit/bfe08078f568958e9822a57a0ecf84cbbe7e7b4f))
* Update kms secret key tag name ([250b6cc](///commit/250b6cc3cd23f85ac2249019c096258a980e09f5))
* **pipeline:** Add resources to deploy to prod pipeline ([ada84a6](///commit/ada84a65e47384fdf9da94386fddcf28e79e22c4))
* **pipeline:** Add resources to deploy to prod pipeline ([ddb16da](///commit/ddb16da154126d3b9442b1f71a72e14ac42f25ae))
* **pipeline:** Add test common environment to live-apply-module pipeline ([2429621](///commit/24296217f832664358f5e13f8fb649b52229dd3e))
* **pipeline:** Remove make scripts executable step ([4280cf6](///commit/4280cf6008498505b520053de8be08daa1975549))
* **pipeline:** Remove make scripts executable step ([1ce0068](///commit/1ce0068269fa1b5f4638563e5679a82ef8bd8438))
* **pipeline:** Remove multiple resources from infra pipeline ([9a2640e](///commit/9a2640eb439fdb3249f74cdcb32605279ffe8b68))
* Update common environment -> v0.18.0 ([009ef28](///commit/009ef28f0b3ad929d26ff30c0f9b0e56d0d67bdc))

## [3.2.0](///compare/v3.1.0...v3.2.0) (2020-05-14)


### Refactor

* **pipeline:** Refactor terraform deployment pipeline - optipn to run plan-all command ([a94a3ae](///commit/a94a3aee35d746d8d8f78ec14dc4c3ab76549a1c))
* **pipeline:** Refactor terraform deployment pipeline - optipn to run plan-all command ([a0b1811](///commit/a0b18115775e9917de1e8caa6375a4a05dd87467))


### Chore

* Rename and update tariff_server_ips -> powercloud_service_node_nat_gateway_ips with new service node NAT Gateways IPs ([e1cb04a](///commit/e1cb04ac6c985126bd78422d8c896e616b78cd9d))
* Update infrastructure modules version to v0.18.0 -> fixed issue with data_archive provider (Lambda function) ([36ae0a9](///commit/36ae0a9fe3b90f358401c01e09c739b87f299326))
* **demo:** Delete demo stage ([18e6245](///commit/18e62453ea5984995d6ab4fb4c7c587114f9011d))
* **dev:** update to version v0.17.3-alpha.1 ([e54cbfa](///commit/e54cbfaec77ff3bf411019941aed357cef2f4a40))
* **dev:** update to version v0.17.3-alpha.2 ([3735810](///commit/3735810b7a2359e6bf43e542cedcf89c5a1649cb))
* **dev:** update to version v0.17.3-alpha.3 ([ee443f9](///commit/ee443f9faa434ebb69193528981d1018e36342a8))
* **dev:** update to version v0.18.0 ([8eb7e7e](///commit/8eb7e7e66b1e60f52eada88b32d69e87470e1757))
* **pipeline:** Set terragruntOptions to exclude Elastic Beanstalk environment when running plan-all command ([fa951aa](///commit/fa951aa63e39ea9568cd4fc2c5ee818fb9123f5c))
* **pipelne:** dev: add new deployment resource ([2e4b830](///commit/2e4b8305f4c65d07badb6a3ccb486cd2f96c3bb5))
* **pipelne:** dev: add new deployment resource ([6f57570](///commit/6f5757085df345f7412bed3f89069e2d4047162d))
* **pipelne:** Set pipelines to use live.yml from now on ([fce455d](///commit/fce455d4795a1d145bf74534b61a05e1c1378f29))
* **prod:** leave both old and new service node IPs untill we update Service-Knoten settings in Powercloud ([435960e](///commit/435960e1d60c6d26dfdc30a182d243ab0f1e44e5))
* **prod:** leave both old and new service node IPs untill we update Service-Knoten settings in Powercloud ([6b07382](///commit/6b073829cbc912370c3973bd5dba3561c0a8c5aa))
* Rename and update tariff_server_ips -> powercloud_service_node_nat_gateway_ips with new service node NAT Gateways IPs ([a43494a](///commit/a43494aa5f357d8c99fdf01725d2d064f7cd5150))

## [3.1.0](///compare/v3.0.0...v3.1.0) (2020-05-11)


### Features

* **test:** Elastic Benastalk application -> appversion_lifecycle -> Set environment version to v0.17.1 ([7bc69e4](///commit/7bc69e44e9f03c197b32a3dd03b438d199e321c8))
* Update modules version -> v0.17.1 ([e913da7](///commit/e913da7a8f043f132bff50645b62a340e05a96f8))
* **dev:** Elastic Benastalk application -> appversion_lifecycle ([2622e9b](///commit/2622e9b6d22c9f09b640948f08fe7bb6093066db))
* **dev:** Elastic Benastalk application -> appversion_lifecycle -> Set environment version to v0.17.0 ([1e62f80](///commit/1e62f800a1de8a57017327724db754f2ecc96f32))
* **infra:** Elastic Benastalk application -> appversion_lifecycle ([3681936](///commit/368193654338daa6b6b0e1490155cd0da2de1b31))
* **pipeline:** Use environment ([fd5b313](///commit/fd5b3132ff74b2f78103e5e014f9901ade4e3fc7))
* **test:** Elastic Benastalk application -> appversion_lifecycle -> Set environment version to v0.17.0 ([7a60168](///commit/7a60168eee00cdca5d6ade420544b5dbe49387bd))


### Bug Fixes

* **infra:** Elastic Benastalk application -> appversion_lifecycle -> use IAM arn instead of name ([0480181](///commit/04801813ad3f680780e640f4e62871e34778e708))
* **infra:** Fix dependency cycle ([469de8c](///commit/469de8cbd2ee3ce27b5e0514241f135ba634dacf))
* **infra:** set correct dependency path to iam lambda role ([982e6c0](///commit/982e6c04d1880d637814bc2a834cbbf9f5db73e1))
* **pipeline:** environmnet command not found ([515c7df](///commit/515c7df46f6a15c0904bda71974530a5e4dcfaeb))
* **pipeline:** job/deployment contained invalid name 13438(env) ([7adff87](///commit/7adff873ad1e78085244f5c3acec96a739a01534))
* **pipeline:** service connection not found ([ca55fad](///commit/ca55fadfec64bb05eda4172e8a981d1089e3739a))
* **pipeline:** service connection not found ([c39b934](///commit/c39b9349b8463f3aa1e2e6a1f714d41fd2a348bd))
* **pipeline:** service connection not found ([4c20ab1](///commit/4c20ab10f283a293968fd3d419d386df42da370b))
* **pipeline:** service connection not found ([34de322](///commit/34de3229163b0354c2abd06c43e1c06d42dc96a5))
* **pipeline:** set correct path to pipeline templates ([a4bf4db](///commit/a4bf4dbb24c50c9e838e522f48c92c9f0d12e06b))
* **pipeline:** set correct path to pipeline templates ([de64556](///commit/de64556dbd06767f3c31f0954d87f48afbcc2003))
* **pipeline:** set correct path to pipeline templates ([e75c42a](///commit/e75c42ab6eb38c4309615572771c8d3531927cad))
* **pipeline:** set correct path to pipeline templates ([d6b912d](///commit/d6b912d810980840835edee7613d23e878c7912e))
* **pipeline:** set correct path to pipeline templates ([96fabeb](///commit/96fabeb75df6fdcd1b5341eee24b49f3fba7569e))
* **pipeline:** stage contained invalid name NVM_DIR=/home/adriano/.nvm ([9571867](///commit/9571867405cc9ad0f133b3cde32ccf0b561269f8))
* **pipeline:** terraform need to authenticte against git by using System.AccessToken ([c0d5bdc](///commit/c0d5bdc07a0f7350394487b521f108124985b6e5))


### Refactor

* **infra:** Module source can now be either git::ssh or git::https (export PAT token as tf environment variable TF_VAR_GIT_PAT) ([7f38a05](///commit/7f38a05acfa587cc8eaedfb00db4111adb0185b9))
* **infra:** Module source can now be either git::ssh or git::https (export PAT token as tf environment variable TF_VAR_GIT_PAT) ([f808d75](///commit/f808d75e533a99e544f8dc4a6fe62a0b4bc65468))
* **pipeline:** refactor terraform deployment pipeline | No.1 ([29ef65e](///commit/29ef65eaab0964d2bda8204f6584312e9c5f1853))
* **pipeline:** Refactor terraform deplyoment pipeline ([a27402d](///commit/a27402d46448c8581ebfa91f47a13067c7bd326d))


### Chore

* **env.hcl:** Update to latest module verisons -> v0.16.0 ([db8dad4](///commit/db8dad46a9f78869d194da2c4bfce94885491ec9))
* **infra:** deleted infra-stable ([654d5f8](///commit/654d5f8e6026c587720f349590b3591a353f4f89))
* **infra:** module version will now point to master if TF_VAR_module_version is not exported ([4b6ddaa](///commit/4b6ddaa24a31b51f6fa3202eb9520902c040a8a4))
* **pipeline:** Add prod.live-apply-module.yml pipeline ([502b359](///commit/502b3592378de6f341bb5b17c6528d32e273e055))
* **pipeline:** Update pipeline ([f6dc1a6](///commit/f6dc1a658dc0bf888cfa70d3139ded56d7cc7a08))
* Update azure-deploy-infra.yml for Azure Pipelines ([1e27052](///commit/1e2705277477a895cb4eec4e6aec29c0be15437b))
* **infra:** delete heidisql from common and delete powercloud jumpserver ([42d302f](///commit/42d302f095ccb6b333c8a4d4f4daa6aebaf0b19f))
* **infra:** Set dev as modules version (dev branch) ([1ac1f2d](///commit/1ac1f2dbac6d3c36ae567ae646287e0f0ddda073))
* **pipeline:** Add pipeline common stage template variables ([4055fb9](///commit/4055fb9949f9d772378c38072ca02fb55b932020))
* **pipeline:** add set -e in script for getting latest git version ([ef17939](///commit/ef17939b7dd9bb3d756e2537b46b7d51b949a9ed))
* **pipeline:** Add validate-all step before apply-all when doloying infra env ([ebdab7a](///commit/ebdab7a36079950ea7939c53a638fc1983905177))
* **pipeline:** create folder for pipelines ([2b22af3](///commit/2b22af3ebcafc68f5ea6f456b2aba4cc6712436d))
* **pipeline:** Define name for artifact ([07ff8e6](///commit/07ff8e62ec65ca1cd46140c67b34197401638517))
* **pipeline:** export latest module version prior running terragrunt command - TF_VAR_module_version ([1eff8a7](///commit/1eff8a75d8f1bb1ee0accf72851c5217411dab99))
* **pipeline:** export latest module version prior running terragrunt command - TF_VAR_module_version ([67e59b3](///commit/67e59b39862fa343381bca1616ad85551cc7f511))
* **pipeline:** export latest module version prior running terragrunt command - TF_VAR_module_version ([6a1d660](///commit/6a1d6608984abf55394b24f6d328acaa07302fd3))
* **pipeline:** module version will now point to master if TF_VAR_module_version is not exported ([30203f5](///commit/30203f56f9cb264cc1ae49beeff08cae1b5524ee))
* **pipeline:** new yml pipeline az-pipeline.live-apply-module.yml ([e395361](///commit/e395361b0bdec33f31d115f4681be104dcf37ff0))
* **pipeline:** remove validate step from apply stage ([d185f61](///commit/d185f615116545188958ecfed99a842a69f1e1c6))
* **pipeline:** Set artifact dir ([8827e45](///commit/8827e452e7f4346dc62206fd4019990b95956280))
* **pipeline:** Update destroy infra pipeline ([3812837](///commit/38128374210c4428ad374e29376b6e92c1ede11f))
* **pipeline:** Update live-apply-module.yml pipeline ([1e62570](///commit/1e625707a65bf9fd3f88468bb4f217d017ef8002))
* **pipeline:** Update live-plan-all.yml ([ac81b35](///commit/ac81b35ee9429761b65104a98fc3f2631d0a7266))
* **pipeline:** Update live-plan-all.yml ([89d5ad8](///commit/89d5ad8fd193b199b5fe4475744513cded0d0128))
* **pipeline:** Update live-plan-all.yml ([498e1f3](///commit/498e1f33a0e2d1fa8ecae497275c31bbb8238a4e))
* **pipeline:** Update live-plan-all.yml ([3e5e1d7](///commit/3e5e1d7b364632228deb53959b53d26f91e6c643))
* **pipeline:** Update live-plan-all.yml ([547570f](///commit/547570f2491c0df9282332a3197cdcf6bff9f001))
* **pipeline:** Update live-plan-all.yml ([de00aed](///commit/de00aedd0bb6c05f24edb33c29278891c967cd0a))
* **pipeline:** Update live-plan-all.yml ([1659f59](///commit/1659f59d656a23af907651478ef9b527ebfcf979))
* **pipeline:** Update live-plan-all.yml ([45d5155](///commit/45d5155e7259eae4b6e427d1ce849c108adddace))
* **pipeline:** Update live-plan-all.yml ([b9ac005](///commit/b9ac00554fd93ba448013a27902ecac8af4e2057))
* **pipeline:** Update live-plan-all.yml ([af73a8e](///commit/af73a8e4402a17a7de93bced2a91a32aa3f96f02))
* **pipeline:** Update pipeline ([755b36e](///commit/755b36e3085c17847c7e7e8d6e89dd8bbdfd8e43))
* **pipeline:** Update plan-all pipeline ([5ff2c14](///commit/5ff2c14db3b061ebe170a112b88f351df58a3327))
* **pipeline:** Update plan-all pipeline ([86153b7](///commit/86153b712b051ecad5d91e720c695eeaa75a3634))
* **pipeline:** Update plan-all pipeline ([f7f1bf3](///commit/f7f1bf3d844e1e995fb1a6a495b34d36e805edc6))
* **pipeline:** Update plan-all pipeline ([29c4c19](///commit/29c4c19b69d25a267e6293d11530330852dd4bea))
* **pipeline:** Update plan-all pipeline ([049ae28](///commit/049ae288a10d7d41e8a0efbfef09447f3501262e))
* **pipeline:** Update plan-all pipeline ([a78298c](///commit/a78298c6ac06610fe6c716e2229f5df49ac8e6e3))
* **pipeline:** Update plan-all pipeline ([1fc7a10](///commit/1fc7a105bb963ff6eaa8af5dd7527c8580133b61))
* **prod:** Trimspace terraform source version ([81581d3](///commit/81581d3853628f1ead86ba4c5ff083eee4a48713))
* make copy of latest stable infra env ([388ea86](///commit/388ea8660c41913963bab144152274c5b1fb1636))
* Update commons env to module verison v0.16.0 ([4efc0b9](///commit/4efc0b97424a272a16f6dca82c7182defc7704cf))

## [3.0.0](///compare/v2.3.0...v3.0.0) (2020-05-04)


### Bug Fixes

* **infra/pc-aurora:** lambda dependency not found ([2ccfd7a](///commit/2ccfd7aad58530072ed5ba8d7a9ca149eab3ccbc))
* **test001:** missing attributes ([cd7077a](///commit/cd7077ade645bf039f6d67becf57822fc8c50636))


### Chore

* **infra:** rename lambda function dir ([e09261c](///commit/e09261c955ecb8a1d7840b74bf6ef6f27c0434ef))
* enable RDS cluster deletion protection ([3a88828](///commit/3a888284a43e7ee501215cbc93b868fe5fe0adbc))
* update modules version - fixed command in secrets manager module ([59431c3](///commit/59431c35cda4844ac88a902cd648b58bc5666b4e))
* update moudles versions to v0.15.36 - option to set RDS auto mninor updates on/off ([667ada6](///commit/667ada643ea3a9e788cc94fa7a9e75101a9e34dd))
* **infra:** update aws-rds-cluster ([cf185a3](///commit/cf185a37528dc0c0a60e2f6e945f220e9931e7c8))
* Update moudule version to v0.15.35 - Create tags for Lambda function ([e5a82f3](///commit/e5a82f3129454fc13cd0b7aaa0fe3705f09dbc16))
* **_global_vars.hcl:** Define NAT Gateway IP from VPN Client account ([2080954](///commit/2080954515274c49560805aefc68e915ee2b0547))
* **pipeline:** Add new stage - destroy test001 env ([10e1db5](///commit/10e1db55f32c8235bbc2b52bc32dcbf8dba5f05a))
* **pipeline:** Define missing service connection for test ([84c90d7](///commit/84c90d7e5d1adcaf0fc4abfbdba8a0bbfda8b28d))
* **pipeline:** Define missing service connection for test ([45524db](///commit/45524dbaf7ecd2802fd26f5935ee4eca5b17a1db))
* **pipeline:** Destroy infra rds aurora and servrless ([525e571](///commit/525e571d6ac7c2d7687c46fe941049e7c1859b90))
* **pipeline/_templates:** Update aws terraform provider version ([6fc5e9a](///commit/6fc5e9ab5787dbb0e9805dd69d5fba29ce7fb9a1))
* **prod/aws-rds:** Rotate secret (rds admin password) ([7661ba8](///commit/7661ba8a2c1d88ddbf6fd18caa96ae035d5a18fd))
* **test001:** tmp environment ([f44feee](///commit/f44feeefe1a36feb33cadaac108beb2955f0bf42))
* move some of the RDS variables to env.hcl ([b041131](///commit/b0411316107011a55ff2a151d11fedb39bfe2c3f))
* Update modules version to v0.12.15 [affected module: rds] ([21745a8](///commit/21745a82316ac641e84b5b3f4480dbf1f2c46650))
* Update RDS resources to use terragrunt direct dependency instead terraform input dependency defined in module ([74e49ce](///commit/74e49cec50bbb4563f3fa3d673151bcdafa2076e))


### Refactor

* **prod:** Decouple RDS module; Update Konuti access policy; refactor EB code ([29dae0b](///commit/29dae0b0f08559f97d644d499384b5cd21d3306a))
* Decoupeld RDS module; refactored EB ([3ba23a0](///commit/3ba23a069d4c9315d05cd77dd462875b2c15c0eb))
* **dev:** Update dev environment - decoupeld RDS module ([f4d732b](///commit/f4d732ba6147dbd6b25408be9b08eeca286b49cf))
* **dev/rds:** Decouple RDS module ([8cbc111](///commit/8cbc1115a34f8e67b5e1f907ee757cb339e25a68))
* **enbw-enpowerx-dev/acl-serverless:** Introduce hosted zone record as separated module - rds dns entry in route 53; delete secret module from rds; ([a1a3a4e](///commit/a1a3a4e11c1530ddd074bbc953ddaf9d5254ed2d))
* **enbw-enpowerx-dev/acl-serverless:** Introduce hosted zone record as separated module - rds dns entry in route 53; delete secret module from rds; Update module version to v0.14.1 ([ef74202](///commit/ef74202228ed69be7fb086b4f0dd8655d1008505))
* **enbw-enpowerx-terratest:** RDS, secret and lambda function decoupled ([4857772](///commit/4857772dba120f7f6743279d47a33d454005e17c))
* **enbw-enpowerx-terratest/infra:** RDS module decoupeld; EB nevironment updated accordingly; ([4f8d428](///commit/4f8d428b1f3a75d8cfb3702dce6d3a04ea082321))
* **enbw-enpowerx-terratest/pc-aurora:** Secret and lambda function for secret rotation now deplyoed as separate resources ([9e592e3](///commit/9e592e3e357691a9c9a72d93afc4d82acb14c314))
* **infra/rds:** Decouple RDS module ([0c623f9](///commit/0c623f997333b5620979f52d724f545f55e418d1))
* **test:** Update test002, test-prod, demosystem  environments - decoupeld RDS module ([e43a841](///commit/e43a841b373672c4fc75cdcc81a239ef366cf434))

## [2.3.0](///compare/v2.2.0...v2.3.0) (2020-04-17)


### Chore

* Create S3 bucket for storing exported logs from Powercloud Ec2 server ([e7033f6](///commit/e7033f61abb84538e0b9556efe5aa03f8880c024))
* Update powercloud service user permissions for new SNS topic ([22619bd](///commit/22619bda8691f85a3f713a62558f17269f61135d))
* Update service role permissions for powercloud-ec2-role (cloudwatch and secret manager access) ([7f03d5d](///commit/7f03d5ddc4985b46d36e19722e6d095141b61397))
* **infra:** Remove VPN sg dependency ([f43ed6f](///commit/f43ed6f449690968978cded8df28d40733ef668b))


### Refactor

* New cloudwatch event module; Refactor old ones, trigger can now be event based ([2977658](///commit/2977658b39b94686dc5106ac035bdf7019f292c5))
* **aws-cloudwatch-event:** New cloudwatch event module; Refactor old ones, trigger can now be event based ([92b9658](///commit/92b9658cc5aabe8d830565679f9759f46a4b2573))

## [2.2.0](///compare/v2.1.6...v2.2.0) (2020-04-16)


### Features

* SNS topic ([2e7c439](///commit/2e7c439cfacedc646a16fb4f228d296543213442))
* **terratest/infra:** SNS topic ([7706e75](///commit/7706e7519ebabf2f5328eee71189163f4e7975cc))


### Bug Fixes

* **test/demosystem:** Remove powercloud jumpserver as dependency from Elastic Beanstalk ([6b87433](///commit/6b874335c7ea2eddac7e942f5112d4d359f0c617))


### Chore

* **_global:** declare aws_vpn_client_sg_id variable using {} ([d4df9ce](///commit/d4df9ce3b96990431ad582ed3adbdb95fdaed51c))
* **_global:** declare aws_vpn_client_sg_id variable using {} ([6ee3fb7](///commit/6ee3fb79598c9b5e9ac6df6b15d1470b1ec22368))
* **dev/common:** destroy hedisql and powercloud jumpserver ([bfe5ee0](///commit/bfe5ee0b95651cd88f037884575922f00929fc29))
* **infra:** disable VPN security group ingress eb ec2 sg; enable for rds serverless ([921ba02](///commit/921ba02f2ec460104d6d8c8acbecf59db349f00a))
* **infra:** Enable VPN security group ingress ([0af79e4](///commit/0af79e427db88f6fc1e6acf4df420d9a89249a08))
* **infra:** Enable VPN security group ingress eb ec2 sg; disable for rds serverless ([00ed956](///commit/00ed956228efb686a7ec804a3cee8d90f296e27e))
* **infra:** Remove trimspace() function when referencing VPN security group ([51551ba](///commit/51551bab036c6297be2432a9f38d44b9ed7ee53d))
* **infra:** Use trimspace() function when referencing VPN security group ([c27aec4](///commit/c27aec4727417902b59a11ae43001ed4f8d9a9b1))
* Remove andy dependency for HeidiSQL (we are using VPN now) ([4598579](///commit/45985798c609db2a3e4c0bb112862e1a108fe74d))
* Remove andy dependency for HeidiSQL and powercloud jumpserver (we are using VPN now) ([1789a8e](///commit/1789a8e638385cfe12b2c96a7810333647704126))
* Remove andy dependency for HeidiSQL and powercloud jumpserver (we are using VPN now) ([c619c3f](///commit/c619c3f50ce357d63e8a535c89f7106b5a6b71e4))
* Remove andy dependency for HeidiSQL and powercloud jumpserver (we are using VPN now) ([6ff1a3f](///commit/6ff1a3f0c1f4ccbedb840fd11fec9d52d2f34bd8))
* **pipeline:** Add stage for deploying demosystem ([aaa36c4](///commit/aaa36c43f8dd8d3f1c08e96f2021f68117e47ff6))

### [2.1.6](///compare/v2.1.5...v2.1.6) (2020-04-14)


### Chore

* **prod/beanstalk-environment:** Remove dependency for powercloud jump server ([18e19e0](///commit/18e19e04b61fe22d43b45b7ce132492e27174950))
* **prod/common:** create S3 bucket for storing public SSH keys in order to ssh in powercloud Ec2 ([fbf0d4a](///commit/fbf0d4a7425a740a125e768c71f318e505a37276))
* **prod/powercloud-bamboo:** Update service user policy permissions (limit the scope of permissions) ([d31e538](///commit/d31e538926190b8b6759434bee98f2cfd3e7f993))
* **terratest/infra:** Define phpini_memory variable in env.hcl for Elastic Beanstalk environment setting ([3f6ac8c](///commit/3f6ac8cf324b915298fd50ac106df4706fc51a74))
* **test/common:** Delete common enviroments for: powercloud jumpserver and heidisql (we use now VPN) ([867f0b0](///commit/867f0b00296f1406e74f4082d8824af63499d29e))
* **test/demosystem:** Deploy new environemnt for Powercloud DEMOSYSTEM ([e3bfd95](///commit/e3bfd9510ca62127db65fe1a4e17dff6976fadc7))

### [2.1.5](///compare/v2.1.4...v2.1.5) (2020-04-13)


### Chore

* **non-prod:** Update modules version to v0.8.2 [terraform-aws-rds-cluster] ([c516b64](///commit/c516b64af56f09170b3d5eacef5f309f55a2fdd7))
* **prod:** Delete common enviroment - powercloud jumpserver and heidisql ([01f9cfa](///commit/01f9cfa1f68e20f92be675c3e7cca433182a5dcd))
* **prod/aws-elastic-beantalk/environment/powercloud-ec2-sg:** Remove powercloud jumpserver ingress ([48cc962](///commit/48cc962e8562fa3b479d0d6741c59dd28957296a))
* **prod/aws-rds-cluster:** enable general logging; remove heidisql ingress ([cbe4d58](///commit/cbe4d581cbbe16536d774bc7920f96a4d860a954))
* **prod/aws-rds-cluster:** Update modules version to v0.8.2 [terraform-aws-rds-cluster] ([c26ab6e](///commit/c26ab6eb4aab9fe9ca4f222faf049eea05c4f7d0))

### [2.1.4](///compare/v2.1.3...v2.1.4) (2020-04-06)


### Chore

* Merge elastic beanstalk allow and deny policy because of AWS IAM serivce limit of 10 managed policies attached per IAM user ([8ab8fa0](///commit/8ab8fa0d850eb88bcda9956e28d1bf6e43fd77df))

### [2.1.3](///compare/v2.1.2...v2.1.3) (2020-04-06)


### Chore

* **prod:** Delete scripts folder from RDS module ([b607e0a](///commit/b607e0aabff3bb92487edca1d49ec906e872061a))
* **test/vpn:** Destroy VPN temporary environment ([7e91542](///commit/7e915429cab669cb756a8cca923c68f08cc4a924))

### [2.1.2](///compare/v2.1.1...v2.1.2) (2020-04-05)


### Chore

* Update permissions for Counti role (access to AWS Secrets Manager) ([3a4c592](///commit/3a4c592d56ec79a1a10affd3bfc1bbf376302144))

### [2.1.1](///compare/v2.1.0...v2.1.1) (2020-04-05)


### Chore

* Update modules version to v0.8.1 | feat(terraform-aws-route53-cluster-zone): Ignore any VPC changes in order to manage additional VPC associations with private hosted zone ([be9aea5](///commit/be9aea52e0f4415d21aa72fc79e7f5a124b72877))
* **infra/dev:** Update Powercloud service user policy and permissions ([af1c576](///commit/af1c5767e3f7af8570fbbc6f8961799ac33b1da2))
* **vpn-client:** Add .terraform-version and .terragrunt-version files ([220c6e4](///commit/220c6e4d7210513bfb2d5c8076d059269f154927))

## [2.1.0](///compare/v2.0.4...v2.1.0) (2020-04-04)


### Features

* **vpn-client:** New stage used for setting up VPN Client connection ([bd2103b](///commit/bd2103b3347ed56aae772a15d98dd2295e42d06e))


### Chore

* **demo:** Update demo env ([82d90e5](///commit/82d90e566ac761334d92e4cd1d6fe4525aba76d8))
* **dev:** Add ingress rule for PC database to allow traffic from VPN Client security group ([b37dbd0](///commit/b37dbd0bde540f2d4707c54a99ecf722708c1709))
* **dev:** Conditional tag DenyPowercloud that will return true or false depending on stack name. Updated Powercloud service user polcies and permissions. ([5dc358f](///commit/5dc358fd2f2ad30b805dd45ccac653db6d84cd24))
* **dev:** Updated Powercloud service user polcies and permissions. ([d342e3c](///commit/d342e3c1a0eed47c23dc027cdbc75993296bc1d0))
* **dev:** Updated Powercloud service user polcies and permissions. ([d34fef7](///commit/d34fef765264b9f42046795d9b67d41d572fe22e))
* **dev:** Updated Powercloud service user polcies and permissions. ([7bce9b1](///commit/7bce9b12e69da45fd9fb9f6eb5ad46d6c8be57e6))
* **infra:** Conditional tag DenyPowercloud that will return true or false depending on stack name. Updated Powercloud service user polcies and permissions. ([7135134](///commit/71351348563a00d3a690f678e0d582a28bd8be1d))
* **infra:** Setup SNS topic. Remove Cloudwatch and SNS permissions from Powercloud user ([02c6775](///commit/02c677579fb1833268f385b37788aae43f154f49))
* **pipeline-deploy:** Remove validate stage ([844cc2c](///commit/844cc2ce92dd0980d0fcbd175739bc9ab21704fd))
* **pipeline-deploy:** Run terragrunt validate in seprate stage from terragrunt deploy ([10763ef](///commit/10763efe00719d92d072c84221c07e428223361c))
* **pipeline-deploy:** Run terragrunt validate in seprate stage from terragrunt deploy ([de8ec8b](///commit/de8ec8be20c8a7804f051d5f7f14d3f596c287eb))
* **pipeline-deploy:** set TF_VAR_dependency_skip_outputs before and after terragrunt validate command ([a3ee914](///commit/a3ee914434f76191bfd53463132ade5a0f3cf7e8))
* **pipeline-deploy:** Updated stages dependsOn property ([65c8809](///commit/65c88095e83630e90819f0441161b14644e9b87a))
* **pipeline-destroy:** Add flag --terragrunt-ignore-dependency-errors ([19e3de0](///commit/19e3de0af713940c051c441b64e4702340bc0cd0))
* **pipeline-destroy:** set TF_VAR_dependency_skip_outputs before and after terragrunt validate command ([34040b3](///commit/34040b30196896f4eaab0f8685b7724dd7e0635c))
* **pipeline-destroy:** set TF_VAR_dependency_skip_outputs before and after terragrunt validate command ([346c592](///commit/346c59284e897cb8db1c2795b8a328e3a3489b7d))
* **prod:** Rotate database password ([9716259](///commit/97162596722243f2b57d7d7ee669ef95ead2fa54))
* **test:** Setup resources for VPN client ([6cedee5](///commit/6cedee50f1aad4654479b5695b5dd30ecbf8d74e))

### [2.0.4](///compare/v2.0.3...v2.0.4) (2020-04-03)


### Chore

* **aws-cloudwatch-event/powercloud-export-log:** The logs are now organized and grouped by year and date ([92a07af](///commit/92a07af8b9e4ff2ab82515910fc36c964dfef681))
* **aws-cloudwatch-event/powercloud-export-log:** The logs are now organized and grouped by year and date ([a579823](///commit/a579823ec6a544f77d1662e403ff655b27c61159))
* **infra:** Conditional tag DenyPowercloud that will return true or false depending on stack name. Updated Powercloud service user polcies and permissions. ([1cd9168](///commit/1cd9168f5a331ac81f25ec085c6106ab3ed6c7e7))

### [2.0.3](///compare/v2.0.2...v2.0.3) (2020-04-01)


### Chore

* **vpn:** Creat temp VPN client in test. Setup AWS Vlient VPN resources in VPN account ([096d9f7](///commit/096d9f7db5558ea3a8a40f22a6d0ef4396befc83))
* Add ingress to phpMyAdmin instances to allow traffic from VPN Client ([f42d9c3](///commit/f42d9c3be2c940879da24aa8bb570eed13c7c2f4))
* Remove EDI_ALTERNATIVE_DATE from Elastic Beanstlak environment varaibles ([aeb2bb2](///commit/aeb2bb24478967971a80cfc10669667269829336))

### [2.0.2](///compare/v2.0.1...v2.0.2) (2020-04-01)


### Chore

* Update instances (Powercloud Ec2 and phpmyAdmin) scheduled time ([ea948a6](///commit/ea948a6cd7b6a434ef02daf90fbca0cac678a8d7))

### [2.0.1](///compare/v2.0.0...v2.0.1) (2020-03-31)


### Features

* **enbw-enpowerx-demo:** New environment setup for Powercloud Demo System ([064b1a7](///commit/064b1a77feebf030aa452a5c10a2780c16c44799))


### Refactor

* **dev:** Example hot to use https:// in source module with Git PAT ([0459bb2](///commit/0459bb26d117d23ff5f18fb023f81d49f7f4a1b4))


### Chore

* Add ingress for VPN client security group ([82b8bc1](///commit/82b8bc1167ad3d429139d7ea6ed5f0d19369592a))
* **_global_vars.hcl:** Whitelist new Powercloud Gateway IP: 185.64.114.245/32 ([7585cd9](///commit/7585cd996d683e23011f8a4fc52fea4ae34a828f))
* **demo:** Create .terraform-version and .terragrunt-version files ([61372c8](///commit/61372c8244d1144b39518234bb6867221088e792))
* **test/common:** Define vpc_id and private_subnets variable in common.hcl ([41bf2a0](///commit/41bf2a06b773476c9a47b76d8da5eb7ad9b043c8))
* **test/common:** Define vpc_id and private_subnets variable in common.hcl ([a508b38](///commit/a508b38b5979c330d0c46d7251bf784152f3a67d))
* **vpn:** Add VPN client security group id as ingress to Ec2 ([58e316f](///commit/58e316ff08a89ef904eaccbc983f75f50f92d3ed))

## [2.0.0](///compare/v1.5.9...v2.0.0) (2020-03-26)


### Features

* **enbw-enpowerx-demo:** New environemnt for Powercloud DemoSystem ([c3b0d5f](///commit/c3b0d5fd784758c156eb137cac4dc0e62347d6b7))


### Chore

* **enbw-enpowerx-vpn:** Setup resources needed for creating AWS VPN Client ([490d96b](///commit/490d96b9b5263ab3180a431ede4eb7d67088a3a7))
* Set RDS password ([6e04d1a](///commit/6e04d1a9998f51bbfe6da74775ec0b0c123150c2))
* Update Azure pipeline ([90c4d2e](///commit/90c4d2e401913e6deb95c343891c5b9d22dae6ba))
* Update module version to v0.6.1 [fix(terraform-aws-webserver-cluster): autoscaling group name was set wrongly] ([308c2f9](///commit/308c2f990adce2b0d53b8c939e41605d20821162))
* Update modules version to v0.7.0 | feat(terraform-aws-s3-bucket): Encryption witk custom KMS key | Block public access option ([e2b150a](///commit/e2b150a1b0b4a4964f2c05836a0fac00436e82fd))
* Update rds-kms policy statement for KeyUsage ([809862d](///commit/809862d5c83741d2c0cc53c9edc7ae818126fb59))
* **azure-*-infra.yml:** Update Azure pipeline ([bbfcc1f](///commit/bbfcc1f1861e492c1c4264356ea6af4c82cc7571))
* **azure-deploy-infra.yml:** Update Azure pipeline ([887c168](///commit/887c168db79d27b64904658f9200c983a3207038))
* **azure-plan-infra.yml:** Update Azure pipeline ([c4ddd16](///commit/c4ddd16b78332cdef8e707bbd099744f5b52905c))
* **azure-plan-infra.yml:** Update Azure pipeline ([3679ef1](///commit/3679ef10855d80b2282467f870049b4a52f28e14))

### [1.5.9](///compare/v1.5.8...v1.5.9) (2020-03-25)


### Chore

* Update modules version to v0.6.0 [aws-terraform-webserver-cluster: Remove settings for creating build server] ([b2991d9](///commit/b2991d9fb1a49f7140fd53b763fcbae652dc7a2d))
* **release.sh:** Display current and next tag ([bb88ea5](///commit/bb88ea57ee76b2c4d0bde32974f19f456e27d763))

### [1.5.8](///compare/v1.5.7...v1.5.8) (2020-03-24)


### Bug Fixes

* **azure-*-infra.yml:** Fix variable paths for each stage ([75fbb52](///commit/75fbb525e0bf27dcddb8c481a883b1fdf966f27e))
* **azure-plan-infra.yml:** wrong path to prod stage ([8eb9988](///commit/8eb9988c66c8ce6d5adfe4270ce4d3a0fbf8e1ad))


### Chore

* Increase Elastic Benastlak phpini memory limit | Update modules to latest version v0.5.0 ([572574b](///commit/572574bdc41addc07448f72f4b361d86bf8172e9))
* update modules to use latest version v0.4.12 ([65760e5](///commit/65760e5739e3ebdbc88c33d49147c9b90affb5e8))
* **azure-plan-infra.yml:** add new stage: prod/common prod/prod ([7beada4](///commit/7beada40743d09624c5659384f93e0a84e662a67))
* update modules to use latest version v0.4.12 [fix(terraform-aws-rds-cluster): must wait for EB to finish updating (sleep)] ([a222906](///commit/a222906c0985fdf33f1fb6157d03df43298246c9))
* **azure-update-infra.yml:** add new stage: test/heidiSQL ([1ebaaa3](///commit/1ebaaa3a88baa0741f96a296ae6a418d2fbce8df))
* **azure-update-infra.yml:** add new stage: test/phpMyAdmin ([7191b9e](///commit/7191b9e1a91482ce366424ed444d97c148d64bae))

### [1.5.7](///compare/v1.5.6...v1.5.7) (2020-03-23)


### Bug Fixes

* **azure-update-infra.yml:** Add missing variables ([d0a52e6](///commit/d0a52e6c3cb28e077d8a0a36073adce3b0c4ca35))


### Chore

* update modules to use latest version v0.4.11 [When changing DB password set Elastic Benastalk deployment polcy to Rolling in order to minimize downtime] ([ff07c1c](///commit/ff07c1c69c445d26965dc5b9fa4090f0a7b8a193))
* **azure-plan-infra.yml:** Added new stages: test/common and test/test002 ([5ff296b](///commit/5ff296bbb0e2ef71e24d9407c986a5e2b79663f1))
* **azure-update-infra.yml:** Add stage for update: dev_common_phpMyAdmin ([331bb58](///commit/331bb5877398abae3ee1508f80823d67cbacc4d6))
* **azure-update-infra.yml:** Add stage for update: dev_common_phpMyAdmin ([0932c8a](///commit/0932c8a483b31b15ca3ba386437b1db11f82e082))
* **azure-update-infra.yml:** Add validate and plan steps ([db63c3e](///commit/db63c3e2fb9cbf44601e65c55f3fc0ab38233813))

### [1.5.6](///compare/v1.5.5...v1.5.6) (2020-03-23)


### Bug Fixes

* **_templates:** missing key in template for git ([bf86687](///commit/bf866878e0a434c9f779a5af589151dd5cf56562))
* **_templates:** missing key in template for git ([3348197](///commit/3348197ab04ccfa4d7b68bcc58d6f7eed1f79b2a))
* **azure pipeline:** Stage name contained invalid characters ([9e5cad1](///commit/9e5cad168e22dfadbf7597a2ebc2afeac68203a2))
* **azure-plan-infra.yml:** typo when calling template parameters ([43e81c7](///commit/43e81c72ea3bdb059ed9d7cbd219d3f18487bf77))
* **dev/powercloud-ebs-key/policy:** Invalid JSON character. ([e27011f](///commit/e27011fa2610ecacc0028ca4ad8f579707aab4ff))


### Chore

* update modules to use latest version v0.4.10 - fix(terraform-aws-secret-manager-with-rotation): Cycle between resources ([9677a8c](///commit/9677a8c768612fd18ae33eb23b90c0c12a616f7f))
* **azure-plan-infra.yml:** Update Azure pipeline, added new plan stage ([02c4334](///commit/02c433420a8927c1476fc213cfe0818511139545))
* update modules to use latest version v0.4.9 - (terraform-aws-secret-manager-with-rotation): define dependencies between resources [depends_on] ([c7ac223](///commit/c7ac223d857c719cc0f1a7ef7bad8748fe6c8793))
* **azure pipeline:** Update Azure pipelines ([295625d](///commit/295625ddbae6559648afc17f52eb6a4eadf5e8c4))
* **azure pipeline:** Update Azure pipelines ([1095fa1](///commit/1095fa1e594b6bc3e0da87cd48448ba12256418a))
* **azure pipeline:** Update Azure pipelines ([ac4ec1a](///commit/ac4ec1aa4a293044f4ce4e8e064536fc0ec3f9fd))
* **azure pipeline:** Update Azure pipelines ([3c4f2fc](///commit/3c4f2fc07065fbd7ffc7d9b51e6ac912a15aa040))
* **azure-destroy-infra.yml:** Update Azure pipelines ([adae9b7](///commit/adae9b708c2640ef2bb329649c4b41e8a7d40c56))
* **azure-destroy-infra.yml:** Update Azure pipelines ([887b1eb](///commit/887b1ebb6f985d8f834857fd46179cb6126848ed))
* Update environments to use latest module version v0.4.8 | New environment demo-system in dev stage ([00902b3](///commit/00902b3904c7a6ba52b713eb0982957036b8484e))
* **azure-plan-infra.yml:** Define globally dev, test and prod stages directories ([90497c1](///commit/90497c1cc4fdc4bf889a2893ee677869a24c88b0))
* **azure-plan-infra.yml:** new step templates ([09806de](///commit/09806de45a7533150d1d516e59989358e94e6abf))
* **azure-plan-infra.yml:** Pipeline template for running plan-all command against stages ([a084426](///commit/a0844265943bbf1aaef24ecada5727b71ea5b2fd))

### [1.5.5](///compare/v1.5.4...v1.5.5) (2020-03-23)


### Chore

* Update infra to v0.4.3 ([2a80caa](///commit/2a80caa1368ec2db5b7391d4510fdf3bb5d18fb5))
* **azure-update-infra.yml:** Pipeline for updating infra ([9bb2973](///commit/9bb2973318f7a1d4575d0534d16cfebd2727735b))
* **azure-update-infra.yml:** Update azure-update-infra.yml for Azure Pipelines ([532af2f](///commit/532af2f12da70c3f3093e4d5e86b808b6f44d722))

### [1.5.4](///compare/v1.5.3...v1.5.4) (2020-03-21)


### Bug Fixes

* **azure-deploy-infra.yml:** displayName typo ([d641933](///commit/d6419333f4416e5fafa27737f126183ca44ede30))
* **azure-deploy-infra.yml:** not clearing terragrunt cache ([3a1f41e](///commit/3a1f41eca284ffd2c80e7a60719750cce9c47ace))
* **azure-deploy-infra.yml:** typo in bash script ([324d2fd](///commit/324d2fde0d041b33fd07175f278d61e4af01fa1a))
* **azure-destroy-infra.yml:** stage has invalid name ([c39dbe6](///commit/c39dbe6d79132b845a732180dc6dccd2589a9d66))
* **azure-destroy-infra.yml:** typo in AWS shell script ([bc9ff9e](///commit/bc9ff9e68fc9ab38f7833406c717cf4b2e05d653))
* **terratest/env.hcl:** typo in path to the script ([0ec37e0](///commit/0ec37e0061b8a404d69498be012ae8416fb767d5))


### Chore

* **azure-deploy-infra.yml:** Clear terragrunt cache .terragrunt-cache befor running apply command ([14649a2](///commit/14649a206dd7b8ac95cd898bcb8c0bd64da1d09b))
* **azure-deploy-infra.yml:** test without terragrunt-validate ([0a7ea4e](///commit/0a7ea4ea9a34d0bedb8a6231c96b5eca21574ed6))
* **azure-deploy-infra.yml:** Update azure-deploy-infra.yml [disable downloading providers locally] ([5cffa0e](///commit/5cffa0eea57958454a459e8bc65169c629413400))
* **azure-deploy-infra.yml:** Update azure-deploy-infra.yml [disable validate step] ([dfa5a8c](///commit/dfa5a8c25d7745c68fccc53e7d428d95b68618f8))
* **azure-deploy-infra.yml:** Update azure-deploy-infra.yml [rename display name] ([669ee65](///commit/669ee65ba299df42a1ce8fc8922e14cd363f55b6))
* **azure-deploy-infra.yml:** Update azure-deploy-infra.yml for Azure Pipelines ([20d7d74](///commit/20d7d743416c5cebbf144aa9031e0de3101d0bea))
* **azure-deploy-infra.yml:** Update azure-deploy-infra.yml for Azure Pipelines [terragrunt clean cache [#1](null//undefined/issues/1)] ([9852967](///commit/98529673e35d9dc8f1bb943164c0fb8747f8fef1))
* **azure-destroy-infra.yml:** Destroy infrastructure pipeline ([e8d533a](///commit/e8d533aa9225ade2fea4cc0c10876750742e0207))
* **azure-destroy-infra.yml:** Update azure-deploy-infra.yml Azure pipeline ([91d229a](///commit/91d229a0d70cdaf749a8a1625fc89660bfad53af))
* **azure-destroy-infra.yml:** Update azure-destroy-infra.yml ([37f232a](///commit/37f232abf7e2ddb5525e3b340decd914cc6449c9))
* **azure-destroy-infra.yml:** Update azure-destroy-infra.yml ([f1af493](///commit/f1af49331a0434b0ac0bf569ead84b22f1e73bc1))

### [1.5.3](///compare/v1.5.2...v1.5.3) (2020-03-20)


### Bug Fixes

* **azure-deploy-infra.yml:**  Mapping values are not allowed in this context ([236e68b](///commit/236e68bc6f5ef10b0f1526b615b0fc092857aa1a))
* **azure-deploy-infra.yml:** create missing directory ~/.terraform.d/ ([082abe8](///commit/082abe81f8a29e6b6499ab11023ae16c39d1b918))
* **azure-deploy-infra.yml:** create symbolic link terraform ([7d58d2a](///commit/7d58d2a5db67a69b91edba855270b0b74fdc2f4a))
* **azure-deploy-infra.yml:** create symbolic link terragrunt ([923287b](///commit/923287b3920777f35c7823841f166a582c147231))
* **azure-deploy-infra.yml:** must use sudo for ln command ([1f1b46a](///commit/1f1b46ac7831af5c5f054f4a2a5cc73ca0bbb425))
* **azure-deploy-infra.yml:** set correct terraform version ([28df950](///commit/28df950aa1752d25815b34e6a2b69b5700dcb445))


### Chore

* **azure-deploy-infra.yml:** Add job for authenticating against Azure Git repositories ([2ade381](///commit/2ade381360d0eaaa1e05439da45a9a88952e7f7b))
* **azure-deploy-infra.yml:** add Task_MakeAllScriptsExecutable ([9657118](///commit/9657118c46f380fc03760259c6901d33ae9003cb))
* **azure-deploy-infra.yml:** add WORKING_DIR variable ([9ed66f0](///commit/9ed66f06204966edd40ba1ea150333edd16c719b))
* **azure-deploy-infra.yml:** Download Terraform providers locally ([6d47b4a](///commit/6d47b4a63c223dd960c79d2856fd8b8110c7da34))
* **azure-deploy-infra.yml:** Use task AWSShellScript@1 for git authentication and running terragrunt command ([e9b4142](///commit/e9b4142fd969e23123a5599e72efe9721ca6cd6a))
* **azure-deploy-infra.yml:** Use task AWSShellScript@1 for git authentication and running terragrunt command ([4971a65](///commit/4971a6589442d4e4d8505b4331acfd89c0168d58))

### [1.5.2](///compare/v1.5.1...v1.5.2) (2020-03-20)


### Chore

* add azure-deploy-infra.yml ([fbe79a0](///commit/fbe79a019ef76901cf36d767df4b193fbae97fb4))
* edit mock_outputs ([bfe2a38](///commit/bfe2a388d175363cd3a62aede4ccd64bf932536b))
* **terratest/infra:** Rename RDS directory, update env.hcl accordingly ([807c598](///commit/807c59809fa0e8c0af273db8e018daa5499dc871))

### [1.5.1](///compare/v1.5.0...v1.5.1) (2020-03-18)


### Chore

* **infra/rds:** set skip_final_snapshot to true ([e8eb484](///commit/e8eb484868ba25fdbf65b96ffca705d540a4eb18))
* **terratest/rds:** remove security group rule for VPC cidr ([e45e024](///commit/e45e02481d776d356caf94eb57b92b60dc99465c))

## [1.5.0](///compare/v1.4.3...v1.5.0) (2020-03-14)


### Chore

* add env_vars in all terragrtun.hcl files ([bcbac0d](///commit/bcbac0d6b0f193d924a11ba01b64824aaff1f495))


### Refactor

* Powercloud Ec2 security group is now created as single independent resurces thanks to new terraform-aws-security-group module. It's then referenced as variable to Elastic Beanstalk environment module ([8de95e3](///commit/8de95e3ad1f9d194cc8ed6c531abba21e4db927a))

### [1.4.3](///compare/v1.4.2...v1.4.3) (2020-03-13)


### Bug Fixes

* **rds:** Mocked dependency powercloud_ec2_iam_role was using wrong mock_output variable name, it's renamed to arn ([c564cf7](///commit/c564cf7aa79690867d33cb10fd85bfdb8af5fca7))


### Docs

* Update README.md ([6bc67c1](///commit/6bc67c1d3b6c546a5c917d229cd4aac8acd4b793))


### Chore

* **terratest:** Change aws_iam_role to newly created role only for terraform deplyoment EnBWTerraformRole. Before we used EnBWTerratestAdminRole. We want to have separated role for serivce like Terraform and for user ([201308b](///commit/201308bdb6bb48d8181cadab05d41fafea35f186))

### [1.4.2](///compare/v1.4.1...v1.4.2) (2020-03-12)


### Bug Fixes

* **common:** Add default ssh key variable in env.hcl for common environment ([23c8a7e](///commit/23c8a7e4b64773b690df3183de1b7a68a51fe031))


### Chore

* **common s3 buckets with ssh keys:** Use teragrunt dependency block to get output direct output for s3 bucket id insteadusing default terrafrom data source to access module outputs ([bc40b40](///commit/bc40b401ce99b17034e2f049f8096571957ffdbe))

### [1.4.1](///compare/v1.4.0...v1.4.1) (2020-03-12)


### Bug Fixes

* missing reference to env.hcl in terragrunt.hcl locals ([a8762b8](///commit/a8762b8557ac5bfcc0f626cea9f999ba0b4a9df1))

## [1.4.0](///compare/v1.3.2...v1.4.0) (2020-03-12)


### Refactor

* dinamically set security group ingress port HTTP/HTTPS depending if AWS certificated is set up and defined ([3585f5c](///commit/3585f5cc78936e9cffc1acb947797022fc3c22fc))


### Docs

* Update README.md ([604d61d](///commit/604d61d5ab563667ecd55033a5c85ed04c2f6e13))


### Chore

* **_global_vars.hcl:** Whitelist two new Jouls IP ([30b4e1d](///commit/30b4e1d9cd9041308e69bde6a2d8240ba6edba68))
* **dev:** Set module source to point to specific version which is now defined in common.hcl file ([da147c0](///commit/da147c0b1aae1184186b4e32b5b38e03089feaf4))
* **prod:** Set module source to point to specific version which is now defined in common.hcl file ([659358a](///commit/659358aecc0c02bfb70aedf56ca23f923d984c05))
* **rds:** add missing dependency powercloud-ec2 service role in dependencies block ([05ee4bb](///commit/05ee4bbc3dce409c6782cdbabf86c66af527bbb7))
* **terratest:** add .terraform-version and .terragrunt-version files ([d095e4a](///commit/d095e4adacf354c71695cfbb8cc3ea6ba7c94cff))
* **test:** Set module source to point to specific version which is now defined in common.hcl file ([1b20c02](///commit/1b20c02e3d171de775ac79a555f51e68b09344f5))

### [1.3.2](///compare/v1.3.1...v1.3.2) (2020-03-09)


### Chore

* **enbw-enpowerx-dev:** Point source module to specific version v0.2.4 ([812494a](///commit/812494a46591059e4ecadf1d888afa6ac986c642))

### [1.3.1](///compare/v1.3.0...v1.3.1) (2020-03-09)


### Style

* format locals block ([7ad3344](///commit/7ad3344d149c26b58538fc6dc7175e6f43ad3c83))


### Chore

* **dev/rds:** Add security group ingress from hediSQL jumpserver security group id ([aade230](///commit/aade2308b9f2ef589eb31eed2e8c2fbffef78252))
* **dev/rds:** Allow ingress from Powercloud security group id instead allowing whole VPC CIDR range ([25d7ce4](///commit/25d7ce49f2043295e058a6a4ca6d9dc7eac00949))
* **prod:** Point source module to specific version ([4f8bda1](///commit/4f8bda1ed421d8709d6979c0681aa30dff84b5b1))
* **prod/rds:** Allow ingress from Powercloud, phpMyAdmin and HeidiSQL security group ids instead allowing whole VPC CIDR range ([e69afb7](///commit/e69afb77c18e7be43b712d3a43193f89e0436b18))
* **rds:** add dependencies path for phpMyadmin and HeidiSQL ([b67b006](///commit/b67b006b9bf41e222d88cdd37cbd47f8e93bfd55))
* **test:** Point source module to specific version ([0cfaa8d](///commit/0cfaa8d85b0b18a4d80a6d47ffe4b0dff6fe7287))
* **test002/rds:** Allow ingress from Powercloud, phpMyAdmin and HeidiSQL security group ids instead allowing whole VPC CIDR range ([d10763e](///commit/d10763e3ba47500782e2263247b43114a971cad6))

## [1.3.0](///compare/v1.2.0...v1.3.0) (2020-03-06)


### Features

* **prod/phpMyAdmin:** New version of aws-webserver-cluster module now will redirects HTTP request to HTTPS (listener_protocol variable not used anymore) ([5ed8031](///commit/5ed803189aa4569504b614a3e862adf8000423d2))


### Refactor

* **enbw-enpowerx-prod:** Module version for each resource is now defined in environment env.hcl file. Change module source path to point to variable version defined in env.hcl ([1349970](///commit/134997063b0ac73ffe055c8f2655ff0170322a3d))


### Chore

* **release.sh:** Now accepts only 'yes' as release confirmation answer ([1d2e51d](///commit/1d2e51d82994fc94f811eb1dd0928909e45b4422))
* **test-prod/env.hcl:** add missing variable for module version ([aaed3a5](///commit/aaed3a520e5b8ec96c1fa305690d0727c926e326))

## [1.2.0](///compare/v1.1.1...v1.2.0) (2020-03-06)


### Refactor

* **enbw-enpowerx-test:** Module version for each resource is now defined in environment env.hcl file ([642604f](///commit/642604fd7fa292c7e9ee6fc4c2253fc12c82337b))


### Style

* **release.sh:** Code formating, comments deleted ([24e3224](///commit/24e3224016cff9ca9b986cfa355339869519026e))

### [1.1.1](///compare/v1.1.0...v1.1.1) (2020-03-06)


### Chore

* Add release.sh script ([9a82c78](///commit/9a82c780ab89a6a88c6c9da8da214c4e76d6fac2))

## [1.1.0](///compare/v1.0.1...v1.1.0) (2020-03-06)


### Features

* **dev/phpMyAdmin:** New version of module now redirects HTTP to HTTPS ([e6346eb](///commit/e6346ebaf1cca1505ba31e54166443b675b87a32))


### Docs

* Update README.md ([bb57dba](///commit/bb57dba5b0bd54517043b7b0b10d750d9379fc2c))


### Chore

* tfenv and tgenv files are now located under each stage ([22ad658](///commit/22ad658af017df469ca740ceb86f2dc4cf271249))


### Refactor

* Get latest module version in module source with run_cmd() function which calls latest-version.sh script ([c6d6004](///commit/c6d60046e2805b29acd74d184f37a650b6d033f3))
* **test-prod:** Update infrastructure. New terragrunt version. Now there is only one (main) terragrunt.hcl file for all stages/environments. Variables defined globally, for each stage and for each environment: _global_vars.hcl, common.hcl and env.hcl. Update to latest modules version. ([8801f06](///commit/8801f06ff63bd1656a5880798b97b336f2537a06))

### [1.0.1](///compare/v1.0.0...v1.0.1) (2020-03-02)


### Style

* format _global_vars.hcl; delete terragrunt.hcal.bak files ([fca30fe](///commit/fca30fec6694132db2d26eae7434cde2f99be9ad))

## [1.0.0](///compare/v0.1.1...v1.0.0) (2020-03-02)


### Refactor

* Update infrastructure. New terragrunt version. Now there is only one (main) terragrunt.hcl file for all stages/environments. Variables defined globally, for each stage and for each environment: _global_vars.hcl, common.hcl and env.hcl. Update to latest modules version. ([3948a90](///commit/3948a90b35f7663b7639b721ce386c78f2489214))

### [0.1.1](///compare/v0.1.0...v0.1.1) (2020-02-21)


### Bug Fixes

* **dev/aws-elastic-beanstalk:** Disable load balancer stickines because SOAP call from TarifeServer(Servicenode) was getting invalide cookies. ([1b4b3b3](///commit/1b4b3b3c6863e2ade321187e5ebe859e1d38fe4f))
* **prod/aws-elastic-beanstalk:** Disable load balancer stickines because SOAP call from TarifeServer(Servicenode) was getting invalide cookies. ([7c51719](///commit/7c51719e41f0ac0b5a6ad01d9f78d3294c74b124))
* **test002/aws-elastic-beanstalk:** Disable load balancer stickines because SOAP call from TarifeServer(Servicenode) was getting invalide cookies. ([0ac82f4](///commit/0ac82f418e577531502a8960184429db6160d01f))


### Chore

* **test-prod:** Set autoschedule scale down time from 20:00 to 22:00 because next week migration ([df166e1](///commit/df166e16929a8e73868008f766c886dbd3ae4a59))

## 0.1.0 (2020-02-19)


### Chore

* Initial commit ([569281e](///commit/569281ea11dbc39e214d330190d0cba1c9c31aef))
