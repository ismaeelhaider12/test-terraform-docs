
variable "REGION" {
    type    = string
    default = ""
}
variable "SG_NAME" {
    default = ""
    type    = string
}
variable "SG_DESCRIPTION" {
  default = ""
  type    = string 
}
variable "VPC_ID" {
    default = ""
    type    = string
}
variable "SG_INGRESS" {
  type = list(object({
      sg_ingress_from_port              = number
      sg_ingress_to_port                = number
      sg_ingress_protocol               = string
      sg_ingress_description            = string
      sg_ingress_cidr_blocks            = list(string)
      sg_ingress_security_groups        = list(string)
      sg_ingress_self                   = bool      
  }))
  default = []
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}