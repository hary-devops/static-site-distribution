

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "bucket" {
  source      = "./s3"
  aws_region  = var.aws_region
  environment = var.environment
  app_name    = var.app_name
}

module "distribution" {
  source                = "./cdn"
  app_name              = var.app_name
  environment           = var.environment
  s3_bucket_domain_name = module.bucket.s3_bucket_domain_name
  s3_bucket_id          = module.bucket.s3_bucket_id
  s3_bucket_arn         = module.bucket.s3_bucket_arn
  depends_on = [
    module.bucket
  ]
}
