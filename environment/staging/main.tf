module "webapp" {
  source = "../../module/webapp"
  aws_region = "ap-southeast-1"
  app_name = "harysetiawan"
  environment = "staging"
}
