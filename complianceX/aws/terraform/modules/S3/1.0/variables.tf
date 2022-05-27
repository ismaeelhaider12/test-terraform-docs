
variable "COMMON_TAGS" {
  default = {}
}
variable "TAGS" {
  default = {}
}
variable "BUCKET_NAME" {}
variable "VERSIONING" {
  default = true
}
variable "ACL" {
    default = "private"
}
variable "KMS_KEY_ARN" {}
variable "SSE_ALGORITHM" {
    default = "aws:kms"
}
variable "BUCKET_POLICY" {}
variable "LIFECYCLE_RULE" {
  default = []
}
