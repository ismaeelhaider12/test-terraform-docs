
module "AutoScaling" {

  providers = {
    aws = aws.var.REGION
  }

  source                            = "../../../modules/AutoScaling/1.0"
  COMMON_TAGS                       = local.common_tags
  TAGS                              = var.TAGS
  INSTANCE_TAGS                     = var.INSTANCE_TAGS
###############
### Launch Template
###############
  TEMPLATE_NAME                     = var.TEMPLATE_NAME
  KEY_NAME                          = var.KEY_NAME
  ASG_USER_DATA                     = var.ASG_USER_DATA
  ASG_IAM_INSTANCE_PROFILE_NAME     = var.ASG_IAM_INSTANCE_PROFILE_NAME
  ASSOCIATE_PUBLIC_IP_ADDRESS       = var.ASSOCIATE_PUBLIC_IP_ADDRESS
  ASG_SECURITY_GROUP_IDS            = var.ASG_SECURITY_GROUP_IDS
  IMAGE_ID                          = var.IMAGE_ID
  INSTANCE_TYPE                     = var.INSTANCE_TYPE
  ASG_EBS_BLOCK_DEVICE              = var.ASG_EBS_BLOCK_DEVICE
######################
### Auto scaling group
######################
  ASG_NAME                              = var.ASG_NAME
  ASG_SUBNET_IDS                        = var.ASG_SUBNET_IDS
  ASG_MIN_SIZE                          = var.ASG_MIN_SIZE
  ASG_MAX_SIZE                          = var.ASG_MAX_SIZE
  ASG_DESIRED_CAPACITY                  = var.ASG_DESIRED_CAPACITY
  ASG_LOAD_BALANCERS                    = var.ASG_LOAD_BALANCERS
  ASG_TARGET_GROUP_ARNS                 = var.ASG_TARGET_GROUP_ARNS
  ASG_SCALING_POLICIES                  = var.ASG_SCALING_POLICIES
  ASG_SCHEDULE_SCALING                  = var.ASG_SCHEDULE_SCALING
  ASG_ACTIVITY_NOTIFICATIONS            = var.ASG_ACTIVITY_NOTIFICATIONS


  INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR  = var.INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR
  EBS_OPTIMIZED                         = var.EBS_OPTIMIZED
  ENABLE_MONITORING                     = var.ENABLE_MONITORING
  DISABLE_API_TERMINATION               = var.DISABLE_API_TERMINATION
  HEALTH_CHECK_GRACE_PERIOD             = var.HEALTH_CHECK_GRACE_PERIOD
  HEALTH_CHECK_TYPE                     = var.HEALTH_CHECK_TYPE
  DEFAULT_COOLDOWN                      = var.DEFAULT_COOLDOWN
  FORCE_DELETE                          = var.FORCE_DELETE
  TERMINATION_POLICIES                  = var.TERMINATION_POLICIES
  SUSPENDED_PROCESSES                   = var.SUSPENDED_PROCESSES
  PLACEMENT_GROUP                       = var.PLACEMENT_GROUP
  ENABLED_METRICS                       = var.ENABLED_METRICS
  SERVICE_LINKED_ROLE_ARN               = var.SERVICE_LINKED_ROLE_ARN
  MAX_INSTANCE_LIFETIME                 = var.MAX_INSTANCE_LIFETIME
}



##### OUTPUTS
output "LAUNCH_TEMPLATE" {
  value       = "${module.AutoScaling.LAUNCH_TEMPLATE}"
}
output "LAUNCH_TEMPLATE_ARN" {
  value       = "${module.AutoScaling.LAUNCH_TEMPLATE_ARN}"
}
output "LAUNCH_TEMPLATE_ID" {
  value       = "${module.AutoScaling.LAUNCH_TEMPLATE_ID}"
}

output "AUTOSCALING_GROUP" {
  value       = "${module.AutoScaling.AUTOSCALING_GROUP}"
}
output "AUTOSCALING_GROUP_NAME" {
  value       = "${module.AutoScaling.AUTOSCALING_GROUP_NAME}"
}
output "AUTOSCALING_GROUP_ARN" {
  value       = "${module.AutoScaling.AUTOSCALING_GROUP_ARN}"
}
