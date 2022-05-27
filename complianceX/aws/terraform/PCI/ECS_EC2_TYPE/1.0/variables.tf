 variable "REGION" {
     type    = string
     default = "" 
     }
     
variable "CLUSTER_NAME" {
        type = string
        default = ""

}
variable "LOG_GROUP_NAME" {
        type = string
        default = ""
}
variable "KMS_KEY_ID" {
        type = string
        default = ""

}
variable "LAUNCH_TEMPLATE_NAME" {
        type = string
        default = ""
        description = "provide name for launch template"

}
variable "IPC_MODE" {
        type = string
        default = "host"
        description = " IPC resource namespace to be used for the containers in the task The valid values are host, task, and none"
}
variable "NETWORK_MODE" {
        type = string
        default = ""
        description = "Docker networking mode to use for the containers in the task. Valid values are none, bridge, awsvpc, and host. awsvpc type is not compatable with EC2 type TaskDefination "
}
variable "PID_MODE" {
        type = string
        default = "host"
        description = "Process namespace to use for the containers in the task. The valid values are host and task"
}


variable "DESIRED_COUNT" {
            type = number
            default = 1
            description = "Number of instances of the task definition."
}

variable "SUBNETS" {
            type = list
            default = []
            description = " Subnets associated with the AutoScaling Group"
}
variable "SECURITY_GROUPS" {
            type    = list
            default = []
            description =   "Security groups associated with network interface of launch template If you do not specify a security group, the default security group for the VPC is used"
}
variable "ASSIGN_PUBLIC_IP" {
            type = bool
            default = true
            description= "Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false. Default false"
}
variable "DELETE_ON_TERMINATION"{
                type    =  bool
                default =  true
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
variable "DISABLE_API_TERMINATION" {
  description = " If true, enables EC2 Instance Termination Protection"
  type = bool
  default     = false
}
variable "RETENTION_DAYS" {
            type = number
            default = 7
            description = "retention days for logs to reside in log group"
}               

variable "INSTANCE_PROFILE_NAME" {
                type = string
                default = ""
                description = "provide role name attached to ec2-instance through launch config"
}

variable "TASK_ROLE_ARN" {
                type = string
                default = ""
                description = "ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
}
variable "EXECUTION_ROLE_ARN" {
                 type = string
                 default = ""
                 description = "ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume"
}
variable "AUTOSCALING_NAME"{
                type = "string"
                default = ""
                description = "Provide name for auto-scaling Group"
}

variable "MIN_SIZE"{
        type = number
        default = 1
        description =  "provide minimum number of ec2 instances which can be created in AutoScaling and regestered with ECS"
}
variable "MAX_SIZE"{
        type    =       number
        default =       1
        description =  "provide maximum number of ec2 instances which can be created in AutoScaling and regestered with ECS"
}
variable "DESIRED_CAPACITY"{
        type    =       number
        default =       1
        description =  "provide Desired number of ec2 instances which are created in AutoScaling and regestered with ECS"
}
variable "HEALTH_CHECK_GRACE_PERIOD"{
        type    =       number
        default =       200
        description =   "Time (in seconds) after instance comes into service before checking health"
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
variable "METRICS_GRANULARITY" {
        type = string
        description = "The granularity to associate with the metrics to collect"
        default = "1Minute"
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
variable "SCHEDULING_STRATEGY"{
        type    =       string
        default =       "REPLICA"
        description     ="Scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy."
}
variable "AMI_ID"{
        type    =      string
        default =      ""
        description     ="provide AMI id which will be used as base ami for ec2 instances in autoscaling group"
}
variable "INSTANCE_TYPE"{
        type    =      string
        default =       ""
        description     = "provide instance type for instances to be launched through auto scaling group"
}
variable "SSH_KEY_NAME"{
        type    =       string
        default =       ""
        description     = "provide ssh key name to be used to ssh into instances created by autoscaling group"
}

variable "EBS_BLOCK_DEVICE" {
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

variable "MONITORING"{
        type =  bool
        default = false
}
variable "DEPLOYMENT_MIN_HEALTH"{
        type    =       number
        default =       50
}
variable "DEPLOYMENT_MAX_HEALTH"{
        type    =       number
        default =       200

}

variable "ECS_TASKS" {
  description = "List of variables to define an ECS task."
  type = list(object({
    family         = string
    cpu            = string
    memory         = string
    container_port = string
    container_name = string
    volume              = list(object({
      name      = string
      host_path = string
    }))
    container_definition = list(object({
      name      = string
      image     = string
      essential = bool
      cpu = number
      memory = number
      mountPoints       = list(object({
        sourceVolume  = string
        containerPath = string
      }))
      portMappings      = list(object({
        containerPort = number
        protocol      = string
        hostPort      = number
      }))
      environment      = list(object({
        name          = string
        value         = string
      }))
      secrets          = list(object({
        name          = string
        valueFrom     = string
      }))
      logConfiguration =  object({
        logDriver     = string
        options       = object({
            awslogs-group = string
            awslogs-stream-prefix = string
            awslogs-region  = string
        })
      })   
    }))
  }))
  default = []
}

variable "SERVICE" {
  description = "List of variables to define a Fargate microservice."
  type = list(object({
    name                   = string
    task_definition        = string
    desired_count          = number
    load_balancer = list(object({
      target_group_arn = string
      container_name   = string
      container_port   = number
    }))
    network_configuration = list(object({
                security_groups = list(string)
                subnets =       list(string)
                assign_public_ip        = bool
    }))
  }))
  default = []
  }
variable "TAGS" {
  default = {
     "TagKey" = "TagValue",
  }
}
variable "INSTANCE_TAGS" {
  default = {
  "TagKey" = "TagValue",
  }
}