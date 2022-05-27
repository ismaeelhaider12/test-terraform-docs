###################
# LaunchTemplate
###################
variable "COMMON_TAGS" {
  default = {}
}
variable "TAGS" {
  default = {}
}
variable "IMAGE_ID" {}
variable "INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR" {
  description = "Shutdown behavior for the instance. Can be stop or terminate"
  type = string
  default = "stop"
}
variable "INSTANCE_TYPE" {}
variable "ASG_IAM_INSTANCE_PROFILE_NAME" {}
variable "KEY_NAME" {}
variable "ASG_SECURITY_GROUP_IDS" {}
variable "ASSOCIATE_PUBLIC_IP_ADDRESS" {}
variable "EBS_OPTIMIZED" {
  default = false
}
variable "ASG_USER_DATA" {}
variable "ENABLE_MONITORING" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled."
  type = bool
  default = false
}
variable "DISABLE_API_TERMINATION" {
  description = " If true, enables EC2 Instance Termination Protection"
  type = bool
  default     = false
}
variable "TEMPLATE_NAME" {
  type        = string
}
variable "ASG_EBS_BLOCK_DEVICE" {}

###################
# AutoScaling
###################

variable "ASG_NAME" {}
variable "ASG_SUBNET_IDS" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
}
variable "ASG_MAX_SIZE" {
  description = "The maximum size of the auto scale group"
  type        = number
}
variable "ASG_MIN_SIZE" {
  description = "The minimum size of the auto scale group"
  type        = number
}
variable "ASG_DESIRED_CAPACITY" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  type        = number
}

variable "HEALTH_CHECK_GRACE_PERIOD" {
  description = "Time (in seconds) after instance comes into service before checking health"
  type        = number
  default     = 300
}
variable "HEALTH_CHECK_TYPE" {
  description = "Controls how health checking is done. Values are - EC2 and ELB"
  type        = string
  default = "EC2"
}

variable "DEFAULT_COOLDOWN" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start"
  type        = number
  default     = 300
}
variable "FORCE_DELETE" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling"
  type        = bool
  default     = false
}
variable "TERMINATION_POLICIES" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
  type        = list(string)
  default     = ["Default"]
}
variable "SUSPENDED_PROCESSES" {
  description = "A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly."
  type        = list(string)
  default     = []
}
variable "PLACEMENT_GROUP" {
  description = "The name of the placement group into which you'll launch your instances, if any"
  type        = string
  default     = ""
}
variable "ENABLED_METRICS" {
  description = "A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances"
  type        = list(string)
  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}
variable "METRICS_GRANULARITY" {
  description = "The granularity to associate with the metrics to collect. The only valid value is 1Minute"
  type        = string
  default     = "1Minute"
}
variable "WAIT_FOR_CAPACITY_TIMEOUT" {
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out. (See also Waiting for Capacity below.) Setting this to '0' causes Terraform to skip all Capacity Waiting behavior."
  type        = string
  default     = "10m"
}
variable "PROTECT_FROM_SCALE_IN" {
  description = "Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events."
  type        = bool
  default     = false
}
variable "SERVICE_LINKED_ROLE_ARN" {
  description = "The ARN of the service-linked role that the ASG will use to call other AWS services."
  type        = string
  default     = ""
}
variable "MAX_INSTANCE_LIFETIME" {
  description = "The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 604800 and 31536000 seconds."
  type        = number
  default     = 0
}
variable "ASG_LOAD_BALANCERS" {
  default = []
}
variable "ASG_TARGET_GROUP_ARNS" {
  default = []
}

variable "ASG_SCALING_POLICIES" {
  default = []
}
variable "ASG_SCHEDULE_SCALING" {
  default = []
}
variable "ASG_ACTIVITY_NOTIFICATIONS" {
  default = []
}
variable "INSTANCE_TAGS" {}
