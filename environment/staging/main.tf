
terraform {
  backend "s3" {
    profile = "default"
    bucket  = "terraform-bucket-harysetiawan"
    key     = "static-distribution"
    region  = "ap-southeast-1"
  }
}

module "webapp" {
  source = "../../module/webapp"
  aws_region = "ap-southeast-1"
  app_name = "harysetiawan"
  environment = "staging"
}
