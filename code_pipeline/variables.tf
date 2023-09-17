
variable "codebuild_tf_plan_project" {
  description = "CodeBuild project used to deploy terrafrom"
}

variable "codebuild_tf_apply_project" {
  description = "CodeBuild project used to deploy terrafrom"
}

variable "lambda_project" {
}

variable "code_pipeline_role" {
  description = "CodePipeline role"
}

variable "code_pipeline_artifact_bucket" {
  description = "CodePipeline artifact bucket"
}

variable "codepipeline_name" {
  description = "CodePipeline name"
}


variable "github_connection_arn" {
  description = "github codestar connection arn"
}

variable "primary_full_repository_id" {
  description = "primary full repository url in format like Organization/example"
  default     = ""
}

variable "primary_branch_name" {
  description = "primary repository branch within repo we are cloning into build stage."
  default     = "main"
}

variable "env_tag" {
  type = string
}