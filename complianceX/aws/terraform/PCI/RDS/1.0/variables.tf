
variable "REGION" {
  default = ""
  type = string
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
variable "MONITORING_ROLE_ARN" {
  type = string
  default = null
}
variable "IDENTIFIER" {
  type = string
  default = ""
}
variable "ENGINE" {
  type = string
  default = ""
}
variable "PERFORMANCE_INSIGHTS_ENABLED" {
  type = bool
  default = true
}
variable "SUBNET_IDS" {
  type = list(string)
  default = []
}
variable "SECURITY_GROUP_IDS" {
  type = list(string)
  default = []
}
variable "KMS_KEY_ARN" {
  type = string
  default = ""
}
variable "PERFORMANCE_INSIGHTS_RETENTION_PERIOD" {
  type = number
  default = 7
}
variable "MAJOR_ENGINE_VERSION" {
  type = string
  default = null
}
variable "ENGINE_VERSION" {
  type = string
  default = ""
}
variable "INSTANCE_CLASS" {
  type = string
  default = ""
}
variable "NAME" {
  type = string
  default = ""
}
variable "USERNAME" {
  type = string
  default = ""
}
variable "PASSWORD" {
  type = string
  default = ""
}
variable "PORT" {
  type = string
  default = ""
}
variable "MAINTENANCE_WINDOW" {
  type = string
  default = "Mon:00:00-Mon:03:00"
}
variable "BACKUP_WINDOW" {
  type = string
  default = "09:46-10:16"
}
variable "STORAGE_TYPE" {
  type = string
  default = "gp2"
}
variable "FAMILY" {
  type = string
  default = ""
}
variable "BACKUP_RETENTION_PERIOD" {
  type = number
  default = 7
}
variable "ALLOCATED_STORAGE" {
  type = number
  default = 20
}
variable "MAX_ALLOCATED_STORAGE" {
  type = number
  default = 25
}
variable "IOPS" {
  type = number
  default = 100
}
variable "PUBLICLY_ACCESSIBLE" {
  type = bool
  default = false
}
variable "SKIP_FINAL_SNAPSHOT" {
  type = bool
  default = true
}
variable "FINAL_SNAPSHOT_IDENTIFIER" {
  type = string
  default = null
}
variable "DELETE_AUTOMATED_BACKUPS" {
  type = bool
  default = true
}
variable "DELETION_PROTECTION" {
  type = bool
  default = false
}
variable "RDS_PARAMETERS" {
  type = list(object({
    name = string
    value = string
  }))
  default = []
}
variable "RDS_OPTIONS" {
  type = list(object({
    option_name = string
    option_settings = list(object({
      name = string
      value = string
    }))
  }))
  default = []  
}

variable "SNAPSHOT_IDENTIFIER" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  type        = string
  default     = null
}
variable "LICENSE_MODEL" {
  description = "License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  type        = string
  default     = null
}
variable "IAM_DATABASE_AUTHENTICATION_ENABLED" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type        = bool
  default     = false
}
variable "DOMAIN" {
  description = "The ID of the Directory Service Active Directory domain to create the instance in"
  type        = string
  default     = null
}
variable "DOMAIN_IAM_ROLE_NAME" {
  description = "(Required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service"
  type        = string
  default     = null
}
variable "MULTI_AZ" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = true
}
variable "MONITORING_INTERVAL" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = number
  default     = 0
}
variable "ALLOW_MAJOR_VERSION_UPGRADE" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}
variable "AUTO_MINOR_VERSION_UPGRADE" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}
variable "APPLY_IMMEDIATELY" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = true
}
variable "COPY_TAGS_TO_SNAPSHOT" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  type        = bool
  default     = true
}
variable "ENABLED_CLOUDWATCH_LOGS_EXPORTS" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  type        = list(string)
  default     = []
}
