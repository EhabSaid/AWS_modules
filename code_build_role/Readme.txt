
*****************************************
*************** main.tf: ****************
*****************************************
module "code_build_role" {
  source              = "github.com/EhabSaid/AWS_modules/code_build_role"
  codebuild_role_name = var.codebuild_role_name
  env_tag             = var.env_tag
}

*****************************************
************* variables.tf: *************
*****************************************
variable "env_tag" {
  type = string
}
variable "codebuild_role_name" {
  type = string
}

******************************************
*************** output.tf: ***************
******************************************
output "code_build_role" {
  description = "CodeBuild Server role"
  value       = aws_iam_role.codebuild_role.arn
}

*****************************************
*********** terraform.tfvars: ***********
*****************************************
env_tag             = "env-name"
codebuild_role_name = "codebuild-service-role-name"