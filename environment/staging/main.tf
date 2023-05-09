provider "aws" {
  alias = "ap-southeast-1"
  allowed_account_ids = [ "${var.aws_account_id}" ]
}

module "webapp" {
  source = "../../module/webapp"
  aws_region = "ap-southeast-1"
  app_name = "harysetiawan"
  environment = "staging"
}
