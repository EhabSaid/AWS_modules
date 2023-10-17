variable "artifact_bucket_name" {
  description = "CodePipeline artifact bucket name."
}

# variable "KMS_key_arn" {
#   description = "KMS key arn to use within s3 encryption."
#   type        = string
# }

variable "account_id" {
  description = "legacy account ID to allow access from to artifact s3 bucket."
  type        = string
}

variable "env_tag" {
  type = string
}