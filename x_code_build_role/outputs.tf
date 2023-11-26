
output "x_code_build_role" {
  description = "CodeBuild Server role"
  value       = aws_iam_role.codebuild_role_other_accounts.arn
}