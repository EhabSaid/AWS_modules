
*****************************************
*************** main.tf: ****************
*****************************************
module "code_pipeline_role" {
  source                        = "github.com/EhabSaid/AWS_modules/code_pipeline_role"
  code_pipeline_artifact_bucket = var.code_pipeline_artifact_bucket
  codepipeline_role_name        = var.codepipeline_role_name
  env_tag                       = var.env_tag
}

*****************************************
*************** main.tf: ****************
*****************************************
module "code_pipeline_role" {
  source                        = "github.com/EhabSaid/AWS_modules/code_pipeline_role"
  code_pipeline_artifact_bucket = module.code_pipeline_artifact_bucket.codepipeline_artifact_bucket_arn
  codepipeline_role_name        = var.codepipeline_role_name
  env_tag                       = var.env_tag
}

*****************************************
************* variables.tf: *************
*****************************************
variable "env_tag" {
  type = string
}
variable "code_pipeline_artifact_bucket" {
  description = "CodePipeline artifact bucket"
}
variable "codepipeline_role_name" {
  type = string
}
******************************************
*************** output.tf: ***************
******************************************
output "code_pipeline_role_arn" {
  description = "CodePipeline role"
  value       = aws_iam_role.codepipeline_role.arn
}

*****************************************
*********** terraform.tfvars: ***********
*****************************************
env_tag                       = "env-name"
codepipeline_role_name        = "codepipeline_role_name"
code_pipeline_artifact_bucket = "code_pipeline_artifact_bucket"

