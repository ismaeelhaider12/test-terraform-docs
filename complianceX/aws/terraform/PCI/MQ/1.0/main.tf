module "MQ" {
  providers = {
    aws = aws.var.REGION
  }
  source      = "../../../modules/MQ/1.0"
  TAGS        = var.TAGS
  COMMON_TAGS = local.common_tags

  BROKER_NAME                   = var.BROKER_NAME
  ENGINE_TYPE                   = var.ENGINE_TYPE
  ENGINE_VERSION                = var.ENGINE_VERSION
  STORAGE_TYPE                  = var.STORAGE_TYPE
  HOST_INSTANCE_TYPE            = var.HOST_INSTANCE_TYPE
  AUTHENTICATION_STRATEGY       = var.AUTHENTICATION_STRATEGY
  DEPLOYMENT_MODE               = var.DEPLOYMENT_MODE
  APPLY_IMMEDIATELY             = var.APPLY_IMMEDIATELY
  AUTO_MINOR_VERSION_UPGRADE    = var.AUTO_MINOR_VERSION_UPGRADE
  PUBLICLY_ACCESSIBLE           = var.PUBLICLY_ACCESSIBLE
  SECURITY_GROUPS               = var.SECURITY_GROUPS
  SUBNET_IDS                    = var.SUBNET_IDS
  USERNAME                      = var.USERNAME
  PASSWORD                      = var.PASSWORD
  MAINTENANCE_WINDOW_START_TIME = var.MAINTENANCE_WINDOW_START_TIME
  KMS_KEY_ID                    = var.KMS_KEY_ID
  USER_GROUPS                   = var.USER_GROUPS
  LOGS_GENERAL                  = var.LOGS_GENERAL
}

output "MQ_ARN" {
  value = "${module.MQ.MQ_ARN}"
}
output "MQ_ID" {
  value = "${module.MQ.MQ_ID}"
}
output "MQ_INSTANCES" {
  value = "${module.MQ.MQ_INSTANCES}"
}
