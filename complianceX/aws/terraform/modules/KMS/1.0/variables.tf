variable "DELETION_WINDOW_IN_DAYS" {
  type        = number
  default     = 10
  description = "Duration in days after which the key is deleted after destruction of the resource"
}

variable "ENABLE_KEY_ROTATION" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled"
}

variable "DESCRIPTION" {
  type        = string
  default     = "Parameter Store KMS key"
  description = "Kms key to encryption and decryption"
}

variable "ALIAS" {
  type        = string
  default     = ""
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash"
}

variable "KMS_POLICY_JSON" {
  type        = string
  default     = ""
  description = "A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy."
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
variable "IS_ENABLED" {
  description = "Specifies whether the key is enabled"
  type  = bool
  default = true
}
variable "COMMON_TAGS" {
  default = {}  
}
variable "TAGS" {
  default = {}
}