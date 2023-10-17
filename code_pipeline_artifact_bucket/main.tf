## Bucket
resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = var.artifact_bucket_name
  acl    = "private"

  tags = {
    Name        = var.artifact_bucket_name
    Environment = var.env_tag
  }
  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       kms_master_key_id = var.KMS_key_arn
  #       sse_algorithm     = "aws:kms"
  #     }
  #   }
  # }
}


resource "aws_s3_bucket_policy" "allow_legacy_code_commit" {
  bucket = aws_s3_bucket.codepipeline_bucket.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "allow code commit from legacy account access to the artifiact"
    Statement = [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::${var.account_id}:root"
        },
        "Action" : [
          "s3:Get*",
          "s3:Put*",
          "s3:ListBucket"
        ],
        "Resource" : [
          "arn:aws:s3:::${aws_s3_bucket.codepipeline_bucket.id}/*",
          "arn:aws:s3:::${aws_s3_bucket.codepipeline_bucket.id}"
        ]
      }
    ]
  })
}

