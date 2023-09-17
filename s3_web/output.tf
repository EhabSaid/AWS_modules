output "s3_bucket_url" {
  value = aws_s3_bucket.S3_bucket.website_endpoint
}
