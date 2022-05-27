resource "aws_mq_broker" "this" {
  broker_name                = var.BROKER_NAME
  engine_type                = var.ENGINE_TYPE
  engine_version             = var.ENGINE_VERSION
  storage_type               = var.STORAGE_TYPE
  host_instance_type         = var.HOST_INSTANCE_TYPE
  authentication_strategy    = var.AUTHENTICATION_STRATEGY
  deployment_mode            = var.DEPLOYMENT_MODE
  apply_immediately          = var.APPLY_IMMEDIATELY
  auto_minor_version_upgrade = var.AUTO_MINOR_VERSION_UPGRADE
  publicly_accessible        = var.PUBLICLY_ACCESSIBLE
  security_groups            = var.SECURITY_GROUPS
  subnet_ids                 = var.SUBNET_IDS
  
  tags = merge(
    var.COMMON_TAGS,
    var.TAGS
  )

  user {
    username = var.USERNAME
    password = var.PASSWORD
    groups  = var.ENGINE_TYPE == "ActiveMQ" ? var.USER_GROUPS : null
  }

  dynamic "encryption_options" {
    for_each = var.ENGINE_TYPE == "ActiveMQ" ? ["true"] : []
    content {
      kms_key_id        = var.KMS_KEY_ID
      use_aws_owned_key = false
    }
  }
  maintenance_window_start_time {
    day_of_week = var.MAINTENANCE_WINDOW_START_TIME.day_of_week
    time_of_day = var.MAINTENANCE_WINDOW_START_TIME.time_of_day
    time_zone   = var.MAINTENANCE_WINDOW_START_TIME.time_zone
  }

   dynamic "logs" {
      for_each = var.ENGINE_TYPE == "ActiveMQ" ? ["true"] : []

     content { 
     general = var.LOGS_GENERAL
     audit   = false
   }
   }

}