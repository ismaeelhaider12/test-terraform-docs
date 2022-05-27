variable "COMMON_TAGS" {
  default = {}
}
variable "TAGS" {
  default = {}
}
variable "RDS_ENHANCED_MONITORING_ROLE_ARN" {
  default = ""
}
variable "MASTER_PASSWORD" {
  default = ""
}
variable "CREATE_CLUSTER" {
  description = "Controls if RDS cluster should be created (it affects almost all resources)"
  type        = bool
  default     = true
}
variable "NAME" {
  description = "Name given resources"
  type        = string
  default     = ""
}
variable "SUBNET_IDS" {
  description = "List of subnet IDs to use"
  type        = list(string)
  default     = []
}
variable "REPLICA_COUNT" {
  description = "Number of reader nodes to create.  If `replica_scale_enable` is `true`, the value of `replica_scale_min` is used instead."
  type        = number
  default     = 1
}
variable "INSTANCE_TYPE_REPLICA" {
  description = "Instance type to use at replica instance"
  type        = string
  default     = null
}
variable "AURORA_INSTANCE_TYPE" {
  description = "Instance type to use at master instance. If instance_type_replica is not set it will use the same type for replica instances"
  type        = string
  default     = ""
}
variable "PUBLICLY_ACCESSIBLE" {
  description = "Whether the DB should have a public IP address"
  type        = bool
  default     = false
}
variable "DATABASE_NAME" {
  description = "Name for an automatically created database on cluster creation"
  type        = string
  default     = ""
}
variable "MASTER_USERNAME" {
  description = "Master DB username"
  type        = string
  default     = "root"
}
variable "FINAL_SNAPSHOT_IDENTIFIER_PREFIX" {
  description = "The prefix name to use when creating a final snapshot on cluster destroy, appends a random 8 digits to name to ensure it's unique too."
  type        = string
  default     = "final"
}
variable "SKIP_FINAL_SNAPSHOT" {
  description = "Should a final snapshot be created on cluster destroy"
  type        = bool
  default     = false
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

variable "PORT" {
  description = "The port on which to accept connections"
  type        = string
  default     = ""
}

variable "APPLY_IMMEDIATELY" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window"
  type        = bool
  default     = true
}

variable "AURORA_MONITORING_INTERVAL" {
  description = "The interval (seconds) between points when Enhanced Monitoring metrics are collected"
  type        = number
  default     = 0
}

variable "AUTO_MINOR_VERSION_UPGRADE" {
  description = "Determines whether minor engine upgrades will be performed automatically in the maintenance window"
  type        = bool
  default     = true
}
variable "FAMILY" {}
variable "AURORA_PARAMETER" {}

variable "AURORA_SCALING_CONFIGURATION" {
  description = "Map of nested attributes with scaling properties. Only valid when engine_mode is set to `serverless`"
  type        = map(string)
  default     = {}
}
variable "SNAPSHOT_IDENTIFIER" {
  description = "DB snapshot to create this database from"
  type        = string
  default     = ""
}
variable "STORAGE_ENCRYPTED" {
  description = "Specifies whether the underlying storage layer should be encrypted"
  type        = bool
  default     = true
}

variable "KMS_KEY_ID" {
  description = "The ARN for the KMS encryption key if one is set to the cluster."
  type        = string
  default     = ""
}

variable "ENGINE" {
  description = "Aurora database engine type, currently aurora, aurora-mysql or aurora-postgresql"
  type        = string
  default     = "aurora"
}

variable "ENGINE_VERSION" {
  description = "Aurora database engine version."
  type        = string
  default     = "5.6.10a"
}

variable "ENABLE_HTTP_ENDPOINT" {
  description = "Whether or not to enable the Data API for a serverless Aurora database engine."
  type        = bool
  default     = false
}

variable "REPLICA_SCALE_ENABLED" {
  description = "Whether to enable autoscaling for RDS Aurora (MySQL) read replicas"
  type        = bool
  default     = false
}

variable "REPLICA_SCALE_MAX" {
  description = "Maximum number of replicas to allow scaling for"
  type        = number
  default     = 0
}

variable "REPLICA_SCALE_MIN" {
  description = "Minimum number of replicas to allow scaling for"
  type        = number
  default     = 2
}

variable "REPLICA_SCALE_CPU" {
  description = "CPU usage to trigger autoscaling at"
  type        = number
  default     = 70
}

variable "REPLICA_SCALE_CONNECTIONS" {
  description = "Average number of connections to trigger autoscaling at. Default value is 70% of db.r4.large's default max_connections"
  type        = number
  default     = 700
}

variable "REPLICA_SCALE_IN_COOLDOWN" {
  description = "Cooldown in seconds before allowing further scaling operations after a scale in"
  type        = number
  default     = 300
}

variable "REPLICA_SCALE_OUT_COOLDOWN" {
  description = "Cooldown in seconds before allowing further scaling operations after a scale out"
  type        = number
  default     = 300
}

variable "PERFORMANCE_INSIGHTS_ENABLED" {
  description = "Specifies whether Performance Insights is enabled or not."
  type        = bool
  default     = true
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

variable "GLOBAL_CLUSTER_IDENTIFIER" {
  description = "The global cluster identifier specified on aws_rds_global_cluster"
  type        = string
  default     = ""
}

variable "ENGINE_MODE" {
  description = "The database engine mode. Valid values: global, parallelquery, provisioned, serverless, multimaster."
  type        = string
  default     = "provisioned"
}

variable "AURORA_REPLICATION_SOURCE_IDENTIFIER" {
  description = "ARN of a source DB cluster or DB instance if this DB cluster is to be created as a Read Replica."
  type        = string
  default     = ""
}

variable "AURORA_SOURCE_REGION" {
  description = "The source region for an encrypted replica DB cluster."
  type        = string
  default     = ""
}

variable "SECURITY_GROUP_IDS" {
  description = "List of VPC security groups to associate to the cluster in addition to the SG we create in this module"
  type        = list(string)
  default     = []
}

variable "DB_SUBNET_GROUP_NAME" {
  description = "The existing subnet group name to use"
  type        = string
  default     = ""
}

variable "PREDEFINED_METRIC_TYPE" {
  description = "The metric type to scale on. Valid values are RDSReaderAverageCPUUtilization and RDSReaderAverageDatabaseConnections."
  type        = string
  default     = "RDSReaderAverageCPUUtilization"
}

variable "BACKTRACK_WINDOW" {
  description = "The target backtrack window, in seconds. Only available for aurora engine currently. To disable backtracking, set this value to 0. Defaults to 0. Must be between 0 and 259200 (72 hours)"
  type        = number
  default     = 0
}

variable "COPY_TAGS_TO_SNAPSHOT" {
  description = "Copy all Cluster tags to snapshots."
  type        = bool
  default     = false
}

variable "IAM_ROLES" {
  description = "A List of ARNs for the IAM roles to associate to the RDS Cluster."
  type        = list(string)
  default     = []
}

variable "CA_CERT_IDENTIFIER" {
  description = "The identifier of the CA certificate for the DB instance"
  type        = string
  default     = "rds-ca-2019"
}

variable "INSTANCES_PARAMETERS" {
  description = "Customized instance settings. Supported keys: instance_name, instance_type, instance_promotion_tier, publicly_accessible"
  type        = list(map(string))
  default     = []
}

variable "IDENTIFIER" {}