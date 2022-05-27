variable "REGION" {
    type = string
    default = ""
}

variable "CLUSTER_IDENTIFIER" {
  type        = string
  default     = ""
  description = "The Redshift Cluster Identifier. Must be a lower case string. Will use generated label ID if not supplied"
}

variable "DATABASE_NAME" {
  type        = string
  default     = ""
  description = "The name of the first database to be created when the cluster is created"
}

variable "ADMIN_USER" {
  type        = string
  default     = ""
  description = "(Required unless a snapshot_identifier is provided) Username for the master DB user"
}

variable "ADMIN_PASSWORD" {
  type        = string
  default     = ""
  description = "(Required unless a snapshot_identifier is provided) Password for the master DB user"
}

variable "NODE_TYPE" {
  type        = string
  default     = "dc2.large"
  description = "The node type to be provisioned for the cluster. See https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#working-with-clusters-overview"
}

variable "CLUSTER_TYPE" {
  type        = string
  default     = "single-node"
  description = "The cluster type to use. Either `single-node` or `multi-node`"
}

variable "REDSHIFT_SUBNET_GROUP_NAME" {
  type = string
  default = ""
  description = "The Cluster Subnet Group Name"
}

variable "SUBNET_IDS" {
  type        = list(string)
  description = "List of VPC subnet IDs"
  default = [ ]
}

variable "VPC_SECURITY_GROUPS" {
  type        = list(string)
  default     = []
  description = "A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster. Used for EC2-VPC platform"
}

variable "AVAILABILLITY_ZONE" {
  type        = string
  default     = null
  description = "Optional parameter to place Amazon Redshift cluster instances in a specific availability zone. If left empty, will place randomly"
}

variable "PREFERRED_MAINTENANCE_WINDOW" {
  type        = string
  default     = null
  description = "Weekly time range during which system maintenance can occur, in UTC. Format: ddd:hh24:mi-ddd:hh24:mi"
}

variable "REDSHIFT_PARAMETER_GROUP_NAME" {
      type  = string
      default = ""
      description = "Name for Clusters parameter group" 
}

variable "PARAMETER_GROUP_FAMILY" {
      type = string
      default = "redshift-1.0"
      description = "The family of the Redshift parameter group"

  
}

variable "CLUSTER_PARAMETERS" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "List of Redshift parameters to apply"
}

variable "AUTOMATED_SNAPSHOT_RETENTION_PERIOD" {
  type        = number
  default     = 0
  description = "The number of days that automated snapshots are retained. If the value is 0, automated snapshots are disabled"
}

variable "PORT" {
  type        = number
  default     = 5439
  description = "The port number on which the cluster accepts incoming connections"
}

variable "ENGINE_VERSION" {
  type        = string
  default     = "1.0"
  description = "The version of the Amazon Redshift engine to use"
}

variable "NODES" {
  type        = number
  default     = 1
  description = "The number of compute nodes in the cluster. This parameter is required when the ClusterType parameter is specified as multi-node"
}

variable "PUBLICLY_ACCESSIBLE" {
  type        = bool
  default     = true
  description = "If true, the cluster can be accessed from a public network"
}

variable "ENCRYPTED" {
  type        = bool
  description = "Specifies whether the cluster is encrypted at rest"
  default     = true
}

variable "ENHANCED_VPC_ROUTING" {
  type        = bool
  description = "If true , enhanced VPC routing is enabled"
  default     = false
}

variable "KMS_KEY_ARN" {
  type        = string
  description = "The ARN for the KMS encryption key. When specifying `kms_key_arn`, `encrypted` needs to be set to `true`"
  default     = ""
}

variable "ELASTIC_IP" {
  type        = string
  default     = null
  description = "The Elastic IP (EIP) address for the cluster"
}

variable "SKIP_FINAL_SNAPSHOT" {
  type        = bool
  default     = true
  description = "Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the cluster"
}

variable "FINAL_SNAPSHOT_IDENTIFIER" {
  type        = string
  default     = null
  description = "The identifier of the final snapshot that is to be created immediately before deleting the cluster. If this parameter is provided, `skip_final_snapshot` must be `false`"
}

variable "SNAPSHOT_IDENTIFIER" {
  type        = string
  default     = null
  description = "The name of the snapshot from which to create the new cluster"
}

variable "SNAPSHOT_CLUSTER_IDENTIFIER" {
  type        = string
  default     = null
  description = "The name of the cluster the source snapshot was created from"
}

variable "OWNER_ACCOUNT" {
  type        = string
  default     = null
  description = "The AWS customer account used to create or copy the snapshot. Required if you are restoring a snapshot you do not own, optional if you own the snapshot"
}



variable "IAM_ROLES" {
  type        = list(string)
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time"
  default     = []
}

variable "LOGGING" {
  type        = bool
  default     = false
  description = "If true, enables logging information such as queries and connection attempts, for the specified Amazon Redshift cluster"
}

variable "LOGGING_BUCKET_NAME" {
  type        = string
  default     = null
  description = "The name of an existing S3 bucket where the log files are to be stored. Must be in the same region as the cluster and the cluster must have read bucket and put object permissions"
}

variable "LOGGING_S3_KEY_PREFIX" {
  type        = string
  default     = null
  description = "The prefix applied to the log file names"
}

variable "DEFAULT_SECURITY_GROUP" {
  type        = bool
  default     = true
  description = "Specifies whether or not to create default security group for The Amazon Redshift cluster"
}

variable "TAGS" {
  default = {

    "key-name" = "key-value",
  }
}