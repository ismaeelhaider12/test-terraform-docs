resource "aws_db_subnet_group" "this" {
  count = var.CREATE ? 1 : 0

  name = "${var.NAME}-subnet-group"
  description = "Database subnet group for ${var.IDENTIFIER}"
  subnet_ids  = var.SUBNET_IDS

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      "Name" = format("%s", var.IDENTIFIER)
    },
  )
}

resource "aws_db_parameter_group" "this_db_parameter_group" {
  count = length(var.RDS_PARAMETERS) > 0 ? 1 : 0

  name        = "${var.NAME}-parameter-group"
  description = "Parameter group for ${var.IDENTIFIER}"
  family      = var.FAMILY

  dynamic "parameter" {
    for_each = var.RDS_PARAMETERS
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      "Name" = format("%s", "${var.NAME}-parameter-group")
    },
  )
}

resource "aws_db_option_group" "this" {
  count = length(var.RDS_OPTIONS) > 0 ? 1 : 0
  name              = "${var.NAME}-option-group"
  option_group_description = "Option Group for ${var.IDENTIFIER}"
  engine_name              = var.ENGINE
  major_engine_version     = var.MAJOR_ENGINE_VERSION

  dynamic "option" {
    for_each = var.RDS_OPTIONS
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
}

resource "aws_db_instance" "this" {
  count = var.CREATE ? 1 : 0
  identifier = var.IDENTIFIER
  engine            = var.ENGINE
  engine_version    = var.ENGINE_VERSION
  instance_class    = var.INSTANCE_CLASS
  allocated_storage = var.ALLOCATED_STORAGE
  storage_type      = var.STORAGE_TYPE
  storage_encrypted = var.STORAGE_ENCRYPTED
  kms_key_id        = var.KMS_KEY_ID
  license_model     = var.LICENSE_MODEL

  name                                = element(split("-", var.ENGINE), 0) == "sqlserver" ? null : var.NAME
  username                            = var.USERNAME
  password                            = var.PASSWORD
  port                                = var.PORT
  domain                              = var.DOMAIN
  domain_iam_role_name                = var.DOMAIN_IAM_ROLE_NAME
  iam_database_authentication_enabled = var.IAM_DATABASE_AUTHENTICATION_ENABLED


  snapshot_identifier = var.SNAPSHOT_IDENTIFIER

  vpc_security_group_ids = var.SECURITY_GROUP_IDS
  db_subnet_group_name   = aws_db_subnet_group.this[0].name
  parameter_group_name   = length(var.RDS_PARAMETERS) > 0 ? aws_db_parameter_group.this_db_parameter_group[0].name : null
  option_group_name      = length(var.RDS_OPTIONS) > 0 ? aws_db_option_group.this[0].name : null

  availability_zone   = var.AVAILABILITY_ZONE
  multi_az            = var.MULTI_AZ
  iops                = var.STORAGE_TYPE == "io1" ? var.IOPS : null
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
  max_allocated_storage       = var.MAX_ALLOCATED_STORAGE

  performance_insights_enabled          = var.PERFORMANCE_INSIGHTS_ENABLED
  performance_insights_retention_period = var.PERFORMANCE_INSIGHTS_ENABLED == true ? var.PERFORMANCE_INSIGHTS_RETENTION_PERIOD : null
  performance_insights_kms_key_id       = var.PERFORMANCE_INSIGHTS_ENABLED == true ? var.KMS_KEY_ID : null
  backup_retention_period = var.BACKUP_RETENTION_PERIOD
  backup_window           = var.BACKUP_WINDOW
  enabled_cloudwatch_logs_exports = var.ENABLED_CLOUDWATCH_LOGS_EXPORTS
  deletion_protection      = var.DELETION_PROTECTION

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
