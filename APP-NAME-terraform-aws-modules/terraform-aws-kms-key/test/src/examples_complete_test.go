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
		VarFiles: []string{"fixtures.eu-central-1.tfvars"},
		//VarFiles: []string{"fixtures.us-west-1.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	keyArn := terraform.Output(t, terraformOptions, "key_arn")

	// Get AWS account id
	accountId := aws.GetAccountId(t)
	// Verify we're getting back the outputs we expect
	expectedKeyArn := fmt.Sprintf("arn:aws:kms:eu-central-1:%s:key/", accountId)
	assert.Contains(t, keyArn, expectedKeyArn)

	// Run `terraform output` to get the value of an output variable
	aliasName := terraform.Output(t, terraformOptions, "alias_name")

	expectedAliasName := "alias/terratest-dev-testing-aws-kms-key"
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedAliasName, aliasName)
}
