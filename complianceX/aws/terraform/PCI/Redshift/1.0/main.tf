module "Redshift" {
  providers = {
    aws = aws.var.REGION
  }
  source      = "../../../modules/Redshift/1.0"
  TAGS        = var.TAGS
  COMMON_TAGS = local.common_tags

  #########################
  ######## Redshift Cluster
  
  CLUSTER_IDENTIFIER            =   var.CLUSTER_IDENTIFIER
  DATABASE_NAME                 =   var.DATABASE_NAME
  ADMIN_USER                    =   var.ADMIN_USER
  ADMIN_PASSWORD                =   var.ADMIN_PASSWORD
  NODE_TYPE                     =   var.NODE_TYPE
  CLUSTER_TYPE                  =   var.CLUSTER_TYPE
  VPC_SECURITY_GROUPS           =   var.VPC_SECURITY_GROUPS
  AVAILABILLITY_ZONE            =   var.AVAILABILLITY_ZONE
  PREFERRED_MAINTENANCE_WINDOW  =   var.PREFERRED_MAINTENANCE_WINDOW
  AUTOMATED_SNAPSHOT_RETENTION_PERIOD   =   var.AUTOMATED_SNAPSHOT_RETENTION_PERIOD
  PORT                          =   var.PORT
  ENGINE_VERSION                =   var.ENGINE_VERSION
  NODES                         =   var.NODES
  PUBLICLY_ACCESSIBLE           =   var.PUBLICLY_ACCESSIBLE
  ENCRYPTED                     =   var.ENCRYPTED
  ENHANCED_VPC_ROUTING          =   var.ENHANCED_VPC_ROUTING
  KMS_KEY_ARN                   =   var.KMS_KEY_ARN
  ELASTIC_IP                    =   var.ELASTIC_IP
  SKIP_FINAL_SNAPSHOT           =   var.SKIP_FINAL_SNAPSHOT
  FINAL_SNAPSHOT_IDENTIFIER     =   var.FINAL_SNAPSHOT_IDENTIFIER
  SNAPSHOT_IDENTIFIER           =   var.SNAPSHOT_IDENTIFIER
  SNAPSHOT_CLUSTER_IDENTIFIER   =   var.SNAPSHOT_CLUSTER_IDENTIFIER
  OWNER_ACCOUNT                 =   var.OWNER_ACCOUNT
  IAM_ROLES                     =   var.IAM_ROLES
  LOGGING                       =   var.LOGGING
  DEFAULT_SECURITY_GROUP        =   var.DEFAULT_SECURITY_GROUP
  LOGGING_S3_KEY_PREFIX         =   var.LOGGING_S3_KEY_PREFIX
  LOGGING_BUCKET_NAME           =   var.LOGGING_BUCKET_NAME

  ##############################
  ######## Redshift Subnet Group   
  REDSHIFT_SUBNET_GROUP_NAME    = var.REDSHIFT_SUBNET_GROUP_NAME
  SUBNET_IDS                    =   var.SUBNET_IDS

  ##################################
  ######## Redshift Parameter Ggroup   

  REDSHIFT_PARAMETER_GROUP_NAME =   var.REDSHIFT_PARAMETER_GROUP_NAME
  CLUSTER_PARAMETERS            =   var.CLUSTER_PARAMETERS
  PARAMETER_GROUP_FAMILY        =   var.PARAMETER_GROUP_FAMILY


}

######################################
############ OutPuts

output "CLUSTER_ARN" {
  value = "${module.Redshift.CLUSTER_ARN}"
}

output "CLUSTER_ID" {
  value = "${module.Redshift.CLUSTER_ID}"
}

output "CLUSTER_IDENTIFIER" {
  value = "${module.Redshift.CLUSTER_IDENTIFIER}"
}

output "CLUSTER_DATABASE_NAME" {
  value = "${module.Redshift.CLUSTER_DATABASE_NAME}"
}

output "CLUSTER_DNS_NAME" {
  value = "${module.Redshift.CLUSTER_DNS_NAME}"
}

output "CLUSTER_ENDPOINTS" {
  value = "${module.Redshift.CLUSTER_ENDPOINTS}"
}

output "CLUSTER_PUBLIC_KEY" {
  value = "${module.Redshift.CLUSTER_PUBLIC_KEY}"
}