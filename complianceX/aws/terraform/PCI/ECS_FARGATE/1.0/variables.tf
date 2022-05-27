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

variable "RETENTION_DAYS" {
            type = number
            default = 7
            description = "retention days for logs to reside in log group"
}               
variable "ECS_TASKS" {
  description = "List of variables to define an ECS task."
  type = list(object({
    family         = string
    cpu            = string
    memory         = string
    container_port = string
    container_name = string
    task_role_arn  = string
    execution_role_arn= string
    network_mode   = string
    container_definition = list(object({
      name      = string
      image     = string
      essential = bool
      portMappings      = list(object({
        containerPort = number
        protocol      = string
        hostPort      = number
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
    scheduling_strategy                = string
    deployment_minimum_healthy_percent = number
    deployment_maximum_percent         = number
    subnets          = list(string)
    security_groups  = list(string)
    assign_public_ip = bool
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
     "TagKey" = "tagValue",
  }
}
