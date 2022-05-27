
variable "CREATE_CLUSTER" {
  default = true
}
###################
# LaunchTemplate
###################


variable "IMAGE_ID" {}
variable "KEY_NAME" {}
variable "ASSOCIATE_PUBLIC_IP_ADDRESS" {}
variable "EBS_OPTIMIZED" {
  default = false
}
variable "USER_DATA" {}
variable "ENABLE_MONITORING" {
  default = false
}
variable "DISABLE_API_TERMINATION" {
  default     = false
}
variable "TEMPLATE_NAME" {
  type        = string
}
variable "EBS_BLOCK_DEVICE" {}

#################
# eks logging
################
#variable "LOG_GROUP_NAME" {}
variable "LOGS_RETENTION_IN_DAYS" {}

###################
# eks cluster
###################

variable "SECURITY_GROUP_IDS" {
  type = list(string)
}
variable "CLUSTER_SUBNET_IDS" {
  type = list(string)
}
variable "ENDPOINT_PRIVATE_ACCESS" {}
variable "ENDPOINT_PUBLIC_ACCESS" {}
variable "PUBLIC_ACCESS_CIDRS" {}
variable "CLUSTER_ROLE_ARN" {}
variable "KMS_ARN" {
  
}
variable "CLUSTER_NAME" {
  type = string
}
variable "KUBERNETES_VERSION" {
  type = string
}

variable "LOGGING_TYPE" {
  type = list(string)
}


###################
# eks Node Group
###################

variable "NODE_ROLE_ARN" {} 

variable "DESIRED_CAPACITY" {

}
variable "NODE_GROUP_SUBNET_IDS" {
  
}
variable "MAX_SIZE" {

}

variable "MIN_SIZE" {

}

variable "NODE_INSTANCE_TYPE" {}

variable "AMI_TYPE" {}
variable "CAPACITY_TYPE" {}


variable "INSTANCE_TAGS" {}


variable "ALB_INGRESS_POLICY_ARN" {}

variable "CODEBUILD_ROLE_NAME" {
  type = string  
}

variable "TAGS" {
  default = {}
}
variable "COMMON_TAGS" {}
