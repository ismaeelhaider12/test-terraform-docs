
variable "REGION" {
    type    = string
    default = ""
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
variable "BUCKET_NAME" {
    default = ""
    type = string
}
variable "BUCKET_POLICY" {
    default = ""
    type = string  
}
variable "KMS_KEY_ARN" {
  default = ""
  type = string
}
variable "LIFECYCLE_RULE" {
  type = list(object({
        rule_name = string
        prefix = string
        transition = list(object({
            days = number
            storage_class = string
        }))
        expiration = object({
            days = number
        })
      }))
    default = []
}
variable "ACL" {
  default = "private"
  type = string
  description = "Accepted values are 'private','public-read','public-read-write','aws-exec-read','authenticated-read','log-delivery-write'"
}

variable "SSE_ALGORITHM" {
  default = "aws:kms"
  type = string
  description = "Server Side Encryption Values i-e AES256 or aws:kms"
}