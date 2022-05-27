module "ElastiCache" {
  providers = {
    aws = aws.var.REGION
  }
  source      = "../../../modules/ElastiCache/1.0"
  TAGS        = var.TAGS
  COMMON_TAGS = local.common_tags

  SUBNET_GROUP_NAME                  = var.SUBNET_GROUP_NAME
  SUBNETS                            = var.SUBNETS
  PARAMETER_GROUP_NAME               = var.PARAMETER_GROUP_NAME
  PARAMETERS                         = var.PARAMETERS
  ELASTICACHE_PARAMETER_GROUP_FAMILY = var.ELASTICACHE_PARAMETER_GROUP_FAMILY
  MAX_ITEM_SIZE                      = var.MAX_ITEM_SIZE
  APPLY_IMMEDIATELY                  = var.APPLY_IMMEDIATELY
  CLUSTER_NAME                       = var.CLUSTER_NAME
  ENGINE                             = var.ENGINE
  ENGINE_VERSION                     = var.ENGINE_VERSION
  INSTANCE_TYPE                      = var.INSTANCE_TYPE
  CLUSTER_SIZE                       = var.CLUSTER_SIZE
  SECURITY_GROUP_IDS                 = var.SECURITY_GROUP_IDS
  MAINTENANCE_WINDOW                 = var.MAINTENANCE_WINDOW
  NOTIFICATION_TOPIC_ARN             = var.NOTIFICATION_TOPIC_ARN
  PORT                               = var.PORT
  AZ_MODE                            = var.AZ_MODE
  AVAILABILITY_ZONE                  = var.AVAILABILITY_ZONE
  AVAILABILITY_ZONES                 = var.AVAILABILITY_ZONES
  LOG_DELIVERY_DESTINATION           = var.LOG_DELIVERY_DESTINATION
  LOG_DELIVERY_DESTINATION_TYPE      = var.LOG_DELIVERY_DESTINATION_TYPE
  LOG_FORMATE                        = var.LOG_FORMATE
  LOG_TYPE                           = var.LOG_TYPE
}

output "ElastiCache_ARN" {
  value = module.ElastiCache.ElastiCache_ARN
}
output "ElastiCache_ENGION_VERSION" {
  value = module.ElastiCache.ElastiCache_ENGION_VERSION
}
output "ElastiCache_CACHE_NODES" {
  value = module.ElastiCache.ElastiCache_CACHE_NODES
}
output "ElastiCache_DNS_NAME" {
  value = module.ElastiCache.ElastiCache_DNS_NAME
}
output "ElastiCache_CONFIG_ENDPOINT" {
  value = module.ElastiCache.ElastiCache_CONFIG_ENDPOINT
}
