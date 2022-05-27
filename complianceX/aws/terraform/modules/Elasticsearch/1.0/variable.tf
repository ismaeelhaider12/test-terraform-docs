variable "DOMAIN_NAME" {}

variable "ELASTICSEARCH_VERSION" {}

variable "ADVANCED_OPTIONS" {}

variable "EBS_VOLUME_SIZE" {}

variable "EBS_VOLUME_TYPE" {}

variable "EBS_IOPS" {}

variable "ENCRYPT_AT_REST_ENABLED" {}

variable "ENCRYPT_AT_REST_KMS_KEY_ID" {}

variable "INSTANCE_COUNT" {}

variable "INSTANCE_TYPE" {}

variable "DEDICATED_MASTER_ENABLED" {}

variable "DEDICATED_MASTER_COUNT" {}

variable "DEDICATED_MASTER_TYPE" {}

variable "ZONE_AWARENESS_ENABLED" {}

variable "WARM_ENABLED" {}

variable "WARM_COUNT" {}

variable "WARM_TYPE" {}

variable "AVAILABILITY_ZONE_COUNT" {}

variable "NODE_TO_NODE_ENCRYPTION_ENABLED" {}

variable "VPC_ENABLED" {}

variable "SECURITY_GROUP_IDS" {}

variable "SUBNET_IDS" {}

variable "AUTOMATED_SNAPSHOT_START_HOUR" {}

variable "COGNITO_AUTHENTICATION_ENABLED" {}

variable "COGNITO_USER_POOL_ID" {}

variable "COGNITO_IDENTITY_POOL_ID" {}

variable "COGNITO_IAM_ROLE_ARN" {}

variable "COMMON_TAGS" {}

variable "TAGS" {}

variable "VERSION" {
  default = "2012-10-17"
}

variable "ADVANCED_SECURITY_OPTION" {}

variable "EBS_OPTIONS" {}

variable "CLUSTER_CONFIGURATION" {}

variable "LOG_PUBLISHING_OPTIONS" {} 

variable "ELASTIC_SEARCH_POLICY_ACTIONS" {}

variable "DOMAIN_ENDPOINT_OPTIONS" {}

variable "ELASTIC_SEARCH_POLICY_PRINCIPAL" {}