#### Subnets Group
variable "SUBNET_IDS" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}
variable "FAMILY" {
  default = ""
}
variable "RDS_PARAMETERS" {
  default = []
}
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

variable "ALLOCATED_STORAGE" {
  description = "The allocated storage in gigabytes"
  type        = string
}

variable "STORAGE_TYPE" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  type        = string
  default     = "gp2"
}

variable "STORAGE_ENCRYPTED" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "KMS_KEY_ID" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  type        = string
  default     = ""
}

variable "SNAPSHOT_IDENTIFIER" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
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

variable "DOMAIN" {
  description = "The ID of the Directory Service Active Directory domain to create the instance in"
  type        = string
  default     = ""
}

variable "DOMAIN_IAM_ROLE_NAME" {
  description = "(Required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service"
  type        = string
  default     = ""
}

variable "ENGINE" {
  description = "The database engine to use"
  type        = string
}

variable "ENGINE_VERSION" {
  description = "The engine version to use"
  type        = string
}
variable "MAJOR_ENGINE_VERSION" {
  description = "The major engine version to use"
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

variable "USERNAME" {
  description = "Username for the master DB user"
  type        = string
}

variable "PASSWORD" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
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
  default     = true
}

variable "IOPS" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 1000
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
  default = ""
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
  default     = 1
}

variable "BACKUP_WINDOW" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
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

variable "MAX_ALLOCATED_STORAGE" {
  description = "Specifies the value for Storage Autoscaling"
  type        = number
  default     = 0
}

variable "RDS_OPTIONS" {
  default = []
}
