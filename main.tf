
resource "aws_s3_bucket" "tf_state" {
  bucket = "terraform-pipeline-itau"

  logging {
        target_bucket = "target-bucket"
  }
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "tf_state_public_access" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "tf_state_key" {
  description             = "KMS key for tf_state bucket encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_encryption" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tf_state_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
