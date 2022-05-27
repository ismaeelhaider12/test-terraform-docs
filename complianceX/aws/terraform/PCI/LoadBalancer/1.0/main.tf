module "LoadBalancer" {
    providers = {
      aws = aws.var.REGION
    }
    source                      = "../../../modules/LoadBalancer/1.0"
    COMMON_TAGS                 = local.common_tags
    TAGS                        = var.TAGS
###############
### Application LoadBalancer
###############
    ALB_NAME                    = var.ALB_NAME
    CREATE_ALB                  = var.CREATE_ALB
    ALB_ACCESS_LOGS             = var.ALB_ACCESS_LOGS
    ALB_SUBNET_IDS              = var.ALB_SUBNET_IDS
    ALB_SECURITY_GROUP_IDS      = var.ALB_SECURITY_GROUP_IDS
    ALB_INTERNAL                = var.ALB_INTERNAL
    ALB_VPC_ID                  = var.ALB_VPC_ID
    ALB_TARGET_GROUPS           = var.ALB_TARGET_GROUPS
    ALB_HTTP_TCP_LISTENERS      = var.ALB_HTTP_TCP_LISTENERS
    ALB_HTTPS_LISTENERS         = var.ALB_HTTPS_LISTENERS

    ALB_ENABLE_CROSS_ZONE_LOAD_BALANCING  = var.ALB_ENABLE_CROSS_ZONE_LOAD_BALANCING
    ALB_ENABLE_DELETION_PROTECTION        = var.ALB_ENABLE_DELETION_PROTECTION
    ALB_ENABLE_HTTP2                      = var.ALB_ENABLE_HTTP2
    ALB_IP_ADDRESS_TYPE                   = var.ALB_IP_ADDRESS_TYPE

##################
# Classic LoadBalancer
##################
    CREATE_ELB                  = var.CREATE_ELB
    ELB_NAME                    = var.ELB_NAME
    ELB_ACCESS_LOGS             = var.ELB_ACCESS_LOGS    
    ELB_INTERNAL                = var.ELB_INTERNAL
    ELB_SUBNET_IDS              = var.ELB_SUBNET_IDS
    ELB_SECURITY_GROUPS         = var.ELB_SECURITY_GROUPS
    ELB_LISTENER                = var.ELB_LISTENER
    ELB_HEALTH_CHECK            = var.ELB_HEALTH_CHECK

    ELB_CROSS_ZONE_LOAD_BALANCING         = var.ELB_CROSS_ZONE_LOAD_BALANCING
    ELB_CONNECTION_DRAINING               = var.ELB_CONNECTION_DRAINING
    ELB_CONNECTION_DRAINING_TIMEOUT       = var.ELB_CONNECTION_DRAINING_TIMEOUT

########################
### Network LoadBalancer
########################
    NLB_NAME                    = var.NLB_NAME
    CREATE_NLB                  = var.CREATE_NLB
    NLB_INTERNAL                = var.NLB_INTERNAL
    NLB_ACCESS_LOGS             = var.NLB_ACCESS_LOGS    
    NLB_SUBNET_IDS              = var.NLB_SUBNET_IDS
    NLB_VPC_ID                  = var.NLB_VPC_ID
    NLB_TARGET_GROUPS           = var.NLB_TARGET_GROUPS
    NLB_HTTP_TCP_LISTENERS      = var.NLB_HTTP_TCP_LISTENERS
    NLB_HTTPS_LISTENERS         = var.NLB_HTTPS_LISTENERS

    NLB_ENABLE_CROSS_ZONE_LOAD_BALANCING  = var.NLB_ENABLE_CROSS_ZONE_LOAD_BALANCING
    NLB_ENABLE_DELETION_PROTECTION        = var.NLB_ENABLE_DELETION_PROTECTION
    NLB_ENABLE_HTTP2                      = var.NLB_ENABLE_HTTP2
    NLB_IP_ADDRESS_TYPE                   = var.NLB_IP_ADDRESS_TYPE
}

####################
# OUTPUTS
####################
output "APPLICATION_LOAD_BALANCER" {
  value       = "${module.LoadBalancer.APPLICATION_LOAD_BALANCER}"
}
output "APPLICATION_LOAD_BALANCER_ARN" {
  value       = "${module.LoadBalancer.APPLICATION_LOAD_BALANCER_ARN}"
}
output "ALB_TARGET_GROUPS" {
  description = "list"
  value       = "${module.LoadBalancer.ALB_TARGET_GROUPS}"
}
output "ALB_TARGET_GROUPS_ARN" {
  description = "list"
  value       = "${module.LoadBalancer.ALB_TARGET_GROUPS_ARN}"
}
output "APPLICATION_LOAD_BALANCER_ZONE_ID" {
  value       = "${module.LoadBalancer.APPLICATION_LOAD_BALANCER_ZONE_ID}"
}

output "APPLICATION_LOAD_BALANCER_DNS_NAME" {
  value       = "${module.LoadBalancer.APPLICATION_LOAD_BALANCER_DNS_NAME}"
}

output "NETWORK_LOAD_BALANCER" {
  description = "Network load balancer outputs"
  value       = "${module.LoadBalancer.NETWORK_LOAD_BALANCER}"
}
output "NETWORK_LOAD_BALANCER_ARN" {
  description = "Network load balancer arn outputs"
  value       = "${module.LoadBalancer.NETWORK_LOAD_BALANCER_ARN}"
}
output "NLB_TARGET_GROUPS" {
  description = "list"
  value       = "${module.LoadBalancer.NLB_TARGET_GROUPS}"
}
output "NLB_TARGET_GROUPS_ARN" {
  description = "list"
  value       = "${module.LoadBalancer.NLB_TARGET_GROUPS_ARN}"
}
output "NETWORK_LOAD_BALANCER_ZONE_ID" {
  value       = "${module.LoadBalancer.NETWORK_LOAD_BALANCER_ZONE_ID}"
}
output "NETWORK_LOAD_BALANCER_DNS_NAME" {
  value       = "${module.LoadBalancer.NETWORK_LOAD_BALANCER_DNS_NAME}"
}
output "ELASTIC_LOAD_BALANCER" {
  value       = "${module.LoadBalancer.ELASTIC_LOAD_BALANCER}"
}
output "ELASTIC_LOAD_BALANCER_ID" {
  value       = "${module.LoadBalancer.ELASTIC_LOAD_BALANCER_ID}"
}
output "ELASTIC_LOAD_BALANCER_ARN" {
  value       = "${module.LoadBalancer.ELASTIC_LOAD_BALANCER_ARN}"
}
output "ELASTIC_LOAD_BALANCE_ZONE_ID" {
  value       = "${module.LoadBalancer.ELASTIC_LOAD_BALANCE_ZONE_ID}"
}
output "ELASTIC_LOAD_BALANCE_DNS_NAME" {
  value       = "${module.LoadBalancer.ELASTIC_LOAD_BALANCE_DNS_NAME}"
}