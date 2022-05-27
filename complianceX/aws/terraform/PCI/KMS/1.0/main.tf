
module "KMS" {

    providers = {
      aws = aws.var.REGION
    }
    source                  = "../../../modules/KMS/1.0"
    COMMON_TAGS             = local.common_tags
    TAGS                    = var.TAGS
    KMS_POLICY_JSON         = var.KMS_POLICY_JSON
    DELETION_WINDOW_IN_DAYS = var.DELETION_WINDOW_IN_DAYS
    DESCRIPTION             = var.DESCRIPTION
    ALIAS                   = var.ALIAS
    ENABLE_KEY_ROTATION     = var.ENABLE_KEY_ROTATION
    KEY_USAGE               = var.KEY_USAGE
    CUSTOMER_MASTER_KEY_SPEC  = var.CUSTOMER_MASTER_KEY_SPEC
}
output "KMS_KEY" {
  value = "${module.KMS.KMS_KEY}"
}
output "KMS_KEY_ARN" {
  value = "${module.KMS.KMS_KEY_ARN}"
}
