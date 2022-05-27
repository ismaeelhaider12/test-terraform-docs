
variable "COMMON_TAGS" {
  default = {}
}
variable "TAGS" {
  default = {}
}
variable "CREATE" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "IDENTIFIER" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
}

variable "KMS_KEY_ID" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  type        = string
  default     = null
}

variable "SOURCE_DB_IDENTIFIER" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate."
  type        = string
  default     = ""
}

variable "LICENSE_MODEL" {
  description = "License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  type        = string
  default     = ""
}

variable "IAM_DATABASE_AUTHENTICATION_ENABLED" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type        = bool
  default     = false
}

variable "ENGINE" {
  description = "The database engine to use"
  type        = string
}

variable "ENGINE_VERSION" {
  description = "The engine version to use"
  type        = string
}

variable "INSTANCE_CLASS" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "NAME" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = ""
}

variable "PORT" {
  description = "The port on which the DB accepts connections"
  type        = string
}

variable "FINAL_SNAPSHOT_IDENTIFIER" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  type        = string
  default     = null
}

variable "SECURITY_GROUP_IDS" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}


variable "AVAILABILITY_ZONE" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = ""
}

variable "MULTI_AZ" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}

variable "PUBLICLY_ACCESSIBLE" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

variable "MONITORING_INTERVAL" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = number
  default     = 0
}

variable "MONITORING_ROLE_ARN" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero."
  type        = string
  default     = ""
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

variable "MAINTENANCE_WINDOW" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default = "Mon:00:00-Mon:03:00"
}

variable "SKIP_FINAL_SNAPSHOT" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "COPY_TAGS_TO_SNAPSHOT" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  type        = bool
  default     = true
}

variable "BACKUP_RETENTION_PERIOD" {
  description = "The days to retain backups for"
  type        = number
  default     = 0
}

variable "BACKUP_WINDOW" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
  default     = null 
}

variable "RDS_READ_REPLICA_OPTIONS" {
  description = "Name of the DB option group to associate."
  default     = []
}

variable "CHARACTER_SET_NAME" {
  description = "(Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS for more information"
  type        = string
  default     = ""
}

variable "ENABLED_CLOUDWATCH_LOGS_EXPORTS" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)."
  type        = list(string)
  default     = []
}

variable "TIMEOUTS" {
  description = "(Optional) Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times"
  type        = map(string)
  default = {
    create = "40m"
    update = "80m"
    delete = "40m"
  }
}

variable "DELETION_PROTECTION" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}

variable "PERFORMANCE_INSIGHTS_ENABLED" {
  description = "Specifies whether Performance Insights are enabled"
  type        = bool
  default     = true
}
variable "PERFORMANCE_INSIGHTS_RETENTION_PERIOD" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
  type        = number
  default     = 7
}
variable "CA_CERT_IDENTIFIER" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  type        = string
  default     = "rds-ca-2019"
}

variable "DELETE_AUTOMATED_BACKUPS" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = true
}
variable "MAJOR_ENGINE_VERSION" {
  default = ""
}