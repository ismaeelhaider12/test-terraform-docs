
variable "REGION" {
    type    = string
    default = ""
}

variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}


variable "CLUSTER_NAME" {
      type = string
      default = ""
}

variable "serviceaccount" {
  type = list(object({
    name        = string
    namespace   = string
    policy_arn  = string
  }))
  default = []
}