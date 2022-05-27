variable "REGION" {
    type = string
    default = ""
}

variable "TAGS" {
  default = {

    "key-name" = "key-value",
  }
}

variable "TABLE_NAME" {
      type = string
      description = "Name of DynamoDB table"
      default = ""
}

variable "AUTOSCALE_WRITE_TARGET" {
  type        = number
  default     = 50
  description = "The target value (in %) for DynamoDB write autoscaling"
}

variable "AUTOSCALE_READ_TARGET" {
  type        = number
  default     = 50
  description = "The target value (in %) for DynamoDB read autoscaling"
}

variable "AUTOSCALE_MIN_READ_CAPACITY" {
  type        = number
  default     = 5
  description = "DynamoDB autoscaling min read capacity"
}

variable "AUTOSCALE_MAX_READ_CAPACITY" {
  type        = number
  default     = 20
  description = "DynamoDB autoscaling max read capacity"
}

variable "AUTOSCALE_MIN_WRITE_CAPACITY" {
  type        = number
  default     = 5
  description = "DynamoDB autoscaling min write capacity"
}

variable "AUTOSCALE_MAX_WRITE_CAPACITY" {
  type        = number
  default     = 20
  description = "DynamoDB autoscaling max write capacity"
}

variable "BILLING_MODE" {
  type        = string
  default     = "PROVISIONED"
  description = "DynamoDB Billing mode. Can be PROVISIONED or PAY_PER_REQUEST"
}

variable "ENABLE_STREAMS" {
  type        = bool
  default     = false
  description = "Enable DynamoDB streams"
}

variable "STREAM_VIEW_TYPE" {
  type        = string
  default     = ""
  description = "When an item in the table is modified, what information is written to the stream"
}

variable "ENABLE_ENCRYPTION" {
  type        = bool
  default     = true
  description = "Enable DynamoDB server-side encryption"
}

variable "SERVER_SIDE_ENCRYPTION_KMS_KEY_ARN" {
  type        = string
  default     = null
  description = "The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb."
}

variable "ENABLE_POINT_IN_TIME_RECOVERY" {
  type        = bool
  default     = true
  description = "Enable DynamoDB point in time recovery"
}

variable "HASH_KEY" {
  type        = string
  description = "DynamoDB table Hash Key"
  default = ""
}

variable "HASH_KEY_TYPE" {
  type        = string
  default     = ""
  description = "Hash Key type, which must be a scalar type: `S`, `N`, or `B` for (S)tring, (N)umber or (B)inary data"
}

variable "RANGE_KEY" {
  type        = string
  default     = ""
  description = "DynamoDB table Range Key"
}

variable "RANGE_KEY_TYPE" {
  type        = string
  default     = ""
  description = "Range Key type, which must be a scalar type: `S`, `N`, or `B` for (S)tring, (N)umber or (B)inary data"
}

variable "TTL_ATTRIBUTE" {
  type        = string
  default     = "Expires"
  description = "DynamoDB table TTL attribute"
}

variable "TTL_ENABLED" {
  type        = bool
  default     = true
  description = "Set to false to disable DynamoDB table TTL"
}

variable "DYNAMODB_ATTRIBUTES" {
  type = list(object({
    name = string
    type = string
  }))
  default     = []
  description = "Additional DynamoDB attributes in the form of a list of mapped values"
}

variable "GLOBAL_SECONDARY_INDEX_MAP" {
  type = list(object({
    hash_key           = string
    name               = string
    non_key_attributes = list(string)
    projection_type    = string
    range_key          = string
    read_capacity      = number
    write_capacity     = number
  }))
  default     = []
  description = "Additional global secondary indexes in the form of a list of mapped values"
}

variable "LOCAL_SECONDARY_INDEX_MAP" {
  type = list(object({
    name               = string
    non_key_attributes = list(string)
    projection_type    = string
    range_key          = string
  }))
  default     = []
  description = "Additional local secondary indexes in the form of a list of mapped values"
}

variable "REPLICAS" {
  type        = list(string)
  default     = []
  description = "List of regions to create replica"
}

variable "TABLE_AUTOSCALING_ENABLED" {
      type = bool
      default = true
      description = "Do you want to enable autoscaling for Dynamodb table"
}

variable "AUTOSCALE_MAX_READ_CAPACITY_INDEX" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling max read capacity of the index"
}

variable "AUTOSCALE_MIN_READ_CAPACITY_INDEX" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling min read capacity of the index"
}

variable "AUTOSCALE_READ_TARGET_INDEX" {
  type        = number
  default     = null
  description = "The target value for DynamoDB read autoscaling of the index"
}

variable "AUTOSCALE_MAX_WRITE_CAPACITY_INDEX" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling max write capacity of the index"
}

variable "AUTOSCALE_MIN_WRITE_CAPACITY_INDEX" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling min write capacity of the index"
}

variable "AUTOSCALE_WRITE_TARGET_INDEX" {
  type        = number
  default     = null
  description = "The target value for DynamoDB write autoscaling of the index"
} 
