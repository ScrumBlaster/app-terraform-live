package test

import (
	"testing"
	"fmt"

	"github.com/gruntwork-io/terratest/modules/aws"
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

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	vpcCidr := terraform.Output(t, terraformOptions, "vpc_cidr")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "172.16.0.0/16", vpcCidr)

	// Run `terraform output` to get the value of an output variable
	privateSubnetCidrs := terraform.OutputList(t, terraformOptions, "private_subnet_cidrs")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, []string{"172.16.0.0/18", "172.16.64.0/18"}, privateSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	publicSubnetCidrs := terraform.OutputList(t, terraformOptions, "public_subnet_cidrs")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, []string{"172.16.128.0/18", "172.16.192.0/18"}, publicSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	clusterIdentifier := terraform.Output(t, terraformOptions, "cluster_identifier")
	// Verify we're getting back the outputs we expect
	assert.Equal(t, "terratest-dev-testing-rds-cluster", clusterIdentifier)

	// Run `terraform output` to get the value of an output variable
	arn := terraform.Output(t, terraformOptions, "arn")
	// Extract account id from arn
	// accountId := aws.ExtractAccountIDFromARN(arn)
	accountId := aws.GetAccountId(t)
	// Format expectedRoleArn
	expectedRoleArn := fmt.Sprintf("arn:aws:rds:us-west-1:%s:cluster:terratest-dev-testing-rds-cluster", accountId)
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedRoleArn, arn)
}
