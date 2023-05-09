terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token
}


data "github_repository" "static_site_distribution" {
  full_name = "hary-devops/static-site-distribution"
}

resource "github_repository_environment" "environment" {
  environment = var.environment
  repository  = data.github_repository.static_site_distribution.name
}

resource "github_actions_environment_variable" "cloudfront_distribution_id" {
  environment   = github_repository_environment.environment.environment
  repository    = data.github_repository.static_site_distribution.name
  variable_name = "aws_cloudfront_distribution_id"
  value         = var.aws_cloudfront_distribution_id
}

resource "github_actions_environment_variable" "s3_bucket_name" {
  environment   = github_repository_environment.environment.environment
  repository    = data.github_repository.static_site_distribution.name
  variable_name = "aws_s3_bucket_name"
  value         = var.aws_s3_bucket_name
}


