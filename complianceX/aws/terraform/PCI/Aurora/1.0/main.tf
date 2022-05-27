module "Aurora" {
    source = "../../../modules/Aurora/1.0"
    providers = {
      aws = aws.var.REGION
    }
    COMMON_TAGS                           = local.common_tags
    TAGS                                  = var.TAGS
    IDENTIFIER                            = var.IDENTIFIER
    MASTER_USERNAME                       = var.MASTER_USERNAME
    MASTER_PASSWORD                       = var.MASTER_PASSWORD
    NAME                                  = var.NAME
    ENGINE_MODE                           = var.ENGINE_MODE
    ENGINE                                = var.ENGINE
    ENGINE_VERSION                        = var.ENGINE_VERSION
    FAMILY                                = var.FAMILY
    SUBNET_IDS                            = var.SUBNET_IDS
    SECURITY_GROUP_IDS                    = var.SECURITY_GROUP_IDS
    RDS_ENHANCED_MONITORING_ROLE_ARN      = var.RDS_ENHANCED_MONITORING_ROLE_ARN
    AURORA_MONITORING_INTERVAL            = var.AURORA_MONITORING_INTERVAL
    PERFORMANCE_INSIGHTS_ENABLED          = var.PERFORMANCE_INSIGHTS_ENABLED
    KMS_KEY_ID                            = var.KMS_KEY_ID
    ENABLED_CLOUDWATCH_LOGS_EXPORTS       = var.ENABLED_CLOUDWATCH_LOGS_EXPORTS
    PUBLICLY_ACCESSIBLE                   = var.PUBLICLY_ACCESSIBLE
    AURORA_PARAMETER                      = var.AURORA_PARAMETER
    AURORA_SCALING_CONFIGURATION          = var.AURORA_SCALING_CONFIGURATION

    AURORA_INSTANCE_TYPE                  = var.AURORA_INSTANCE_TYPE
    REPLICA_COUNT                         = var.REPLICA_COUNT
    REPLICA_SCALE_ENABLED                 = var.REPLICA_SCALE_ENABLED
    REPLICA_SCALE_MAX                     = var.REPLICA_SCALE_MAX
    REPLICA_SCALE_MIN                     = var.REPLICA_SCALE_MIN
    
    DATABASE_NAME                         = var.DATABASE_NAME
    SKIP_FINAL_SNAPSHOT                   = var.SKIP_FINAL_SNAPSHOT
    DELETION_PROTECTION                   = var.DELETION_PROTECTION
    BACKUP_RETENTION_PERIOD               = var.BACKUP_RETENTION_PERIOD
    PREFERRED_BACKUP_WINDOW               = var.PREFERRED_BACKUP_WINDOW
    PREFERRED_MAINTENANCE_WINDOW          = var.PREFERRED_MAINTENANCE_WINDOW
    APPLY_IMMEDIATELY                     = var.APPLY_IMMEDIATELY
    AUTO_MINOR_VERSION_UPGRADE            = var.AUTO_MINOR_VERSION_UPGRADE
    SNAPSHOT_IDENTIFIER                   = var.SNAPSHOT_IDENTIFIER
    ENABLE_HTTP_ENDPOINT                  = var.ENABLE_HTTP_ENDPOINT
    REPLICA_SCALE_CPU                     = var.REPLICA_SCALE_CPU
    IAM_DATABASE_AUTHENTICATION_ENABLED   = var.IAM_DATABASE_AUTHENTICATION_ENABLED
    AURORA_REPLICATION_SOURCE_IDENTIFIER  = var.AURORA_REPLICATION_SOURCE_IDENTIFIER
    COPY_TAGS_TO_SNAPSHOT                 = var.COPY_TAGS_TO_SNAPSHOT
    
}

output "AURORA_DATABASE_INSTANCE" {
  value       = "${module.Aurora.AURORA_DATABASE_INSTANCE}"
}
output "AURORA_DATABASE_INSTANCE_ARN" {
  value       = "${module.Aurora.AURORA_DATABASE_INSTANCE_ARN}"
}
output "AURORA_DATABASE_INSTANCE_ID" {
  value       = "${module.Aurora.AURORA_DATABASE_INSTANCE_ID}"
}

output "AURORA_DATABASE_CLUSTER" {
  value       = "${module.Aurora.AURORA_DATABASE_CLUSTER}"
}
output "AURORA_DATABASE_CLUSTER_ID" {
  value       = "${module.Aurora.AURORA_DATABASE_CLUSTER_ID}"
}
output "AURORA_DATABASE_CLUSTER_ARN" {
  value       = "${module.Aurora.AURORA_DATABASE_CLUSTER_ARN}"
}
output "AURORA_SUBNET_GROUP" {
  value       = "${module.Aurora.AURORA_SUBNET_GROUP}"
}
output "AURORA_CLUSTER_PARAMETER_GROUP" {
  value       = "${module.Aurora.AURORA_CLUSTER_PARAMETER_GROUP}"
}
output "AURORA_DB_PARAMETER_GROUP" {
  value       = "${module.Aurora.AURORA_DB_PARAMETER_GROUP}"
}
