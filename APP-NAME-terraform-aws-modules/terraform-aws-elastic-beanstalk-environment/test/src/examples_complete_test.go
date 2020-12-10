package test

import (
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-west-1.tfvars"},
	}

	terraformDestroyTargetOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade: true,
		// The target resources to pass to the terraform command with -target ([]string)
		Targets: []string{"module.elastic_beanstalk_environment"},
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-west-1.tfvars"},
	}

	// At the end of the test, first destroy elastic_beanstalk_environment module
	defer terraform.Destroy(t, terraformOptions)

	// time.Sleep(20 * time.Second)

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	// defer terraform.Destroy(t, terraformDestroyTargetOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	vpcCidr := terraform.Output(t, terraformOptions, "vpc_cidr")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "10.0.0.0/16", vpcCidr)

	// Run `terraform output` to get the value of an output variable
	privateSubnetCidrs := terraform.OutputList(t, terraformOptions, "private_subnet_cidrs")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, []string{"10.0.0.0/18", "10.0.64.0/18"}, privateSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	publicSubnetCidrs := terraform.OutputList(t, terraformOptions, "public_subnet_cidrs")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, []string{"10.0.128.0/18", "10.0.192.0/18"}, publicSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	appName := terraform.Output(t, terraformOptions, "application")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "terratest-eb-env-app", appName)

	// Run `terraform output` to get the value of an output variable
	ec2InstanceProfileRoleName := terraform.Output(t, terraformOptions, "ec2_instance_profile_role_name")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "terratest-dev-testing-eb-environment-ec2", ec2InstanceProfileRoleName)

	// Run `terraform output` to get the value of an output variable
	tier := terraform.Output(t, terraformOptions, "tier")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "WebServer", tier)

	// Run `terraform output` to get the value of an output variable
	 elbDnsName := terraform.Output(t, terraformOptions, "elb_dns_name")
	// Verify we're getting back the outputs we expect
	assert.Contains(t, elbDnsName, "dev-eb-environment.")
	assert.Contains(t, elbDnsName, ".us-west-1.elasticbeanstalk.com")

	time.Sleep(90 * time.Second)

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	terraform.Destroy(t, terraformDestroyTargetOptions)

	time.Sleep(20 * time.Second)
}
