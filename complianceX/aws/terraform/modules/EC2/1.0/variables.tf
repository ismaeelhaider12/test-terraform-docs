variable "COMMON_TAGS" {
  default = {}
}
variable "TAGS" {
  default = {}
}
variable "USER_DATA" {
  default = ""
}
variable "EBS_BLOCK_DEVICE" {
  default = []
}
variable "INSTANCE_COUNT" {
  default = 1
}
variable "KEY_NAME" {
  default = ""
}
variable "TENANCY" {
  default = "default"
}
variable "MONITORING" {
  default = false
}
variable "IAM_INSTANCE_PROFILE" {
  default = ""
}
variable "AMI" {}
variable "NAME" {}
variable "INSTANCE_TYPE" {}
variable "EC2_SECURITY_GROUP_IDS" {}
variable "SUBNET_ID" {}
variable "ASSOCIATE_PUBLIC_IP_ADDRESS" {}
variable "ROOT_BLOCK_DEVICE" {}
