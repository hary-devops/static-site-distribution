resource "aws_cloudfront_origin_access_identity" "webapp" {
  comment = "CloudFront Origin Access Identity For ${var.environment}-${var.app_name}"
}

resource "aws_cloudfront_distribution" "webapp" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = var.s3_bucket_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.webapp.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "${var.environment}-${var.app_name} CloudFront Distribution"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = var.s3_bucket_id


    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }

    }
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  depends_on = [
    aws_cloudfront_origin_access_identity.webapp
  ]
}


# resource "aws_s3_bucket_policy" "webapp_bucket_policy" {
#   bucket = var.s3_bucket_id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           AWS = "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.webapp.id}"
#         }
#         Action   = "s3:GetObject"
#         Resource = "${var.s3_bucket_arn}/*"
#       },
#       {
#         Effect    = "Deny"
#         Principal = "*"
#         Action    = "s3:GetObject"
#         Resource  = "${var.s3_bucket_arn}/*"
#         Condition = {
#           StringNotEquals = {
#             "aws:Referer" = "https://${aws_cloudfront_distribution.webapp.domain_name}/*"
#           }
#         }
#       }
#     ]
#   })
# }

