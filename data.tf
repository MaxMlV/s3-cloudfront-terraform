data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.origgin_access_identity.iam_arn]
    }
  }
}

data "aws_route53_zone" "zone" {
  name         = var.domain_name
  private_zone = false
}
