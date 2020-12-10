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
		TerraformDir: "../../examples/ec2-service-role",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-west-1.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	roleName := terraform.Output(t, terraformOptions, "name")

	expectedRoleName := "terratest-dev-testing-ec2-service-role"
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedRoleName, roleName)

	// Run `terraform output` to get the value of an output variable
	roleArn := terraform.Output(t, terraformOptions, "arn")

	// Get AWS account id
	accountId := aws.GetAccountId(t)
	expectedRoleArn := fmt.Sprintf("arn:aws:iam::%s:role/terratest-dev-testing-ec2-service-role", accountId)
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedRoleArn, roleArn)
}
