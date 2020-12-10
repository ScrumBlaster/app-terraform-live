terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

# https://github.com/hashicorp/terraform-provider-archive/issues/11#issuecomment-368721675
resource "null_resource" "lambda_exporter" {
  # (some local-exec provisioner blocks, presumably...)

  triggers = {
    index = base64sha256(file("${path.module}/${var.filename}/lambda_function.py"))
  }
}

data "null_data_source" "wait_for_lambda_exporter" {
  inputs = {
    # This ensures that this data resource will not be evaluated until
    # after the null_resource has been created.
    lambda_exporter_id = null_resource.lambda_exporter.id

    # This value gives us something to implicitly depend on
    # in the archive_file below.
    source_dir = "${path.module}/${var.filename}/"
  }
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = data.null_data_source.wait_for_lambda_exporter.outputs["source_dir"]
  output_path = "${path.module}/${var.filename}.zip"
}

resource "aws_lambda_function" "rotate_secret_mysql" {
  filename         = var.lambda_test_mode ? "${path.module}/${var.filename}-test.zip" : "${path.module}/${var.filename}.zip"
  function_name    = var.use_default_name ? "${var.environment}-${var.name}-${var.filename}" : var.name
  role             = var.iam_lambda_rotation_arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.6"

  vpc_config {
    subnet_ids         = var.subnets
    security_group_ids = var.lambda_security_group_ids
  }

  timeout     = var.lambda_function_timeout
  description = "Conducts an AWS SecretsManager secret rotation for RDS MySQL using single user rotation scheme"

  environment {
    variables = { #https://docs.aws.amazon.com/general/latest/gr/rande.html#asm_region
      SECRETS_MANAGER_ENDPOINT           = "https://secretsmanager.${var.region}.amazonaws.com",
      REGION                             = var.region,
      ELASTIC_BEANSTALK_ENVIRONMENT_NAME = "${var.environment}-APP-NAME",
      ENABLE_AUTOMATIC_ROTATION          = var.enable_automatic_rotation
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    {
      "Name" = var.name
    }
  )
}

resource "aws_lambda_permission" "allow_secret_manager_call_Lambda" {
  function_name = aws_lambda_function.rotate_secret_mysql.function_name
  statement_id  = "AllowExecutionSecretManager"
  action        = "lambda:InvokeFunction"
  principal     = "secretsmanager.amazonaws.com"

  depends_on = [aws_lambda_function.rotate_secret_mysql]
}
