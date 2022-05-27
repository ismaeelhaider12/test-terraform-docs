
variable "REGION" {
    type    = string
    default = ""
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
variable "NAME" {
    default = ""
    type = string
}

variable "AMI" {
    default = ""
    type = string
}

variable "INSTANCE_TYPE" {
    default = ""
    type = string
}

variable "KEY_NAME" {
    default = null
    type = string
}

variable "EC2_SECURITY_GROUP_IDS" {
    default = []
    type = list(string)
}

variable "SUBNET_ID" {
    default = ""
    type = string
}

variable "ASSOCIATE_PUBLIC_IP_ADDRESS" {
    default = false
    type = bool
}

variable "USER_DATA" {
    default = null
    type = string
}

variable "IAM_INSTANCE_PROFILE" {
    default = null
    type = string
}

variable "EBS_BLOCK_DEVICE" {
  type = list(object({
    device_name = string
    volume_type = string
    volume_size = number
    delete_on_termination = bool
    kms_key_id = string
  }))
  default = []
}

variable "ROOT_BLOCK_DEVICE" {
  type = object({
    volume_size = number
    volume_type = string
    kms_key_id = string
  })
  default = {
    volume_size = 8
    volume_type = "gp2"
    kms_key_id = ""    
  }
}
variable "MONITORING" {
    default = false
    type = bool
}
variable "TENANCY" {
  description = "default , dedicated or host ? for instance tenancy value"
  type        = string
  default       = "default"
}
