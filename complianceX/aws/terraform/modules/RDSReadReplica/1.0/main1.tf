
resource "aws_db_option_group" "this" {
  count = var.CREATE ? 1 : 0
  name              = "${var.NAME}-option-group"
  option_group_description = "Option Group for ${var.IDENTIFIER}"
  engine_name              = var.ENGINE
  major_engine_version     = var.MAJOR_ENGINE_VERSION

  dynamic "option" {
    for_each = var.RDS_READ_REPLICA_OPTIONS
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      "Name" = format("%s", var.IDENTIFIER)
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_instance" "this_read_replica" {
  count = var.CREATE ? 1 : 0
  identifier = var.IDENTIFIER
  instance_class    = var.INSTANCE_CLASS
  license_model     = var.LICENSE_MODEL
  replicate_source_db = var.SOURCE_DB_IDENTIFIER
  name                                = var.NAME
  port                                = var.PORT
  iam_database_authentication_enabled = var.IAM_DATABASE_AUTHENTICATION_ENABLED
  vpc_security_group_ids = var.SECURITY_GROUP_IDS
  option_group_name      = aws_db_option_group.this[0].name
  availability_zone   = var.AVAILABILITY_ZONE
  multi_az            = var.MULTI_AZ
  publicly_accessible = var.PUBLICLY_ACCESSIBLE
  monitoring_interval = var.MONITORING_INTERVAL
  monitoring_role_arn = var.MONITORING_INTERVAL > 0 ? var.MONITORING_ROLE_ARN : null
  allow_major_version_upgrade = var.ALLOW_MAJOR_VERSION_UPGRADE
  auto_minor_version_upgrade  = var.AUTO_MINOR_VERSION_UPGRADE
  apply_immediately           = var.APPLY_IMMEDIATELY
  maintenance_window          = var.MAINTENANCE_WINDOW
  skip_final_snapshot         = var.SKIP_FINAL_SNAPSHOT
  copy_tags_to_snapshot       = var.COPY_TAGS_TO_SNAPSHOT
  final_snapshot_identifier   = var.FINAL_SNAPSHOT_IDENTIFIER
  performance_insights_enabled          = var.PERFORMANCE_INSIGHTS_ENABLED
  performance_insights_retention_period = var.PERFORMANCE_INSIGHTS_ENABLED == true ? var.PERFORMANCE_INSIGHTS_RETENTION_PERIOD : null
  performance_insights_kms_key_id       = var.PERFORMANCE_INSIGHTS_ENABLED == true ? var.KMS_KEY_ID : null
  backup_retention_period = var.BACKUP_RETENTION_PERIOD
  backup_window           = var.BACKUP_WINDOW
  character_set_name = var.CHARACTER_SET_NAME
  ca_cert_identifier = var.CA_CERT_IDENTIFIER
  enabled_cloudwatch_logs_exports = var.ENABLED_CLOUDWATCH_LOGS_EXPORTS
  deletion_protection      = var.DELETION_PROTECTION
  delete_automated_backups = var.DELETE_AUTOMATED_BACKUPS
  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,    
    {
      "Name" = format("%s", var.IDENTIFIER)
    },
  )
  timeouts {
    create = lookup(var.TIMEOUTS, "create", null)
    delete = lookup(var.TIMEOUTS, "delete", null)
    update = lookup(var.TIMEOUTS, "update", null)
  }
}

