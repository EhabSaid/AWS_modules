
*****************************************
*************** main.tf: ****************
*****************************************
module "code_pipeline_artifact_bucket" {
  source               = "../modules/code_pipeline_artifact_bucket/"
  artifact_bucket_name = var.artifact_bucket_name
  account_id           = var.account_id
  env_tag              = var.env_tag
}

*****************************************
************* variables.tf: *************
*****************************************
variable "env_tag" {
  type = string
}
variable "artifact_bucket_name" {
  description = "CodePipeline artifact bucket"
}
variable "account_id" {
  description = "legacy account ID to allow access from to artifact s3 bucket."
  type        = string
}

******************************************
*************** output.tf: ***************
******************************************
output "codepipeline_artifact_bucket_arn" {
  description = "The ARN of the CodePipeline bucket"
  value       = aws_s3_bucket.codepipeline_bucket.arn
}

output "codepipeline_artifact_bucket_name" {
  description = "The ARN of the CodePipeline bucket"
  value       = var.artifact_bucket_name
}


*****************************************
*********** terraform.tfvars: ***********
*****************************************
env_tag              = "env-name"
artifact_bucket_name = "codepipeline_artifacts_bucket_name"
account_id           = "account_id "

