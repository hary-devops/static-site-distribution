output "s3_bucket_domain_name" {
  description = "Bucket Domain Name"
  value       = aws_s3_bucket.webapp.bucket_regional_domain_name

  depends_on = [
    aws_s3_bucket.webapp
  ]

}

output "s3_bucket_id" {
  description = "Bucket ID"
  value = aws_s3_bucket.webapp.id

  depends_on = [
    aws_s3_bucket.webapp
  ]
}


output "s3_bucket_arn" {
  description = "Bucket ID"
  value = aws_s3_bucket.webapp.arn

  depends_on = [
    aws_s3_bucket.webapp
  ]
}
