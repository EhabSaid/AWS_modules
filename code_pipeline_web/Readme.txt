
*****************************************
*************** main.tf: ****************
*****************************************
module "code_pipeline_web_deployment" {
  source = "github.com/EhabSaid/AWS_modules/code_pipeline_web"

  codepipeline_name = var.codepipeline_web_name

  code_pipeline_artifact_bucket = module.code_pipeline_artifact_bucket.codepipeline_artifact_bucket_name
  code_pipeline_role            = module.code_pipeline_role.code_pipeline_role_arn

  github_connection_arn = var.github_connection_arn

  primary_full_repository_id = var.app_full_repository_id
  primary_branch_name        = var.primary_branch_name

  codebuild_tf_project = module.slv_2acc_sync.code_build_project

  env_tag = var.env_tag
}
*****************************************
************* variables.tf: *************
*****************************************
variable "env_tag" {
  type = string
}
variable "codepipeline_web_name" {
  description = "CodePipeline name"
}
variable "github_connection_arn" {
  description = "github codestar connection arn"
}
variable "app_full_repository_id" {
  description = "primary full repository url in format like Organization/example"
  default     = ""
}
variable "primary_branch_name" {
  description = "primary repository branch within repo we are cloning into build stage."
  default     = "main"
}

*****************************************
*********** terraform.tfvars: ***********
*****************************************
env_tag                    = "env-name"
codepipeline_infra_name    = "codepipeline_infra_name"
github_connection_arn      = "github_connection_arn"
app_full_repository_id     = "EhabSaid/******"
primary_branch_name        = "master"


