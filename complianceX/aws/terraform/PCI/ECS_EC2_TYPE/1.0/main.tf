
module "ECS_EC2_TYPE" {
  providers = {
    aws = aws.var.REGION
  }
  source        = "../../../modules/ECS_EC2_TYPE/1.0/"
  TAGS          = var.TAGS
  COMMON_TAGS   = local.common_tags
  INSTANCE_TAGS = var.INSTANCE_TAGS
  ############################
  ########### Log Group Params 
  LOG_GROUP_NAME        = var.LOG_GROUP_NAME
  RETENTION_DAYS        = var.RETENTION_DAYS
  INSTANCE_PROFILE_NAME = var.INSTANCE_PROFILE_NAME
  ##########################
  ########### Cluster Params
  CLUSTER_NAME = var.CLUSTER_NAME
  KMS_KEY_ID   = var.KMS_KEY_ID
  ##################################
  ########## Launch Template Params
  LAUNCH_TEMPLATE_NAME                = var.LAUNCH_TEMPLATE_NAME
  EBS_BLOCK_DEVICE                    = var.EBS_BLOCK_DEVICE
  AMI_ID                              = var.AMI_ID
  INSTANCE_TYPE                       = var.INSTANCE_TYPE
  SSH_KEY_NAME                        = var.SSH_KEY_NAME
  MONITORING                          = var.MONITORING
  ASSIGN_PUBLIC_IP                    = var.ASSIGN_PUBLIC_IP
  DELETE_ON_TERMINATION               = var.DELETE_ON_TERMINATION
  INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR = var.INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR
  EBS_OPTIMIZED                       = var.EBS_OPTIMIZED
  DISABLE_API_TERMINATION             = var.DISABLE_API_TERMINATION
  ##############################
  ########## Auto Scaling Params
  AUTOSCALING_NAME          = var.AUTOSCALING_NAME
  MIN_SIZE                  = var.MIN_SIZE
  MAX_SIZE                  = var.MAX_SIZE
  DESIRED_CAPACITY          = var.DESIRED_CAPACITY
  HEALTH_CHECK_GRACE_PERIOD = var.HEALTH_CHECK_GRACE_PERIOD
  DEFAULT_COOLDOWN          = var.DEFAULT_COOLDOWN
  FORCE_DELETE              = var.FORCE_DELETE
  TERMINATION_POLICIES      = var.TERMINATION_POLICIES
  SUSPENDED_PROCESSES       = var.SUSPENDED_PROCESSES
  PLACEMENT_GROUP           = var.PLACEMENT_GROUP
  ENABLED_METRICS           = var.ENABLED_METRICS
  METRICS_GRANULARITY       = var.METRICS_GRANULARITY
  SERVICE_LINKED_ROLE_ARN   = var.SERVICE_LINKED_ROLE_ARN
  MAX_INSTANCE_LIFETIME     = var.MAX_INSTANCE_LIFETIME
  ##################################
  ########### Task Defination Params
  NETWORK_MODE       = var.NETWORK_MODE
  TASK_ROLE_ARN      = var.TASK_ROLE_ARN
  EXECUTION_ROLE_ARN = var.EXECUTION_ROLE_ARN
  IPC_MODE           = var.IPC_MODE
  PID_MODE           = var.PID_MODE
  ECS_TASKS          = var.ECS_TASKS
  ##########################
  ########### Service Params
  DESIRED_COUNT         = var.DESIRED_COUNT
  SCHEDULING_STRATEGY   = var.SCHEDULING_STRATEGY
  SUBNETS               = var.SUBNETS
  SECURITY_GROUPS       = var.SECURITY_GROUPS
  DEPLOYMENT_MIN_HEALTH = var.DEPLOYMENT_MIN_HEALTH
  DEPLOYMENT_MAX_HEALTH = var.DEPLOYMENT_MAX_HEALTH
  SERVICE               = var.SERVICE

}

########################################################
################################## OUTPUTS #############
########################################################

output "LAUNCH_TEMPLATE_ARN" {
  value = "${module.ECS_EC2_TYPE.LAUNCH_TEMPLATE_ARN}"
}
output "LAUNCH_TEMPLATE_ID" {
  value = "${module.ECS_EC2_TYPE.LAUNCH_TEMPLATE_ID}"
}
output "ECS_CLUSTER_ARN"{
  value = "${module.ECS_EC2_TYPE.ECS_CLUSTER_ARN}"
}
output "AUTOSCALING_GROUP_ID"{
  value = "${module.ECS_EC2_TYPE.AUTOSCALING_GROUP_ID}"
}
output "AUTOSCALING_GROUP_ARN"{
  value = "${module.ECS_EC2_TYPE.AUTOSCALING_GROUP_ARN}"
}
output "SERVICE"{
  value = "${module.ECS_EC2_TYPE.SERVICE}"
}
output "TASK_DEFINATION"{
  value = "${module.ECS_EC2_TYPE.TASK_DEFINATION}"
}