
*****************************************
*************** main.tf: ****************
*****************************************
module "lambda" {
  source           = "github.com/EhabSaid/AWS_modules/lambda"
  lambda_func_name = var.lambda_func_name
  lambda_path      = var.lambda_path
  env_tag          = var.env_tag
}

*****************************************
************* variables.tf: *************
*****************************************
variable "env_tag" {
  type = string
}
variable "lambda_func_name" {
  type = string
}
variable "lambda_path" {
  type = string
}
******************************************
*************** output.tf: ***************
******************************************
output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = aws_lambda_function.test_lambda.arn
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = aws_lambda_function.test_lambda.function_name
}

*****************************************
*********** terraform.tfvars: ***********
*****************************************
env_tag          = "env-name"
lambda_func_name = "lambda_func_name"
lambda_path      = "lambda_file_path"
