
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name                = "iam_for_lambda"
  assume_role_policy  = data.aws_iam_policy_document.assume_role.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess"]
}


#**********************************************************

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../scripts/lambda_function.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename = "lambda_function.zip"
  #   function_name = "lambda_function_name"
  function_name = var.lambda_func_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda_function.lambda_handler"

  #   source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.10"

  #   environment {
  #     variables = {
  #       foo = "bar"
  #     }
  #   }

  tags = {
    Name        = var.lambda_func_name
    Environment = var.env_tag
  }

}