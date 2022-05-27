
module "S3" {
    providers = {
      aws = aws.var.REGION
    }
    source            = "../../../modules/S3/1.0"
    COMMON_TAGS       = local.common_tags
    TAGS              = var.TAGS
    BUCKET_POLICY     = var.BUCKET_POLICY
    BUCKET_NAME       = var.BUCKET_NAME
    KMS_KEY_ARN       = var.KMS_KEY_ARN
    LIFECYCLE_RULE    = var.LIFECYCLE_RULE
    SSE_ALGORITHM     = var.SSE_ALGORITHM
    ACL               = var.ACL
}


output "S3_BUCKET" {
  value       = "${module.S3.S3_BUCKET}"
}
output "S3_BUCKET_NAME" {
  value       = "${module.S3.S3_BUCKET_NAME}"
}