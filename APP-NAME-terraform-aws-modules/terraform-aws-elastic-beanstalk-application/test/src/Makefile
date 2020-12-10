PACKAGE  = terraform-aws-elasticache-beanstalk-application
GOEXE   ?= /usr/bin/go
GOPATH   = $(CURDIR)/.gopath
GOBIN    = $(GOPATH)/bin
BASE     = $(GOPATH)/src/$(PACKAGE)
PATH 	:= $(PATH):$(GOBIN)

export TF_DATA_DIR ?= $(CURDIR)/.terraform
export TF_CLI_ARGS_init ?= -get-plugins=true
export GOPATH

# aws_credentials=$$(aws sts assume-role --role-arn arn:aws:iam::904900230967:role/apponAdminDevRole --role-session-name "TERRATEST_AWS_ELASTIC_BEANSTALK_APPLICATION")
# AWS_ACCESS_KEY_ID=$$(echo $(aws_credentials)|jq '.Credentials.AccessKeyId'|tr -d '"')
# AWS_SECRET_ACCESS_KEY=$$(echo $(aws_credentials)|jq '.Credentials.SecretAccessKey'|tr -d '"')
# AWS_SESSION_TOKEN=$$(echo $(aws_credentials)|jq '.Credentials.SessionToken'|tr -d '"')

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN

.PHONY: all
## Default target
all: test

ifneq (,$(wildcard /sbin/apk))
## Install go, if not installed
$(GOEXE):
	apk add --update go
endif

ifeq ($(shell uname -s),Linux)
## Install all `dep`, if not installed
$(GOBIN)/dep:
	@mkdir -p $(GOBIN)
	@curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
endif

## Prepare the GOPATH
$(BASE): $(GOEXE)
	@mkdir -p $(dir $@)
	@ln -sf $(CURDIR) $@

## Download vendor dependencies to vendor/
$(BASE)/vendor: $(BASE) $(GOBIN)/dep
	cd $(BASE) && dep ensure

.PHONY : init
## Initialize tests
init: $(BASE)/vendor

.PHONY : test
## Run tests
test: init
	aws_credentials=$$(aws sts assume-role --role-arn arn:aws:iam::161590033340:role/apponTerraformServiceRole --role-session-name "TERRATEST_AWS_ELASTIC_BEANSTALK_APPLICATION") && \
	AWS_ACCESS_KEY_ID=$$(echo $${aws_credentials}|jq '.Credentials.AccessKeyId'|tr -d '"') && \
	AWS_SECRET_ACCESS_KEY=$$(echo $${aws_credentials}|jq '.Credentials.SecretAccessKey'|tr -d '"') && \
	AWS_SESSION_TOKEN=$$(echo $${aws_credentials}|jq '.Credentials.SessionToken'|tr -d '"') && \
	cd $(BASE) && go test -v -timeout 30m -run TestExamplesComplete

.PHONY : clean
## Clean up files
clean:
	rm -rf .gopath/ vendor/ $(TF_DATA_DIR)
