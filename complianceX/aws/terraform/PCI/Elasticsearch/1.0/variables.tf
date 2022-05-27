variable "REGION" {
  type  = string
  default = ""
}

variable "TAGS" {
  default = {

    "TagKey" = "TagValue",
  }
}

variable "DOMAIN_NAME" {
    type = string
    default = ""
    description = "Name of the Elasticsearch domain."
  
}
variable "VPC_ENABLED" {
  type        = bool
  description = "Set to false if ES should be deployed outside of VPC."
  default     = true
}

variable "SECURITY_GROUP_IDS"{
        type    =   list(string)
        default = []
}


variable "SUBNET_IDS" {
  type        = list(string)
  description = "VPC Subnet IDs"
  default     = []
}

variable "ELASTICSEARCH_VERSION" {
  type        = string
  default     = ""
  description = "Version of Elasticsearch to deploy (_e.g._ `7.4`, `7.1`, `6.8`, `6.7`, `6.5`, `6.4`, `6.3`, `6.2`, `6.0`, `5.6`, `5.5`, `5.3`, `5.1`, `2.3`, `1.5`"
}

variable "INSTANCE_TYPE" {
  type        = string
  default     = ""
  description = "Elasticsearch instance type for data nodes in the cluster"
}

variable "INSTANCE_COUNT" {
  type        = number
  description = "Number of data nodes in the cluster"
  default     = 2
}

variable "WARM_ENABLED" {
  type        = bool
  default     = false
  description = "Whether AWS UltraWarm is enabled"
}

variable "WARM_COUNT" {
  type        = number
  default     = 2
  description = "Number of UltraWarm nodes"
}

variable "WARM_TYPE" {
  type        = string
  default     = ""
  description = "Type of UltraWarm nodes"
}

variable "ZONE_AWARENESS_ENABLED" {
  type        = bool
  default     = true
  description = "Enable zone awareness for Elasticsearch cluster"
}

variable "AVAILABILITY_ZONE_COUNT" {
  type        = number
  default     = 2
  description = "Number of Availability Zones for the domain to use."

}

variable "EBS_VOLUME_SIZE" {
  type        = number
  description = "EBS volumes for data storage in GB"
  default     = 10
}

variable "EBS_VOLUME_TYPE" {
  type        = string
  default     = "gp2"
  description = "Storage type of EBS volumes"
}

variable "EBS_IOPS" {
  type        = number
  default     = 0
  description = "The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type"
}

variable "ENCRYPT_AT_REST_ENABLED" {
  type        = bool
  default     = false
  description = "Whether to enable encryption at rest"
}

variable "ENCRYPT_AT_REST_KMS_KEY_ID" {
  type        = string
  default     = ""
  description = "The KMS key ID to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key"
}

variable "AUTOMATED_SNAPSHOT_START_HOUR" {
  type        = number
  description = "Hour at which automated snapshots are taken, in UTC"
  default     = 0
}

variable "DEDICATED_MASTER_ENABLED" {
  type        = bool
  default     = false
  description = "Indicates whether dedicated master nodes are enabled for the cluster"
}

variable "DEDICATED_MASTER_COUNT" {
  type        = number
  description = "Number of dedicated master nodes in the cluster"
  default     = 0
}

variable "DEDICATED_MASTER_TYPE" {
  type        = string
  default     = ""
  description = "Instance type of the dedicated master nodes in the cluster"
}

variable "ADVANCED_OPTIONS" {

  default = {}
  description = "Key-value string pairs to specify advanced configuration options"
}


variable "NODE_TO_NODE_ENCRYPTION_ENABLED" {
  type        = bool
  default     = false
  description = "Whether to enable node-to-node encryption"
}



variable "COGNITO_AUTHENTICATION_ENABLED" {
  type        = bool
  default     = false
  description = "Whether to enable Amazon Cognito authentication with Kibana"
}

variable "COGNITO_USER_POOL_ID" {
  type        = string
  default     = ""
  description = "The ID of the Cognito User Pool to use"
}

variable "COGNITO_IDENTITY_POOL_ID" {
  type        = string
  default     = ""
  description = "The ID of the Cognito Identity Pool to use"
}

variable "COGNITO_IAM_ROLE_ARN" {
  type        = string
  default     = ""
  description = "ARN of the IAM role that has the AmazonESCognitoAccess policy attached"
}

variable "ADVANCED_SECURITY_OPTION" {
      type  = list(object({
          enabled = bool
          internal_user_database_enabled  = bool
          master_user_options = object({
              master_user_arn     = string
              master_user_name    = string
              master_user_password  = string
          })
  }))

    default = []
}


variable "EBS_OPTIONS" {
      type  = list(object({

        ebs_enabled = bool
        volume_size = number
        volume_type = string
        iops        = number
      }))

      default = []
}

variable "CLUSTER_CONFIGURATION" {
    type  = list(object({
          instance_count           = number 
          instance_type            = string
          dedicated_master_enabled = bool
          dedicated_master_count   = number
          dedicated_master_type    = string
          zone_awareness_enabled   = bool
          warm_enabled             = bool
          warm_count               = number
          warm_type               = string
          zone_awareness_config = object({
              availability_zone_count = number
          })
    }))
    default = []
    }

variable "LOG_PUBLISHING_OPTIONS" {
        type = list(object({
          log_type            = string
          cloudwatch_log_group_arn = string
        }))

        default = []
    }


variable "ELASTIC_SEARCH_POLICY_ACTIONS" {
    type  = list(string)
    default = []
}

variable "ELASTIC_SEARCH_POLICY_PRINCIPAL" {
    type = list(object({
        type  = string
        identifiers = list(string)
    }))
    default = []
}

variable "DOMAIN_ENDPOINT_OPTIONS" {
        type = list(object({
            enforce_https                   = bool
            tls_security_policy             = string
            custom_endpoint_enabled         = bool
            custom_endpoint                 = string
            custom_endpoint_certificate_arn = string
        }))

        default = []
}

