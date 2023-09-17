output "code_build_role" {
  description = "CodeBuild Server role"
  value       = aws_iam_role.codebuild_role.arn
}

