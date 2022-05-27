
variable "REGION" {
  default = ""
  type = string
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
variable "DELETION_WINDOW_IN_DAYS" {
  default = 7
  type = number
}
variable "DESCRIPTION" {
  default = ""
  type = string
}
variable "ALIAS" {
  default = ""
  type = string
}
variable "KMS_POLICY_JSON" {
  default = ""
}
variable "ENABLE_KEY_ROTATION" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled"
}
variable "KEY_USAGE" { 
  description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY"
  type  = string
  default = "ENCRYPT_DECRYPT"
}
variable "CUSTOMER_MASTER_KEY_SPEC" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1"
  type  = string
  default = "SYMMETRIC_DEFAULT"
}
