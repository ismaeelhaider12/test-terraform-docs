#################
# eks logging
################

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



variable "TAGS" {
  default = {}
}

variable "CODEBUILD_ROLE_NAME" {
  type = string  
}

###########################################
############ FARGATE

variable "COMMON_TAGS" {}
variable "FARGATE_PROFILE" {}