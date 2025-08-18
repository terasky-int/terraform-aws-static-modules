module "s3_bucket_for_vpc_flow_logs" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.8.2"

  bucket                        = "aws-vpc-flow-logs-${var.aws_account}"
  attach_lb_log_delivery_policy = true

  # S3 Bucket Ownership Controls
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"

  # S3 bucket-level Public Access Block configuration
  attach_public_policy    = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  lifecycle_rule = [
    {
      id      = "RetentionRule"
      enabled = true

      transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        }
      ]

      # Log Retention - Half a year
      expiration = {
        days                         = 183
        expired_object_delete_marker = false
      }

#      noncurrent_version_transition = [
#        {
#          days          = 30
#          storage_class = "STANDARD_IA"
#      }]
#
#      noncurrent_version_expiration = {
#        #        newer_noncurrent_versions = 5
#        days = 183
#      }
  }]

  versioning = {
    status     = false
    mfa_delete = false
  }

  server_side_encryption_configuration = {
    rule = {
      bucket_key_enabled = true
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = var.tags
}
