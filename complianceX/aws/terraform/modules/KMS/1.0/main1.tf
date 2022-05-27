resource "aws_kms_key" "kms_key" {
  deletion_window_in_days  = var.DELETION_WINDOW_IN_DAYS
  enable_key_rotation      = var.ENABLE_KEY_ROTATION
  key_usage                = var.KEY_USAGE
  customer_master_key_spec = var.CUSTOMER_MASTER_KEY_SPEC
  is_enabled               = var.IS_ENABLED
  policy                   = var.KMS_POLICY_JSON
  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
  )
  description              = var.DESCRIPTION
}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/${var.ALIAS}"
  target_key_id = aws_kms_key.kms_key.key_id
}

