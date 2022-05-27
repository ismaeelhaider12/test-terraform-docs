
variable "REGION" {

  type    = string
  default = ""
}

variable "CLUSTER_ARN" {
  type    = string
  default = ""
}
variable "RETENTION_DAYS" {
  type    = number
  default = 7
}
variable "LOG_GROUP_NAME" {
  type    = string
  default = ""
}

variable "NETWORK_MODE" {
  type        = string
  default     = ""
  description = "Docker networking mode to use for the containers in the task. Valid values are none, bridge, awsvpc, and host. awsvpc type is not compatable with EC2 type TaskDefination, FARGATE only suports awsvpc mode "
}

variable "TASK_ROLE_ARN" {
  type        = string
  default     = ""
  description = "ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
}
variable "SCHEDULING_STRATEGY" {
  type        = string
  default     = "REPLICA"
  description = "Scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Defaults to REPLICA. Note that Tasks using the Fargate launch type or the CODE_DEPLOY or EXTERNAL deployment controller types don't support the DAEMON scheduling strategy."

}


variable "ECS_TASKS" {
  description = "List of variables to define an ECS task."
  type = list(object({
    family         = string
    cpu            = string
    memory         = string
    container_port = number
    container_name = string
    volume = list(object({
      name      = string
      host_path = string
    }))
    container_definition = list(object({
      name      = string
      image     = string
      cpu       = number
      memory    = number
      essential = bool
      mountPoints = list(object({
        sourceVolume  = string
        containerPath = string
      }))
      portMappings = list(object({

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
      logConfiguration = object({
        logDriver = string
        options = object({
          awslogs-group         = string
          awslogs-stream-prefix = string
          awslogs-region        = string
        })
      })

    }))
  }))
  default = []
}

variable "SERVICE" {
  description = "List of variables to define a Fargate microservice."
  type = list(object({
    name            = string
    task_definition = string
    desired_count   = number
    network_configuration = list(object({
      subnets          = list(string)
      security_groups  = list(string)
      assign_public_ip = bool
    }))

    load_balancer = list(object({
      target_group_arn = string
      container_name   = string
      container_port   = number

    }))
  }))
  default = []
}
variable "TAGS" {
  default = {

    "TagKey" = "TagValue",
  }
}

variable "COMPATIBILITIES" {
  description = "valid values are FARGATE or EC2"
  type        = string
  default     = "FARGATE"
}

