output "s3_bucket_domain_name" {
  description = "Bucket Domain Name"
  value       = module.bucket.s3_bucket_domain_name

  depends_on = [
    module.bucket
  ]

}

output "s3_bucket_name" {
  description = "Bucket Name"
  value       = module.bucket.s3_bucket_name

  depends_on = [
    module.bucket
  ]

}

output "s3_bucket_id" {
  description = "Bucket ID"
  value       = module.bucket.s3_bucket_id

  depends_on = [
    module.bucket
  ]
}


output "s3_bucket_arn" {
  description = "Bucket ID"
  value       = module.bucket.s3_bucket_arn

  depends_on = [
    module.bucket
  ]
}

output "cdn_default_domain" {
  value       = module.distribution.cdn_default_domain
  description = "CDN Default domain name"
}


output "cdn_distribution_id" {
  value       = module.distribution.cdn_distribution_id
  description = "CDN Distribution ID"
}
