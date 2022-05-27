
module "EKS_NODE_GROUP" {
      providers = {
      aws = aws.var.REGION
    }
  source                      = "../../../modules/EKS_NODE_GROUP/1.0"
  TAGS                        = var.TAGS
  COMMON_TAGS                 = local.common_tags


###########################
########### Launch Template
  TEMPLATE_NAME               = var.TEMPLATE_NAME
  EBS_BLOCK_DEVICE            = var.EBS_BLOCK_DEVICE
  IMAGE_ID                    = var.IMAGE_ID
  KEY_NAME                    = var.KEY_NAME
  ASSOCIATE_PUBLIC_IP_ADDRESS = var.ASSOCIATE_PUBLIC_IP_ADDRESS
  SECURITY_GROUP_IDS          = var.SECURITY_GROUP_IDS
  USER_DATA                   = var.USER_DATA

###########################
##### Control Plane Logging
  LOGS_RETENTION_IN_DAYS      = var.LOGS_RETENTION_IN_DAYS

##########################
############## EKS Cluster
  CREATE_CLUSTER              = var.CREATE_CLUSTER
  CLUSTER_NAME                = var.CLUSTER_NAME
  ENDPOINT_PUBLIC_ACCESS      = var.ENDPOINT_PUBLIC_ACCESS
  PUBLIC_ACCESS_CIDRS         = var.PUBLIC_ACCESS_CIDRS
  ENDPOINT_PRIVATE_ACCESS     = var.ENDPOINT_PRIVATE_ACCESS
  CLUSTER_SUBNET_IDS          = var.CLUSTER_SUBNET_IDS
  KUBERNETES_VERSION          = var.KUBERNETES_VERSION
  CLUSTER_ROLE_ARN            = var.CLUSTER_ROLE_ARN
  LOGGING_TYPE                = var.LOGGING_TYPE
  KMS_ARN                     = var.KMS_ARN
  CODEBUILD_ROLE_NAME         = var.CODEBUILD_ROLE_NAME
  ALB_INGRESS_POLICY_ARN      = var.ALB_INGRESS_POLICY_ARN
###########################
########### EKS Node Group 
  NODE_ROLE_ARN               = var.NODE_ROLE_ARN
  NODE_GROUP_SUBNET_IDS       = var.NODE_GROUP_SUBNET_IDS
  AMI_TYPE                    = var.AMI_TYPE
  CAPACITY_TYPE               = var.CAPACITY_TYPE
  DESIRED_CAPACITY            = var.DESIRED_CAPACITY
  MAX_SIZE                    = var.MAX_SIZE
  MIN_SIZE                    = var.MIN_SIZE
  NODE_INSTANCE_TYPE          = var.NODE_INSTANCE_TYPE
  INSTANCE_TAGS               = var.INSTANCE_TAGS

}

####################
## OUTPUTS  #######
###################

output "LAUNCH_TEMPLATE_ARN" {
  value = "${module.EKS_NODE_GROUP.LAUNCH_TEMPLATE_ARN}"
}
output "LAUNCH_TEMPLATE_ID" {
  value = "${module.EKS_NODE_GROUP.LAUNCH_TEMPLATE_ID}"
}
output "EKS_CLUSTER_ARN" {
  value = "${module.EKS_NODE_GROUP.EKS_CLUSTER_ARN}"
}
output "EKS_CLUSTER_ENDPOINT" {
  value = "${module.EKS_NODE_GROUP.EKS_CLUSTER_ENDPOINT}"
}
output "EKS_CLUSTER_ID" {
  value = "${module.EKS_NODE_GROUP.EKS_CLUSTER_ID}"
}
output "EKS_NODE_GROUP_ARN" {
  value = "${module.EKS_NODE_GROUP.EKS_NODE_GROUP_ARN}"
}
output "EKS_NODE_GROUP_ID" {
  value = "${module.EKS_NODE_GROUP.EKS_NODE_GROUP_ID}"
}
output "EKS_NODE_GROUP_STATUS" {
  value = "${module.EKS_NODE_GROUP.EKS_NODE_GROUP_STATUS}"
}
