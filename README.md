# Static website infrastructure with Terraform and AWS

https://portfolioproject.link/

## Overview

This terraform module deploys:

1. S3 bukcet for website
2. Cloudfront distribution
3. ACM certificate
4. Route53 records


## CI/CD

GitHub repository have main and dev branches. In dev branch pipeline triggers on pull request to main and check how project builds as well as terraform plan. After merge to main branch triggers full cycle build project -> build infrastructure -> deploy project. 

## Terraform state is stored on S3 bucket. 

```js
backend "s3" {
    bucket = "portfolio-project-maxmlv-tfstate"
    key    = "global/s3/terraform.tfstate"
    region = "eu-central-1"
}
```
