
module "cdn" {
  source  = "github.com/EhabSaid/AWS_modules/cdn"
  web_url = var.s3_bucket_url
  cdn_name = var.cdn_name
  env_tag = var.env_tag
  comment = var.comment
}


module "cdn" {
  source  = "github.com/EhabSaid/AWS_modules/cdn"
  web_url = module.s3_bucket.s3_bucket_url
  cdn_name = var.cdn_name
  env_tag = var.env_tag
  comment = var.comment
}


variable "cdn_name" {
  type = string
}
variable "env_tag" {
  type = string
}
variable "web_url" {
  type = string
}
variable "comment" {
  default = "No_Comment"
  type = string
}


