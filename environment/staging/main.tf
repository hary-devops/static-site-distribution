provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "webapp" {
  source      = "../../module/webapp"
  aws_region  = var.aws_region
  app_name    = var.application_name
  environment = var.environment
}


module "github" {
  source                         = "../../module/github"
  aws_cloudfront_distribution_id = module.webapp.cdn_distribution_id
  aws_s3_bucket_name             = module.webapp.s3_bucket_name
  environment                    = var.environment
  github_token                   = var.github_token
}
