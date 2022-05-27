
variable "NAME" {
  type        = string
  default     = ""
}
variable "DESCRIPTION" {
  type        = string
  default     = null
}
variable "POLICY_JSON" {
  type        = bool
  default     = false
}
variable "POLICY" {
  type        = string
  default     = ""
}
variable "STATEMENTS" {
  type = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
    condition = list(object({
        test      = string
        variable  = string
        values    = list(string)
    }))
  }))
  default = []
}
