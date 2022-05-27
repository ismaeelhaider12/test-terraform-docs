###################
##### Application Load Balancer
###################
variable "COMMON_TAGS" {
  default = {}  
}
variable "TAGS" {
  default = {}
}
variable "CREATE_ALB" {}
variable "ALB_SUBNET_IDS" {
  default = []
}
variable "ALB_SECURITY_GROUP_IDS" {
 default = []
}
variable "ALB_INTERNAL" {
  default = false
}
variable "ALB_IDLE_TIMEOUT" {
  default = 60
}
variable "ALB_ENABLE_CROSS_ZONE_LOAD_BALANCING" {
  default = false
}
variable "ALB_ENABLE_DELETION_PROTECTION" {
  default = false
}
variable "ALB_ENABLE_HTTP2" {
  default = false
}
variable "ALB_IP_ADDRESS_TYPE" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack"
  type = string
  default = "ipv4"
}
variable "ALB_DROP_INVALID_HEADER_FIELDS" {
  default = false
}
variable "ALB_ACCESS_LOGS" {
  default     = {}   
}
variable "ALB_SUBNET_MAPPING" {
  default = []
}
variable "ALB_NAME" {}

variable "ALB_LOAD_BALANCER_CREATE_TIMEOUT" {
  default = "10m"
}
variable "ALB_LOAD_BALANCER_UPDATE_TIMEOUT" {
  default = "10m"
}
variable "ALB_LOAD_BALANCER_DELETE_TIMEOUT" {
  default = "10m"
}

###################
###### Target Groups
###################
variable "ALB_TARGET_GROUPS" {
  default = []
}
variable "ALB_VPC_ID" {}
variable "ALB_HTTP_TCP_LISTENERS" {
  default = []
}
variable "ALB_HTTPS_LISTENERS" {
  default = []
}
variable "ALB_LISTENER_SSL_POLICY_DEFAULT" {
  default = "ELBSecurityPolicy-2016-08"	
}


#################
###### Classic Load Balancer
#################
variable "CREATE_ELB" {}
variable "ELB_NAME" {}
variable "ELB_SUBNET_IDS" {
  default = []
}
variable "ELB_INTERNAL" {
  default = false
}
variable "ELB_SECURITY_GROUPS" {
  default = []
}
variable "ELB_CROSS_ZONE_LOAD_BALANCING" {
  default = false
}
variable "ELB_IDLE_TIMEOUT" {
  default = 60
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

variable "ELB_LISTENER" {
  description = "A list of listener blocks"
  default = []
}

variable "ELB_ACCESS_LOGS" {
  default     = {}
}

variable "ELB_HEALTH_CHECK" {}



###################
##### Network Load Balancer
###################
variable "CREATE_NLB" {}
variable "NLB_SUBNET_IDS" {
  default = []
}
variable "NLB_INTERNAL" {
  default = false
}
variable "NLB_IDLE_TIMEOUT" {
  default = 60
}
variable "NLB_ENABLE_CROSS_ZONE_LOAD_BALANCING" {
  default = false
}
variable "NLB_ENABLE_DELETION_PROTECTION" {
  default = false
}
variable "NLB_ENABLE_HTTP2" {
  default = false
}
variable "NLB_IP_ADDRESS_TYPE" {
  default = "ipv4"
}
variable "NLB_DROP_INVALID_HEADER_FIELDS" {
  default = false
}
variable "NLB_ACCESS_LOGS" {
  default     = {} 
}
variable "NLB_SUBNET_MAPPING" {
  default = []
}
variable "NLB_NAME" {}

variable "NLB_LOAD_BALANCER_CREATE_TIMEOUT" {
  default = "10m"
}
variable "NLB_LOAD_BALANCER_UPDATE_TIMEOUT" {
  default = "10m"
}
variable "NLB_LOAD_BALANCER_DELETE_TIMEOUT" {
  default = "10m"
}

###################
###### Target Groups
###################
variable "NLB_TARGET_GROUPS" {
  default = []
}
variable "NLB_VPC_ID" {}
variable "NLB_HTTP_TCP_LISTENERS" {
  default = []
}
variable "NLB_HTTPS_LISTENERS" {
  default = []
}
variable "NLB_LISTENER_SSL_POLICY_DEFAULT" {
  default = "ELBSecurityPolicy-2016-08"	
}