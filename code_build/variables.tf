variable "buildspec_location" {
  type        = string
  description = "Path to the correct buildspec.yml file"
}

variable "codebuild_name" {
  type        = string
  description = "Name for the code build"
}
variable "codebuild_description" {
  type        = string
  description = "Description for the code build"
}
variable "code_build_role" {
  type        = string
  description = "Code build service role"
}

variable "codebuild_image" {
  type = string
  #default = "xxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/codebuild-custom-images:latest"
  # default = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
  default = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}

variable "env_tag" {
  type = string
}

variable "repo_link" {
  type = string
}

variable "passing_variables" {
  description = "A map of example variables to inject into CodeBuild"
  type        = map(string)
  default     = {
    key1 = "value1"
    key2 = "value2"
  }
}