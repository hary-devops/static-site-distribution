output "cdn_default_domain" {
  value       = aws_cloudfront_distribution.webapp.domain_name
  description = "CDN Default domain name"
}

output "cdn_distribution_id" {
  value = aws_cloudfront_distribution.webapp.id
  description = "CDN Distribution ID"
}