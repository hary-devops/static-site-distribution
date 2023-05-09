resource "aws_s3_bucket" "webapp" {
  bucket = "${lower(var.environment)}-${lower(var.app_name)}"
  tags = {
    Name        = "${lower(var.environment)}-${lower(var.app_name)}"
    Environment = "${var.environment}"
  }
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "webapp" {
  bucket = aws_s3_bucket.webapp.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket                  = aws_s3_bucket.webapp.id
  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
  ignore_public_acls      = false
}

resource "aws_s3_bucket_acl" "webapp" {
  bucket = aws_s3_bucket.webapp.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "webapp" {
  bucket = aws_s3_bucket.webapp.id
  rule {
    bucket_key_enabled = true
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.webapp.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
