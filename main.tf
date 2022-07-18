terraform {
  required_providers {
    aws = ">= 3.22.0"
  }

  backend "s3" {
    bucket = "portfolio-project-maxmlv-tfstate"
    key    = "global/s3/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

