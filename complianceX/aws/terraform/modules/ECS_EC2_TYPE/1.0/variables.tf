variable "COMMON_TAGS" {
  default = {}
}
variable "TAGS" {
  default = {}
}
variable "LAUNCH_TEMPLATE_NAME"{}
variable "INSTANCE_TAGS" {
}
variable "CLUSTER_NAME" {}
variable "LOG_GROUP_NAME" {}

variable "KMS_KEY_ID" {}
variable "IPC_MODE" {}

variable "NETWORK_MODE" {}
variable "PID_MODE" {}

variable "DESIRED_COUNT" {}
variable "SUBNETS" {}
variable "SECURITY_GROUPS" {}
variable "ASSIGN_PUBLIC_IP" {}

variable "RETENTION_DAYS" {}

variable "TASK_ROLE_ARN"{}
variable "EXECUTION_ROLE_ARN" {}
variable "AUTOSCALING_NAME"{}
variable "MIN_SIZE"{}
variable "MAX_SIZE"{}
variable "DESIRED_CAPACITY"{}
variable "DEFAULT_COOLDOWN" {}
variable "FORCE_DELETE" {}
variable "TERMINATION_POLICIES" {}
variable "SUSPENDED_PROCESSES" {}
variable "PLACEMENT_GROUP" {}
variable "ENABLED_METRICS" {}
variable "METRICS_GRANULARITY" {}
variable "SERVICE_LINKED_ROLE_ARN" {}
variable "MAX_INSTANCE_LIFETIME" {}
variable "HEALTH_CHECK_GRACE_PERIOD"{}
variable "SCHEDULING_STRATEGY"{}
variable "AMI_ID"{}
variable "DISABLE_API_TERMINATION" {
  description = " If true, enables EC2 Instance Termination Protection"
  type = bool
  default     = false
}
variable "EBS_OPTIMIZED" {
  default = false
}
variable "INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR" {
  description = "Shutdown behavior for the instance. Can be stop or terminate"
  type = string
  default = "stop"
}
variable "INSTANCE_TYPE"{}
variable "SSH_KEY_NAME"{}
variable "EBS_BLOCK_DEVICE"{}
variable "MONITORING"{}
variable "DEPLOYMENT_MIN_HEALTH"{}
variable "DEPLOYMENT_MAX_HEALTH"{}
variable "DELETE_ON_TERMINATION"{}
variable "ECS_TASKS" {}
variable "SERVICE" {}
variable "INSTANCE_PROFILE_NAME" {}