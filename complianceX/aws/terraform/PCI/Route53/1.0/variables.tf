
variable "REGION" {
  default = ""
  type = string
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
variable "CREATE_ZONE" {
    type    = bool
    default = true
}
variable "CREATE_RECORD" {
    type        = bool
    default     = true
}
variable "DESCRIPTION" {
    type = string
    default = null
}
variable "ZONE_NAME" {
    type        = string
    default     = ""
}
variable "VPCS" { 
    type = list(object({
        vpc_id      = string
        vpc_region  = string
    }))
  default = []
}
variable "RECORDS" {
  type        = list(object({
      name      = string
      type      = string
      ttl       = number
      records   = list(string)
      alias     = object({
          name      = string
          zone_id   = string
      })
  }))
  default     = []
}
