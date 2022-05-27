
variable "REGION" {
    type    = string
    default = ""
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
###################
# LaunchTemplate
###################
variable "IMAGE_ID" {
  default = ""
  type = string
}
variable "TEMPLATE_NAME" {
  default = ""
  type = string
}
variable "INSTANCE_TYPE" {
  default = ""
  type = string
}
variable "ASG_IAM_INSTANCE_PROFILE_NAME" {
  default = ""
  type = string
}
variable "KEY_NAME" {
  default = null
  type = string
}
variable "ASG_SECURITY_GROUP_IDS" {
  default = []
  type = list(string)
}
variable "ASSOCIATE_PUBLIC_IP_ADDRESS" {
  default = true
  type = bool
}
variable "ASG_USER_DATA" {
  type = string
  default = " "
}
variable "ASG_LOAD_BALANCERS" {
  default = []
  type = list(string)
}
variable "ASG_TARGET_GROUP_ARNS" {
  default = []
  type = list(string)
}

variable "ASG_EBS_BLOCK_DEVICE" {
  type = list(object({
    device_name = string
    ebs = object({
    delete_on_termination = bool
    volume_type = string
    kms_key_id  = string
    volume_size = number
    })
  }))
  default = []
}
###################
# AutoScaling
###################

variable "ASG_NAME" {
  default = ""
  type = string
}
variable "ASG_SUBNET_IDS" {
  description = "A list of subnet IDs to launch resources in"
  default = []
  type        = list(string)
}
variable "ASG_MAX_SIZE" {
  default = 0
  type        = number
}
variable "ASG_MIN_SIZE" {
  default = 0
  type        = number
}
variable "ASG_DESIRED_CAPACITY" {
  default = 0
  type        = number
}

variable "ASG_SCALING_POLICIES" {
  type = list(object({
    name = string
    metric_type = string
    target_value = number 
    estimated_warmup = number
  }))
  default = []
}

variable "ASG_SCHEDULE_SCALING" {
  type = list(object({
    scheduled_action_name = string
    min_size = number
    max_size = number 
    desired_capacity = number
    recurrence = string
    start_time = string 
    end_time = string       
  }))
  default = []
}

variable "ASG_ACTIVITY_NOTIFICATIONS" {
  type = list(object({
    topic_arn = string
    notifications = list(string)
  }))
  default = []
}

variable "INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR" {
  description = "Shutdown behavior for the instance. Can be stop or terminate"
  type = string
  default = "stop"
}
variable "EBS_OPTIMIZED" {
  description = "If true, the launched EC2 instance will be EBS-optimized."
  type = bool
  default = false
}
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
  default     = null
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
variable "SERVICE_LINKED_ROLE_ARN" {
  description = "The ARN of the service-linked role that the ASG will use to call other AWS services."
  type        = string
  default     = null
}
variable "MAX_INSTANCE_LIFETIME" {
  description = "The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 604800 and 31536000 seconds."
  type        = number
  default     = 0
}
variable "INSTANCE_TAGS" {
  default = {
     "TagKey" = "TagValue"
  }
  description = "provide tag with key <Name> and value that will be propigated to Instances under Auto Scaling Group"
  
}