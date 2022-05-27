
variable "REGION" {
  default = ""
  type = string
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
variable "IDENTIFIER" {
  type = string
  default = ""
}
variable "MASTER_USERNAME" {
  type = string
  default = ""
}
variable "MASTER_PASSWORD" {
  type = string
  default = ""
}
variable "NAME" {
  type = string
  default = ""
}
variable "ENGINE" {
  type = string
  default = ""
}
variable "ENGINE_VERSION" {
  type = string
  default = ""
}
variable "FAMILY" {
  type = string
  default = ""
}
variable "SUBNET_IDS" {
  type = list(string)
  default = []
}
variable "ENGINE_MODE" {
  type = string
  default = ""
}
variable "SECURITY_GROUP_IDS" {
  type = list(string)
  default = []
}
variable "RDS_ENHANCED_MONITORING_ROLE_ARN" {
  type = string
  default = ""
}
variable "REPLICA_COUNT" {
  type = number
  default = 2
}
variable "REPLICA_SCALE_ENABLED" {
  type = bool
  default = true
}
variable "REPLICA_SCALE_MAX" {
  type = number
  default = 1
}
variable "REPLICA_SCALE_MIN" {
  type = number
  default = 1
}
variable "AURORA_INSTANCE_TYPE" {
  type = string
  default = ""
}
variable "AURORA_SCALING_CONFIGURATION" {
  description = "Map of nested attributes with scaling properties. Only valid when engine_mode is set to `serverless`"
  type = object({
    auto_pause               = bool
    min_capacity             = number
    max_capacity             = number
    seconds_until_auto_pause = number
    timeout_action           = string
  })
  default = {
    auto_pause               = null
    min_capacity             = null
    max_capacity             = null
    seconds_until_auto_pause = null
    timeout_action           = "RollbackCapacityChange"
  }
}

variable "AURORA_PARAMETER" {
  type = list(object({
    name = string
    value = string
  }))
  default = []
}

variable "PERFORMANCE_INSIGHTS_ENABLED" {
  type = bool
  default = true
}

variable "KMS_KEY_ID" {
  default = ""
  type = string
}

variable "AURORA_MONITORING_INTERVAL" {
  default = 0
  type = number  
}

variable "PUBLICLY_ACCESSIBLE" {
  default = false
  type = bool  
}

variable "DATABASE_NAME" {
  description = "Name for an automatically created database on cluster creation"
  type        = string
  default     = ""
}
variable "SKIP_FINAL_SNAPSHOT" {
  description = "Should a final snapshot be created on cluster destroy"
  type        = bool
  default     = true
}
variable "DELETION_PROTECTION" {
  description = "If the DB instance should have deletion protection enabled"
  type        = bool
  default     = false
}
variable "BACKUP_RETENTION_PERIOD" {
  description = "How long to keep backups for (in days)"
  type        = number
  default     = 7
}
variable "PREFERRED_BACKUP_WINDOW" {
  description = "When to perform DB backups"
  type        = string
  default     = "02:00-03:00"
}
variable "PREFERRED_MAINTENANCE_WINDOW" {
  description = "When to perform DB maintenance"
  type        = string
  default     = "sun:05:00-sun:06:00"
}
variable "APPLY_IMMEDIATELY" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window"
  type        = bool
  default     = true
}
variable "AUTO_MINOR_VERSION_UPGRADE" {
  description = "Determines whether minor engine upgrades will be performed automatically in the maintenance window"
  type        = bool
  default     = true
}
variable "SNAPSHOT_IDENTIFIER" {
  description = "DB snapshot to create this database from"
  type        = string
  default     = null
}
variable "ENABLE_HTTP_ENDPOINT" {
  description = "Whether or not to enable the Data API for a serverless Aurora database engine."
  type        = bool
  default     = false
}
variable "REPLICA_SCALE_CPU" {
  description = "CPU usage to trigger autoscaling at"
  type        = number
  default     = 70
}
variable "IAM_DATABASE_AUTHENTICATION_ENABLED" {
  description = "Specifies whether IAM Database authentication should be enabled or not. Not all versions and instances are supported. Refer to the AWS documentation to see which versions are supported."
  type        = bool
  default     = false
}
variable "ENABLED_CLOUDWATCH_LOGS_EXPORTS" {
  description = "List of log types to export to cloudwatch"
  type        = list(string)
  default     = []
}
variable "AURORA_REPLICATION_SOURCE_IDENTIFIER" {
  description = "ARN of a source DB cluster or DB instance if this DB cluster is to be created as a Read Replica."
  type        = string
  default     = null
}
variable "COPY_TAGS_TO_SNAPSHOT" {
  description = "Copy all Cluster tags to snapshots."
  type        = bool
  default     = false
}