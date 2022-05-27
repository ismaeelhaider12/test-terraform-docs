variable "REGION" {
    type = string
    default = ""
}
variable "TAGS" {
  default = {

    "TagKey" = "TagValue",
  }
}

variable "MAX_ITEM_SIZE" {
  type        = number
  default     = null
  description = "Max item size"
}

variable "SUBNETS" {
  type        = list(string)
  default     = []
  description = "AWS subnet ids"
}

variable "PARAMETER_GROUP_NAME" {
      type = string
      description = "name of Parameter Group"
      default = ""
}

variable "PARAMETERS" {
        type = list(object({
            name    = string
            value   = string
        }))
        description = "parameters for parameter group"
        default = []
}

variable "MAINTENANCE_WINDOW" {
  type        = string
  default     = "wed:03:00-wed:04:00"
  description = "Maintenance window"
}

variable "CLUSTER_SIZE" {
  type        = number
  default     = 1
  description = "Cluster size"
}

variable "INSTANCE_TYPE" {
  type        = string
  default     = ""
  description = "Elastic cache instance type"
}

variable "ENGINE" {
      type = string
      description = "engine name either redis or memcached"
      default = ""
}

variable "ENGINE_VERSION" {
  type        = string
  default     = ""
  description = "Memcached engine version. For more info, see https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/supported-engine-versions.html"
}

variable "SECURITY_GROUP_IDS" {
        type  = list(string)
        default = []
        description = "list of security group ids for elastic cache cluster"

}

variable "NOTIFICATION_TOPIC_ARN" {
  type        = string
  default     = ""
  description = "Notification topic arn"
}



variable "APPLY_IMMEDIATELY" {
  type        = bool
  default     = true
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
}

variable "CLUSTER_NAME" {
  type = string
  description = "name of elastic cache cluster"
  default = ""
}

variable "AVAILABILITY_ZONE" {
  type        = string
  default     = ""
  description = "The Availability Zone of the cluster. az_mode must be set to single-az when used."
}

variable "AVAILABILITY_ZONES" {
  type        = list(string)
  default     = []
  description = "List of Availability Zones for the cluster. az_mode must be set to cross-az when used."
}

variable "AZ_MODE" {
  type        = string
  default     = "single-az"
  description = "Enable or disable multiple AZs, eg: single-az or cross-az"
}

variable "PORT" {
  type        = number
  default     = 11211
  description = "Memcached port"
}

variable "SUBNET_GROUP_NAME" {
        type = string
        description = "name of Subnet Group"
        default = ""

}

variable "ELASTICACHE_PARAMETER_GROUP_FAMILY" {
  type        = string
  description = "ElastiCache parameter group family"
  default     =  ""
}

variable "LOG_DELIVERY_DESTINATION" {
        type = string
        description = "Name of either the CloudWatch Logs LogGroup or Kinesis Data Firehose resource"
        default = ""
}
variable "LOG_DELIVERY_DESTINATION_TYPE" {
      type = string
      description = "For CloudWatch Logs use cloudwatch-logs or for Kinesis Data Firehose use kinesis-firehose"
      default = ""
}
variable "LOG_FORMATE" {
  type = string
  description = "Valid values are json or text"
  default = "son"
}

variable "LOG_TYPE" {
      type = string
      description = "Valid values are slow-log or engine-log. Max 1 of each."
      default = ""
}

