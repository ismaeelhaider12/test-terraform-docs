variable "REGION" {
    type = string
    default = ""
}

variable "BROKER_NAME" {
  type        = string
  description = " (Required) Name of the broker."
  default = ""
}

variable "SECURITY_GROUPS" {
  type        = list(string)
  description = "List of security group IDs assigned to the broker."
  default = []
}

variable "SUBNET_IDS" {
  type        = list(string)
  description = ""
  default = []
}

variable "HOST_INSTANCE_TYPE" {
  type        = string
  description = "(Required) Broker's instance type. For example, `mq.t3.micro`, `mq.m5.large`."
  default = "mq.t3.micro"
}

variable "ENGINE_TYPE" {
  type        = string
  description = "(optional) Type of broker engine."
  default     = "RabbitMQ"
}

variable "ENGINE_VERSION" {
  type        = string
  description = "(optional) Version of the broker engine. See the [AmazonMQ Broker Engine docs](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html) for supported versions."
  default     = "3.8.6"
}

variable "STORAGE_TYPE" {
  type        = string
  description = "(optional) Storage type of the broker, only ebs work with mq.m5.large"
  default     = null
}

variable "AUTHENTICATION_STRATEGY" {
  type        = string
  description = "(optional) Authentication strategy used to secure the broker"
  default     = "simple"
}

variable "DEPLOYMENT_MODE" {
  type        = string
  description = "(optional) description"
  default     = "SINGLE_INSTANCE"
}

variable "APPLY_IMMEDIATELY" {
  type        = bool
  description = "(Optional) Specifies whether any broker modifications are applied immediately, or during the next maintenance window."
  default     = true
}

variable "AUTO_MINOR_VERSION_UPGRADE" {
  type        = bool
  description = "(optional) Whether to automatically upgrade to new minor versions of brokers as Amazon MQ makes releases available."
  default     = false
}

variable "PUBLICLY_ACCESSIBLE" {
  type        = bool
  description = "(optional) Whether to enable connections from applications outside of the VPC that hosts the broker's subnets."
  default     = false
}

variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}

variable "USERNAME" {
  type        = string
  description = "(optional) description"
  default = ""
}

variable "PASSWORD" {
  type        = string
  sensitive   = true
  description = "(optional) description"
  default = ""
}

variable "USER_GROUPS" {
      type = list(string)
      default = ["group1","group2"]
      description = "valid for ActiveMQ only"
}

variable "MAINTENANCE_WINDOW_START_TIME" {
  type = object({
    day_of_week = string
    time_of_day = string
    time_zone   = string
  })
  description = "Configuration block for the maintenance window start time."
  default = {
    day_of_week = "MONDAY"
    time_of_day = "22:45"
    time_zone   = "Europe/Berlin"
  }

}

variable "logs_general" {
  type        = bool
  description = "(optional) description"
  default     = true
}

variable "KMS_KEY_ID" {
      type =  string
      default = "" 
}

variable "LOGS_GENERAL" {
    type  =bool 
    default = "false"
}