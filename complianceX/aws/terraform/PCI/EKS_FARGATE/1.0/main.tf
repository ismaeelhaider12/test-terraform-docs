
module "EKS" {
    providers = {
      aws = aws.var.REGION
    }
  source                      = "../../../modules/EKS_FARGATE/1.0"
  TAGS                        = var.TAGS
  COMMON_TAGS                 = local.common_tags

###########################
##### Control Plane Logging
  LOGS_RETENTION_IN_DAYS      = var.LOGS_RETENTION_IN_DAYS

##########################
############## EKS Cluster
  CLUSTER_NAME                = var.CLUSTER_NAME
  KUBERNETES_VERSION          = var.KUBERNETES_VERSION
  CLUSTER_ROLE_ARN            = var.CLUSTER_ROLE_ARN
  ENDPOINT_PUBLIC_ACCESS      = var.ENDPOINT_PUBLIC_ACCESS
  PUBLIC_ACCESS_CIDRS         = var.PUBLIC_ACCESS_CIDRS
  ENDPOINT_PRIVATE_ACCESS     = var.ENDPOINT_PRIVATE_ACCESS
  LOGGING_TYPE                = var.LOGGING_TYPE
  KMS_ARN                     = var.KMS_ARN
  SECURITY_GROUP_IDS          = var.SECURITY_GROUP_IDS
  CLUSTER_SUBNET_IDS          = var.CLUSTER_SUBNET_IDS
  CODEBUILD_ROLE_NAME         = var.CODEBUILD_ROLE_NAME
###########################
########## fargate profile
  FARGATE_PROFILE             = var.FARGATE_PROFILE
}

####################
## OUTPUTS  #######
###################

output "EKS_CLUSTER_ARN" {
  value = "${module.EKS.EKS_CLUSTER_ARN}"
}
output "EKS_CLUSTER_ENDPOINT" {
  value = "${module.EKS.EKS_CLUSTER_ENDPOINT}"
}
output "EKS_CLUSTER_ID" {
  value = "${module.EKS.EKS_CLUSTER_ID}"
}

output "EKS_FARGATE_ARN" {
  value = "${module.EKS.EKS_FARGATE_ARN}"
}
output "EKS_FARGATE_ID" {
  value = "${module.EKS.EKS_FARGATE_ID}"
}
output "EKS_FARGATE_STATUS" {
  value = "${module.EKS.EKS_FARGATE_STATUS}"
}
