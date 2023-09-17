output "codepipeline_artifact_bucket_arn" {
  description = "The ARN of the CodePipeline bucket"
  value       = aws_s3_bucket.codepipeline_bucket.arn
}

output "codepipeline_artifact_bucket_name" {
  description = "The ARN of the CodePipeline bucket"
  value       = var.artifact_bucket_name
}

