
module "s3_bucket" {
  source  = "EhabSaid/AWS_modules/s3_bucket"
  region  = var.region
  s3_name = var.s3_name
  env_tag = var.env_tag
}


variable "env_tag" {
  type = string
}
variable "s3_name" {
  type = string
}
variable "region" {
  type = string
}


env_tag = "env-name"
s3_name = "s3-backet-name"
region  = "eu-west-1"

