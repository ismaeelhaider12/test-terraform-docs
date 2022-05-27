variable "REGION" {
    type    = string
    default = ""
}
###################
# LaunchTemplate
###################

variable "IMAGE_ID" {
  default = ""
  type = string
  description = "AMI id to be used in launch template"
}
variable "TEMPLATE_NAME" {
  default = ""
  type = string
  description = "Provide name for launch template which is used for node creation"
}

variable "KEY_NAME" {
  default = ""
  type = string
}

variable "ASSOCIATE_PUBLIC_IP_ADDRESS" {
  default = true
  type = bool
}
variable "USER_DATA" {
  type = string
  default = ""
}

variable "EBS_BLOCK_DEVICE" {
  type = list(object({
    device_name = string
    ebs = object({
    delete_on_termination = bool
    volume_type = string
    kms_key_id  = string
    volume_size = number
    })
  }))
  default = []
}
##################
#  logging
##################

variable "LOGS_RETENTION_IN_DAYS" {
      type  = number
      default =  7
}


###################
# eks cluster
###################

variable "CREATE_CLUSTER" {
  type = bool
  default = true  
}
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

###################
# eks Node Group
###################

variable "NODE_ROLE_ARN" {
        type = string
        default = "" 
}
variable "DESIRED_CAPACITY" {
  type    = number
  default = 1
}

variable "MAX_SIZE" {
  type    = number
  default = 1
}

variable "MIN_SIZE" {
  type    = number
  default = 1
}

variable "NODE_INSTANCE_TYPE" {
  type    = string
  default = ""
}

variable "NODE_GROUP_SUBNET_IDS" {
  type = list(string)
  default = []
  description = "provide sunet ids where node group ec2 instances can run"
}

variable "AMI_TYPE" {
  type    = string
  default = "CUSTOM"

}
variable "CAPACITY_TYPE" {
  type    = string
  default = ""

}

variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}

variable "INSTANCE_TAGS" {
  default = {
  
     "TagKey" = "Tag-Value"
  }
  description = "provide tag with key <Name> and value that will be propigated to Instances"
  
}
variable "CODEBUILD_ROLE_NAME" {
  type = string
  default = ""
}

variable "ALB_INGRESS_POLICY_ARN" {
    type = string
    default = ""
    description = "provide policy arn which will be atached to alb ingress service account to work with api calls to aws services"
}