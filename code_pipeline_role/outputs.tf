output "code_pipeline_role_arn" {
  description = "CodePipeline role"
  value       = aws_iam_role.codepipeline_role.arn
}

