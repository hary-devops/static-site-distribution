provider "aws" {
  allowed_account_ids = ["${var.aws_account_id}"]
}

module "webapp" {
  source      = "../../module/webapp"
  aws_region  = var.aws_region
  app_name    = var.application_name
  environment = var.environment
}
