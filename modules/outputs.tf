output "bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket
}

output "domain" {
  value = aws_route53_record.web.alias
}