
*****************************************
*************** main.tf: ****************
*****************************************
module "app_builder_plan" {
  source                = "github.com/EhabSaid/AWS_modules/code_build"
  depends_on            = [module.code_build_role]
  repo_link             = var.repo_link
  codebuild_name        = var.codebuild_name
  codebuild_description = var.codebuild_description
  buildspec_location    = var.buildspec_location
  code_build_role       = module.code_build_role.code_build_role
  env_tag               = var.env_tag
}

*****************************************
************* variables.tf: *************
*****************************************
variable "env_tag" {
  type = string
}
variable "codebuild_name" {
  type        = string
  description = "Name for the code build"
}
variable "codebuild_description" {
  type        = string
  description = "Description for the code build"
}
variable "buildspec_location" {
  type        = string
  description = "Path to the correct buildspec.yml file"
}

*****************************************
*********** terraform.tfvars: ***********
*****************************************
env_tag               = "env-name"
repo_link             = "https://github.com/EhabSaid/********.git"
codebuild_name        = "codebuild_name"
codebuild_description = "codebuild_description"
buildspec_location    = "buildspec_location/script.yml"
