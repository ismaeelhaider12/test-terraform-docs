module "RDSReadReplica" {
    source = "../../../modules/RDSReadReplica/1.0"
    providers = {
      aws = aws.var.REGION
    }
    COMMON_TAGS                             = local.common_tags
    TAGS                                    = var.TAGS
    IDENTIFIER                              = var.IDENTIFIER
    ENGINE                                  = var.ENGINE
    ENGINE_VERSION                          = var.ENGINE_VERSION
    MAJOR_ENGINE_VERSION                    = var.MAJOR_ENGINE_VERSION
    INSTANCE_CLASS                          = var.INSTANCE_CLASS
    NAME                                    = var.NAME
    PORT                                    = var.PORT
    SOURCE_DB_IDENTIFIER                    = var.SOURCE_DB_IDENTIFIER
    SECURITY_GROUP_IDS                      = var.SECURITY_GROUP_IDS
    PERFORMANCE_INSIGHTS_ENABLED            = var.PERFORMANCE_INSIGHTS_ENABLED
    PERFORMANCE_INSIGHTS_RETENTION_PERIOD   = var.PERFORMANCE_INSIGHTS_RETENTION_PERIOD
    RDS_READ_REPLICA_OPTIONS                = var.RDS_READ_REPLICA_OPTIONS

    KMS_KEY_ID                              = var.KMS_KEY_ID
    LICENSE_MODEL                           = var.LICENSE_MODEL
    IAM_DATABASE_AUTHENTICATION_ENABLED     = var.IAM_DATABASE_AUTHENTICATION_ENABLED
    FINAL_SNAPSHOT_IDENTIFIER               = var.FINAL_SNAPSHOT_IDENTIFIER
    MULTI_AZ                                = var.MULTI_AZ
    PUBLICLY_ACCESSIBLE                     = var.PUBLICLY_ACCESSIBLE
    MONITORING_INTERVAL                     = var.MONITORING_INTERVAL
    MONITORING_ROLE_ARN                     = var.MONITORING_ROLE_ARN
    ALLOW_MAJOR_VERSION_UPGRADE             = var.ALLOW_MAJOR_VERSION_UPGRADE
    AUTO_MINOR_VERSION_UPGRADE              = var.AUTO_MINOR_VERSION_UPGRADE
    APPLY_IMMEDIATELY                       = var.APPLY_IMMEDIATELY
    MAINTENANCE_WINDOW                      = var.MAINTENANCE_WINDOW
    SKIP_FINAL_SNAPSHOT                     = var.SKIP_FINAL_SNAPSHOT
    COPY_TAGS_TO_SNAPSHOT                   = var.COPY_TAGS_TO_SNAPSHOT
    BACKUP_RETENTION_PERIOD                 = var.BACKUP_RETENTION_PERIOD
    BACKUP_WINDOW                           = var.BACKUP_WINDOW
    ENABLED_CLOUDWATCH_LOGS_EXPORTS         = var.ENABLED_CLOUDWATCH_LOGS_EXPORTS
    DELETION_PROTECTION                     = var.DELETION_PROTECTION
    DELETE_AUTOMATED_BACKUPS                = var.DELETE_AUTOMATED_BACKUPS

}

output "RDS_READ_REPLICA_DATABASE" {
  value       =  "${module.RDSReadReplica.RDS_READ_REPLICA_DATABASE}"
}
output "RDS_READ_REPLICA_DATABASE_ID" {
  value       =  "${module.RDSReadReplica.RDS_READ_REPLICA_DATABASE_ID}"
}
output "RDS_READ_REPLICA_DATABASE_ARN" {
  value       =  "${module.RDSReadReplica.RDS_READ_REPLICA_DATABASE_ARN}"
}
output "RDS_READ_REPLICA_DATABASE_NAME" {
  value       =  "${module.RDSReadReplica.RDS_READ_REPLICA_DATABASE_NAME}"
}

output "RDS_READ_REPLICA_OPTION" {
  value       =  "${module.RDSReadReplica.RDS_READ_REPLICA_DATABASE}"
}
