data "aws_iam_policy_document" {
  statement {
    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.website.arn,
      "${aws_s3_bucket.website.arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.oai.arn]
    }
  }
}

data "aws_route53_zone" "domain" {
  name = var.domain_name
}