
*****************************************
*************** main.tf: ****************
*****************************************
module "s3_bucket" {
  source  = "github.com/EhabSaid/AWS_modules/s3_web"
  region  = var.region
  s3_name = var.s3_name
  env_tag = var.env_tag
}

*****************************************
************* variables.tf: *************
*****************************************
variable "env_tag" {
  type = string
}
variable "s3_name" {
  type = string
}
variable "region" {
  type = string
}

*****************************************
*********** terraform.tfvars: ***********
*****************************************
env_tag = "env-name"
s3_name = "s3-backet-name"
region  = "eu-west-1"

