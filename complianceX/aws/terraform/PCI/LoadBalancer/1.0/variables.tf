
variable "REGION" {
    type    = string
    default = ""
}
variable "TAGS" {
  default = {
    "TagKey" = "TagValue",
  }
}
###################
##### Application Load Balancer
###################
variable "CREATE_ALB" {
    default = false
    type = bool
}
variable "ALB_INTERNAL" {
    default = false
    type = bool  
}
variable "ALB_SUBNET_IDS" {
    default = []
    type = list(string)
}
variable "ALB_SECURITY_GROUP_IDS" {
    default = []
    type = list(string)
}
variable "ALB_ACCESS_LOGS" {
  type        = object({
    bucket              = string
    prefix              = string
  })
  default = {
    bucket              = ""
    prefix              = ""
  }
}

variable "ALB_NAME" {
    default = ""
    type = string
}
variable "ALB_TARGET_GROUPS" {
  type = list(object({
      backend_protocol      = string
      name                  = string
      backend_port          = number
      target_type           = string
      health_check          = object({
          enabled             = string
          interval            = string
          path                = string
          healthy_threshold   = string
          unhealthy_threshold = string
      })
  }))
  default = []
}
variable "ALB_VPC_ID" {
    default = ""
    type = string    
}
variable "ALB_HTTP_TCP_LISTENERS" {
  type = list(object({
      port                = number
      protocol            = string
      target_group_index  = number
  }))
  default = []
}
variable "ALB_HTTPS_LISTENERS" {
  type = list(object({
      port                = number
      protocol            = string
      certificate_arn     = string
      target_group_index  = number
  }))
  default = []
}

variable "ALB_ENABLE_CROSS_ZONE_LOAD_BALANCING" {
  description = "If true, cross-zone load balancing of the load balancer will be enabled"
  type = bool
  default = false
}
variable "ALB_ENABLE_DELETION_PROTECTION" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API."
  type = bool
  default = false
}
variable "ALB_ENABLE_HTTP2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
  type = bool
  default = false
}
variable "ALB_IP_ADDRESS_TYPE" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack"
  type = string
  default = "ipv4"
}
#################
###### Classic Load Balancer
#################
variable "CREATE_ELB" {
    default = false
    type = bool
}
variable "ELB_ACCESS_LOGS" {
  type        = object({
    bucket              = string
    bucket_prefix       = string
  })
  default = {
    bucket              = ""
    bucket_prefix       = ""
  }
}

variable "ELB_INTERNAL" {
    default = false
    type = bool  
}
variable "ELB_NAME" {
    default = ""
    type = string
}
variable "ELB_SUBNET_IDS" {
  default = []
    type = list(string)
}
variable "ELB_SECURITY_GROUPS" {
  default = []
    type = list(string)
}
variable "ELB_LISTENER" {
  type = list(object({
      instance_port           = number
      instance_protocol       = string
      lb_port                 = number
      lb_protocol             = string
      ssl_certificate_id      = string
  }))
  default = []
}
variable "ELB_HEALTH_CHECK" {
  description = "A health check block"
  type        = object({
    target              = string
    interval            = number
    healthy_threshold   = number
    unhealthy_threshold = number
    timeout             = number
  })
  default = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }
}

variable "ELB_CROSS_ZONE_LOAD_BALANCING" {
  description = "If true, cross-zone load balancing of the load balancer will be enabled.for Classis Load Balancer"
  type = bool
  default = false
}
variable "ELB_CONNECTION_DRAINING" {
  description = "Boolean to enable connection draining"
  type        = bool
  default     = false
}
variable "ELB_CONNECTION_DRAINING_TIMEOUT" {
  description = "The time in seconds to allow for connections to drain"
  type        = number
  default     = 300
}

###################
##### Network Load Balancer
###################
variable "CREATE_NLB" {
    default = false
    type = bool    
}
variable "NLB_INTERNAL" {
    default = false
    type = bool  
}
variable "NLB_SUBNET_IDS" {
    default = []
    type = list(string)
}
variable "NLB_NAME" {
    default = ""
    type = string
}
variable "NLB_VPC_ID" {
    default = ""
    type = string
}
variable "NLB_ACCESS_LOGS" {
  type        = object({
    bucket              = string
    prefix              = string    
  })
  default = {
    bucket              = ""
    prefix              = ""
  }
}

variable "NLB_TARGET_GROUPS" {
  type = list(object({
      backend_protocol      = string
      name                  = string
      backend_port          = number
      health_check          = object({
          enabled             = string
          interval            = string
          path                = string
          healthy_threshold   = string
          unhealthy_threshold = string
      })
  }))
  default = []
}
variable "NLB_HTTP_TCP_LISTENERS" {
  type = list(object({
      port                = number
      protocol            = string
      target_group_index  = number
  }))
  default = []
}

variable "NLB_HTTPS_LISTENERS" {
  type = list(object({
      port                = number
      protocol            = string
      certificate_arn     = string
      target_group_index  = number
  }))
  default = []
}

variable "NLB_ENABLE_CROSS_ZONE_LOAD_BALANCING" {
  description = " If true, cross-zone load balancing of the load balancer will be enabled. This is a network load balancer feature."
  type = bool
  default = false
}
variable "NLB_ENABLE_DELETION_PROTECTION" {
  description = "If true, deletion of the Network load balancer will be disabled via the AWS API."
  type = bool
  default = false
}
variable "NLB_ENABLE_HTTP2" {
  description = "Indicates whether HTTP/2 is enabled in network load balancers."
  type = bool
  default = false
}
variable "NLB_IP_ADDRESS_TYPE" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack"
  type = string
  default = "ipv4"
}