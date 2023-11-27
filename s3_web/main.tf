resource "aws_s3_bucket" "S3_bucket" {
  bucket = var.s3_name
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Name        = var.s3_name
    Environment = var.env_tag
  }
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
