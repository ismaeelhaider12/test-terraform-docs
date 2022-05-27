
variable "REGION" {
    type    = string
    default = ""
}
variable "NAME" {
    default = "ismaeel"
    type    = string
}
variable "VPC_CIDR" {
    default = ""
    type    = string
}
variable "AZS_COUNT" {
    default = 3
    type    = number
}
variable "PUBLIC_SUBNETS" {
    default = []
    type    = list(string)
}
variable "PRIVATE_SUBNETS" {
    default = []
    type    = list(string)
}
variable "PRIVATE_SUBNETS_WITHOUT_NG" {
    default = []
    type    = list(string)
}
variable "TAGS" {
    default = {
        "TagKey" = "TagValue",
    }
}
variable "ENABLE_DNS_SUPPORT" {
  description = "True or false ? for Enabling DNS Suport for VPC"
  type        = bool
  default       = true
}
variable "ENABLE_DNS_HOSTNAMES" {
  description = "True or false ? for Enabling DNS Host Names in VPC"
  type        = bool
  default       = true
}
variable "INSTANCE_TENANCY" {
  description = "default , dedicated or host ? for instance tenancy value"
  type        = string
  default       = "default"
}
variable "MAP_PUBLIC_IP_ON_LAUNCH" {
  description = "True or false ? for Enabling DNS Host Names in VPC"
  type        = bool
  default       = true
}

variable "FLOW_LOGS_DESTINATION" {
  type        = string
  default       = "arn:aws:s3:::central-managed-flowlogs"
}
variable "CREATE_VPC_FLOW_LOGS" {
    type = bool
    description = "provide true/false for option to anable vpc flow logs" 
}