output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = aws_lambda_function.test_lambda.arn
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = aws_lambda_function.test_lambda.function_name
}