locals {
  port                 = var.PORT == "" ? var.ENGINE == "aurora-postgresql" ? "5432" : "3306" : var.PORT
  db_subnet_group_name = var.DB_SUBNET_GROUP_NAME == "" ? join("", aws_db_subnet_group.this.*.name) : var.DB_SUBNET_GROUP_NAME
  backtrack_window     = (var.ENGINE == "aurora-mysql" || var.ENGINE == "aurora") && var.ENGINE_MODE != "serverless" ? var.BACKTRACK_WINDOW : 0
}

resource "aws_db_subnet_group" "this" {
  count = var.CREATE_CLUSTER && var.DB_SUBNET_GROUP_NAME == "" ? 1 : 0

  name        = "${var.NAME}-subnet-group"
  description = "For Aurora cluster ${var.NAME}"
  subnet_ids  = var.SUBNET_IDS

  tags = merge(var.COMMON_TAGS, var.TAGS, {
    Name = var.NAME
  })
}

resource "aws_rds_cluster_parameter_group" "rds_cluster_parameter_group" {
  count = length(var.AURORA_PARAMETER) > 0 ? 1 : 0
  name        = "${var.NAME}-cluster-parameter-group"
  family      = var.FAMILY
  description = "RDS cluster parameter group ${var.NAME}"
  dynamic "parameter" {
    for_each = var.AURORA_PARAMETER
    content {
      name               = lookup(parameter.value, "name", null)
      value             = lookup(parameter.value, "value", null)
    }
  }
}

resource "aws_db_parameter_group" "parameter_group_default" {
  count = length(var.AURORA_PARAMETER) > 0 && var.ENGINE_MODE == "provisioned" ? 1 : 0
  name        = "${var.NAME}-parameter-group"
  family      = var.FAMILY
  description = "RDS parameter group ${var.NAME}"
  dynamic "parameter" {
    for_each = var.AURORA_PARAMETER
    content {
      name               = lookup(parameter.value, "name", null)
      value             = lookup(parameter.value, "value", null)
    }
  }  
}

resource "aws_rds_cluster" "this" {
  count = var.CREATE_CLUSTER ? 1 : 0

  global_cluster_identifier           = var.GLOBAL_CLUSTER_IDENTIFIER
  cluster_identifier                  = var.IDENTIFIER
  replication_source_identifier       = var.AURORA_REPLICATION_SOURCE_IDENTIFIER
  source_region                       = var.AURORA_SOURCE_REGION
  engine                              = var.ENGINE
  engine_mode                         = var.ENGINE_MODE
  engine_version                      = var.ENGINE_VERSION
  enable_http_endpoint                = var.ENABLE_HTTP_ENDPOINT
  kms_key_id                          = var.KMS_KEY_ID
  database_name                       = var.DATABASE_NAME
  master_username                     = var.MASTER_USERNAME
  master_password                     = var.MASTER_PASSWORD
  final_snapshot_identifier           = "${var.FINAL_SNAPSHOT_IDENTIFIER_PREFIX}-${var.NAME}-${element(concat(random_id.snapshot_identifier.*.hex, [""]), 0)}"
  skip_final_snapshot                 = var.SKIP_FINAL_SNAPSHOT
  deletion_protection                 = var.DELETION_PROTECTION
  backup_retention_period             = var.BACKUP_RETENTION_PERIOD
  preferred_backup_window             = var.PREFERRED_BACKUP_WINDOW
  preferred_maintenance_window        = var.PREFERRED_MAINTENANCE_WINDOW
  port                                = local.port
  db_subnet_group_name                = local.db_subnet_group_name
  vpc_security_group_ids              = var.SECURITY_GROUP_IDS
  snapshot_identifier                 = var.SNAPSHOT_IDENTIFIER
  storage_encrypted                   = var.STORAGE_ENCRYPTED
  apply_immediately                   = var.APPLY_IMMEDIATELY
  db_cluster_parameter_group_name     = length(var.AURORA_PARAMETER) > 0 ? aws_rds_cluster_parameter_group.rds_cluster_parameter_group[0].name : null
  iam_database_authentication_enabled = var.IAM_DATABASE_AUTHENTICATION_ENABLED
  backtrack_window                    = local.backtrack_window
  copy_tags_to_snapshot               = var.COPY_TAGS_TO_SNAPSHOT
  iam_roles                           = var.IAM_ROLES

  enabled_cloudwatch_logs_exports = var.ENABLED_CLOUDWATCH_LOGS_EXPORTS

  dynamic "scaling_configuration" {
      for_each =  var.ENGINE_MODE == "serverless" ? (length(keys(var.AURORA_SCALING_CONFIGURATION)) == 0 ? [] : [var.AURORA_SCALING_CONFIGURATION]) : []
    content {
      auto_pause               = lookup(scaling_configuration.value, "auto_pause", null)
      max_capacity             = lookup(scaling_configuration.value, "max_capacity", null)
      min_capacity             = lookup(scaling_configuration.value, "min_capacity", null)
      seconds_until_auto_pause = lookup(scaling_configuration.value, "seconds_until_auto_pause", null)
      timeout_action           = lookup(scaling_configuration.value, "timeout_action", "")
    }
  }

  tags = merge(var.COMMON_TAGS, var.TAGS,)  
}

