terraform {
  required_providers {
    aws = ">= 3.22.0"
  }
}

provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "null_resource" "build" {
  provisioner "local-exec" {
    command = "cd my-app && npm install --global yarn && yarn install && ./node_modules/.bin/gatsby build"
  }

  depends_on = [aws_s3_bucket.website_bucket]
}

resource "null_resource" "deploy" {
  provisioner "local-exec" {
    command = "aws s3 sync my-app/public/ s3://${var.bucket_name}"
  }

  depends_on = [null_resource.build]
}

