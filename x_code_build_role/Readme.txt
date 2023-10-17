
*****************************************
*************** main.tf: ****************
*****************************************
module "x_code_build_role" {
  source                = "github.com/EhabSaid/AWS_modules/x_code_build_role"
  x_codebuild_role_name = var.x_codebuild_role_name
  deployment_account_id = var.deployment_account_id
  env_tag               = var.env_tag
}

*****************************************
************* variables.tf: *************
*****************************************
variable "env_tag" {
  type = string
}

variable "x_codebuild_role_name" {
  type = string
}

variable "deployment_account_id" {
  description = "deployment account ID"
  type        = string
}

******************************************
*************** output.tf: ***************
******************************************
output "code_build_role" {
  description = "CodeBuild Server role"
  value       = aws_iam_role.codebuild_role_other_accounts.arn
}

*****************************************
*********** terraform.tfvars: ***********
*****************************************
env_tag               = "env-name"
x_codebuild_role_name = "x_codebuild-service-role-name"
deployment_account_id = "deployment_account_id"