resource "aws_rds_cluster_instance" "this" {
  count = var.CREATE_CLUSTER && var.ENGINE_MODE == "provisioned" ? (var.REPLICA_SCALE_ENABLED ? var.REPLICA_SCALE_MIN : var.REPLICA_COUNT) : 0

  identifier                      = length(var.INSTANCES_PARAMETERS) > count.index ? lookup(var.INSTANCES_PARAMETERS[count.index], "instance_name", "${var.NAME}-${count.index + 1}") : "${var.NAME}-${count.index + 1}"
  cluster_identifier              = element(concat(aws_rds_cluster.this.*.id, [""]), 0)
  engine                          = var.ENGINE
  engine_version                  = var.ENGINE_VERSION
  instance_class                  = length(var.INSTANCES_PARAMETERS) > count.index ? lookup(var.INSTANCES_PARAMETERS[count.index], "instance_type", var.AURORA_INSTANCE_TYPE) : count.index > 0 ? coalesce(var.INSTANCE_TYPE_REPLICA, var.AURORA_INSTANCE_TYPE) : var.AURORA_INSTANCE_TYPE
  publicly_accessible             = length(var.INSTANCES_PARAMETERS) > count.index ? lookup(var.INSTANCES_PARAMETERS[count.index], "publicly_accessible", var.PUBLICLY_ACCESSIBLE) : var.PUBLICLY_ACCESSIBLE
  db_subnet_group_name            = local.db_subnet_group_name
  db_parameter_group_name         = length(var.AURORA_PARAMETER) > 0 ? aws_db_parameter_group.parameter_group_default[0].name : null
  preferred_maintenance_window    = var.PREFERRED_MAINTENANCE_WINDOW
  apply_immediately               = var.APPLY_IMMEDIATELY
  monitoring_role_arn             = var.PERFORMANCE_INSIGHTS_ENABLED ? var.RDS_ENHANCED_MONITORING_ROLE_ARN : null
  monitoring_interval             = var.PERFORMANCE_INSIGHTS_ENABLED ? var.AURORA_MONITORING_INTERVAL : 0
  auto_minor_version_upgrade      = var.AUTO_MINOR_VERSION_UPGRADE
  promotion_tier                  = length(var.INSTANCES_PARAMETERS) > count.index ? lookup(var.INSTANCES_PARAMETERS[count.index], "instance_promotion_tier", count.index + 1) : count.index + 1
  performance_insights_enabled    = var.PERFORMANCE_INSIGHTS_ENABLED
  performance_insights_kms_key_id = var.PERFORMANCE_INSIGHTS_ENABLED ? var.KMS_KEY_ID : null
  ca_cert_identifier              = var.CA_CERT_IDENTIFIER

  depends_on = [aws_db_parameter_group.parameter_group_default[0]]
  tags = merge(var.COMMON_TAGS, var.TAGS,)
}

resource "random_id" "snapshot_identifier" {
  count = var.CREATE_CLUSTER ? 1 : 0

  keepers = {
    id = var.NAME
  }
  byte_length = 4
}

resource "aws_appautoscaling_target" "read_replica_count" {
  count = var.CREATE_CLUSTER && var.REPLICA_SCALE_ENABLED ? 1 : 0

  max_capacity       = var.REPLICA_SCALE_MAX
  min_capacity       = var.REPLICA_SCALE_MIN
  resource_id        = "cluster:${element(concat(aws_rds_cluster.this.*.cluster_identifier, [""]), 0)}"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  service_namespace  = "rds"
}

resource "aws_appautoscaling_policy" "autoscaling_read_replica_count" {
  count = var.CREATE_CLUSTER && var.REPLICA_SCALE_ENABLED ? 1 : 0

  name               = "target-metric"
  policy_type        = "TargetTrackingScaling"
  resource_id        = "cluster:${element(concat(aws_rds_cluster.this.*.cluster_identifier, [""]), 0)}"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  service_namespace  = "rds"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.PREDEFINED_METRIC_TYPE
    }

    scale_in_cooldown  = var.REPLICA_SCALE_IN_COOLDOWN
    scale_out_cooldown = var.REPLICA_SCALE_OUT_COOLDOWN
    target_value       = var.PREDEFINED_METRIC_TYPE == "RDSReaderAverageCPUUtilization" ? var.REPLICA_SCALE_CPU : var.REPLICA_SCALE_CONNECTIONS
  }

  depends_on = [aws_appautoscaling_target.read_replica_count]
}
