
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
variable "NAME" {
  type        = string
  default     = ""
}
variable "CREATE_INSTANCE_PROFILE" {
  type    = bool
  default = false
}
variable "POLICIES_ARN" {
  type = list(string)
  default = []
}
variable "STATEMENTS" {
  type = list(object({
    effect    = string
    actions   = list(string)
    principals = object({
      type          = string
      identifiers   = list(string)
    })
  }))
  default = []
}
variable "PATH" {  
  type        = string
  default     = "/"
}
