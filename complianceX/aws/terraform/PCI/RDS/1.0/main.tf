module "RDS" {
    source = "../../../modules/RDS/1.0"
    providers = {
      aws = aws.var.REGION
    }
    COMMON_TAGS                           = local.common_tags
    TAGS                                  = var.TAGS    
    IDENTIFIER                            = var.IDENTIFIER
    ENGINE                                = var.ENGINE
    ENGINE_VERSION                        = var.ENGINE_VERSION
    MAJOR_ENGINE_VERSION                  = var.MAJOR_ENGINE_VERSION
    INSTANCE_CLASS                        = var.INSTANCE_CLASS
    NAME                                  = var.NAME
    USERNAME                              = var.USERNAME
    PASSWORD                              = var.PASSWORD
    PORT                                  = var.PORT
    MAINTENANCE_WINDOW                    = var.MAINTENANCE_WINDOW
    BACKUP_WINDOW                         = var.BACKUP_WINDOW
    STORAGE_TYPE                          = var.STORAGE_TYPE
    FAMILY                                = var.FAMILY
    ALLOCATED_STORAGE                     = var.ALLOCATED_STORAGE
    BACKUP_RETENTION_PERIOD               = var.BACKUP_RETENTION_PERIOD
    MAX_ALLOCATED_STORAGE                 = var.MAX_ALLOCATED_STORAGE
    IOPS                                  = var.IOPS
    SUBNET_IDS                            = var.SUBNET_IDS
    SECURITY_GROUP_IDS                    = var.SECURITY_GROUP_IDS
    KMS_KEY_ID                            = var.KMS_KEY_ARN
    SKIP_FINAL_SNAPSHOT                   = var.SKIP_FINAL_SNAPSHOT
    MONITORING_ROLE_ARN                   = var.MONITORING_ROLE_ARN
    FINAL_SNAPSHOT_IDENTIFIER             = var.FINAL_SNAPSHOT_IDENTIFIER
    PERFORMANCE_INSIGHTS_ENABLED          = var.PERFORMANCE_INSIGHTS_ENABLED
    PERFORMANCE_INSIGHTS_RETENTION_PERIOD = var.PERFORMANCE_INSIGHTS_RETENTION_PERIOD
    DELETION_PROTECTION                   = var.DELETION_PROTECTION
    RDS_PARAMETERS                        = var.RDS_PARAMETERS
    RDS_OPTIONS                           = var.RDS_OPTIONS

    SNAPSHOT_IDENTIFIER                   = var.SNAPSHOT_IDENTIFIER
    LICENSE_MODEL                         = var.LICENSE_MODEL
    IAM_DATABASE_AUTHENTICATION_ENABLED   = var.IAM_DATABASE_AUTHENTICATION_ENABLED
    DOMAIN                                = var.DOMAIN
    DOMAIN_IAM_ROLE_NAME                  = var.DOMAIN_IAM_ROLE_NAME
    MULTI_AZ                              = var.MULTI_AZ
    PUBLICLY_ACCESSIBLE                   = var.PUBLICLY_ACCESSIBLE
    MONITORING_INTERVAL                   = var.MONITORING_INTERVAL
    ALLOW_MAJOR_VERSION_UPGRADE           = var.ALLOW_MAJOR_VERSION_UPGRADE
    AUTO_MINOR_VERSION_UPGRADE            = var.AUTO_MINOR_VERSION_UPGRADE
    APPLY_IMMEDIATELY                     = var.APPLY_IMMEDIATELY
    COPY_TAGS_TO_SNAPSHOT                 = var.COPY_TAGS_TO_SNAPSHOT
    ENABLED_CLOUDWATCH_LOGS_EXPORTS       = var.ENABLED_CLOUDWATCH_LOGS_EXPORTS
}

output "RDS_DATABASE" {
  value       = "${module.RDS.RDS_DATABASE}"
}
output "RDS_DATABASE_ID" {
  value       = "${module.RDS.RDS_DATABASE_ID}"
}
output "RDS_DATABASE_NAME" {
  value       = "${module.RDS.RDS_DATABASE_NAME}"
}
output "RDS_DATABASE_ARN" {
  value       = "${module.RDS.RDS_DATABASE_ARN}"
}
output "RDS_DATABASE_ENDPOINT" {
  value       = "${module.RDS.RDS_DATABASE_ENDPOINT}"
}

output "RDS_SUBNET_GROUP" {
  value       = "${module.RDS.RDS_SUBNET_GROUP}"
}
output "RDS_PARAMETER_GROUP" {
  value       = "${module.RDS.RDS_PARAMETER_GROUP}"
}
output "RDS_OPTION" {
  value       = "${module.RDS.RDS_OPTION}"
}
