provider "aws" {
  region = "eu-central-1"
}

module "cloudfront" {
  source      = "./modules/"
  domain_name = var.domain_name
}