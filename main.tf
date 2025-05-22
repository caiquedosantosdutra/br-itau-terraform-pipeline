
provider "aws" {
  region = "us-east-2"
}
resource "aws_kms_key" "tf_state" {
  description             = "KMS key for Terraform state bucket"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "log_storage" {
  bucket = "terraform-pipeline-itau-access-logs"
}
resource "aws_s3_bucket" "tf_state" {
  bucket = "terraform-pipeline-itau"
  logging {
    target_bucket = aws_s3_bucket.log_storage.bucket
    target_prefix = "access-logs/"
  }
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
