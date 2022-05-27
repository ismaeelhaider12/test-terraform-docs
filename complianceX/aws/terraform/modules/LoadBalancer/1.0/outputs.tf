output "APPLICATION_LOAD_BALANCER" {
  description = "Application load balancer outputs"
  value       = var.CREATE_ALB ? aws_lb.alb_this[0] : null
}
output "APPLICATION_LOAD_BALANCER_ARN" {
  description = "Application load balancer arn outputs"
  value       = var.CREATE_ALB ? aws_lb.alb_this[0].arn : null
}

output "APPLICATION_LOAD_BALANCER_ZONE_ID" {
  description = "Application load balancer ZoneID"
  value       = var.CREATE_ALB ? aws_lb.alb_this[0].zone_id : null
}

output "APPLICATION_LOAD_BALANCER_DNS_NAME" {
  description = "Application load balancer DNS Name"
  value       = var.CREATE_ALB ? aws_lb.alb_this[0].dns_name : null
}

output "ALB_TARGET_GROUPS" {
  description = "Application load balancer Target Groups outputs"
  value       = length(var.ALB_TARGET_GROUPS) > 0 ? aws_lb_target_group.alb_target_groups.* : null
}

output "ALB_TARGET_GROUPS_ARN" {
  description = "Application load balancer Target Groups outputs"
  value       = length(var.ALB_TARGET_GROUPS) > 0 ? aws_lb_target_group.alb_target_groups.*.arn : null
}


output "NETWORK_LOAD_BALANCER" {
  description = "Network load balancer outputs"
  value       = var.CREATE_NLB ? aws_lb.nlb_this[0] : null
}
output "NETWORK_LOAD_BALANCER_ARN" {
  description = "Network load balancer outputs"
  value       = var.CREATE_NLB ? aws_lb.nlb_this[0].arn : null
}
output "NLB_TARGET_GROUPS" {
  description = "Network load balancer Target Groups outputs"
  value       = length(var.NLB_TARGET_GROUPS) > 0 ? aws_lb_target_group.nlb_target_groups.* : null
}
output "NLB_TARGET_GROUPS_ARN" {
  description = "Network load balancer Target Groups outputs"
  value       = length(var.NLB_TARGET_GROUPS) > 0 ? aws_lb_target_group.nlb_target_groups.*.arn : null
}
output "NETWORK_LOAD_BALANCER_ZONE_ID" {
  description = "Network load balancer Zone ID"
  value       = var.CREATE_NLB ? aws_lb.nlb_this[0].zone_id : null
}
output "NETWORK_LOAD_BALANCER_DNS_NAME" {
  description = "Network load balancer DNS Name"
  value       = var.CREATE_NLB ? aws_lb.nlb_this[0].dns_name : null
}

output "ELASTIC_LOAD_BALANCER" {
  description = "Elastic load balancer outputs"
  value       = var.CREATE_ELB ? aws_elb.elb[0] : null
}
output "ELASTIC_LOAD_BALANCER_ID" {
  description = "Elastic load balancer outputs"
  value       = var.CREATE_ELB ? aws_elb.elb[0].id : null
}
output "ELASTIC_LOAD_BALANCER_ARN" {
  description = "Elastic load balancer outputs"
  value       = var.CREATE_ELB ? aws_elb.elb[0].arn : null
}

output "ELASTIC_LOAD_BALANCE_ZONE_ID" {
  description = "Clasic Load Balancer Zone ID"
  value       = var.CREATE_ELB ? aws_elb.elb[0].zone_id : null
}

output "ELASTIC_LOAD_BALANCE_DNS_NAME" {
  description = "Clasic Load Balancer DNS Name"
  value       = var.CREATE_ELB ? aws_elb.elb[0].dns_name : null
}