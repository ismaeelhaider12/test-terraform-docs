
variable "REGION" {
    type    = string
    default = ""
}
##################
#  logging
##################

variable "LOGS_RETENTION_IN_DAYS" {
      type  = number
      default =  null
}


###################
# eks cluster
###################

variable "CLUSTER_ROLE_ARN" {
      type = string
      default = ""  
}

variable "KMS_ARN" {
  type = string
  default = "" 
}
variable "SECURITY_GROUP_IDS" {

  type    = list(string)
  default = []
}
variable "CLUSTER_SUBNET_IDS" {
  type    = list(string)
  default = []
}

variable "ENDPOINT_PUBLIC_ACCESS" {
  type = bool
  description = "Whether the Amazon EKS public API server endpoint is enabled"
  default = true
  
}
variable "PUBLIC_ACCESS_CIDRS" {
      type = list(string)
      description = "List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled. EKS defaults this to a list with 0.0.0.0/0" 
      default = [ "0.0.0.0/0" ]
}
variable "ENDPOINT_PRIVATE_ACCESS" {
    type = bool
    description = "Whether the Amazon EKS private API server endpoint is enabled."
    default = false
}
variable "CLUSTER_NAME" {
  type    = string
  default = ""
}
variable "KUBERNETES_VERSION" {
  type    = string
  default = "1.21"
}

variable "LOGGING_TYPE" {
  type    = list(string)
  default = []
  description = "valid values are api,audit,authenticator,controllerManager,scheduler"
}

variable "CODEBUILD_ROLE_NAME" {
  type = string
  default = ""
}
###################
# eks Fargate Profile
###################

variable "FARGATE_PROFILE" {
  description = "list of variables to create fargate profile"
  type = list(object({
      fargate_profile_name   = string
      pod_execution_role_arn = string
      subnet_ids             = list(string)
      selector               = list(object({
            namespace = string
      }))
  }))
  default = []
}

variable "TAGS" {
  default = {
    "Enveronments" = "ComplianceX",
  }
}