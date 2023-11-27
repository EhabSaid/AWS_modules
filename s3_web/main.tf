resource "aws_s3_bucket" "S3_bucket" {
  bucket = var.s3_name
  # acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Name        = var.s3_name
    Environment = var.env_tag
  }
}

resource "aws_s3_bucket_public_access_block" "S3_bucket" {
  bucket = aws_s3_bucket.S3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "static_website_policy" {

  bucket = aws_s3_bucket.S3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.S3_bucket.arn}/*",
      },
    ],
  })
}
