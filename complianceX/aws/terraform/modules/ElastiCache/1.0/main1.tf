
resource "aws_elasticache_subnet_group" "default" {
  name       = var.SUBNET_GROUP_NAME
  subnet_ids = var.SUBNETS
}

resource "aws_elasticache_parameter_group" "default" {
  name   = var.PARAMETER_GROUP_NAME
  family = var.ELASTICACHE_PARAMETER_GROUP_FAMILY

  dynamic "parameter"{
        for_each = var.PARAMETERS
    content {
        name  = lookup(parameter.value, "name", "")
        value = lookup(parameter.value, "value", "")
    }
  }
}

resource "aws_elasticache_cluster" "default" {

  apply_immediately    = var.APPLY_IMMEDIATELY
  cluster_id           = var.CLUSTER_NAME
  engine               = var.ENGINE  
  engine_version       = var.ENGINE_VERSION
  node_type            = var.INSTANCE_TYPE
  num_cache_nodes      = var.CLUSTER_SIZE
  parameter_group_name = join("", aws_elasticache_parameter_group.default.*.name)
  subnet_group_name    = join("", aws_elasticache_subnet_group.default.*.name) 
  security_group_ids           = var.SECURITY_GROUP_IDS
  maintenance_window           = var.MAINTENANCE_WINDOW
  notification_topic_arn       = var.NOTIFICATION_TOPIC_ARN
  port                         = var.PORT
  az_mode                      = var.AZ_MODE
  availability_zone            = var.AVAILABILITY_ZONE
  preferred_availability_zones = var.AVAILABILITY_ZONES
  
  log_delivery_configuration {
    destination      = var.LOG_DELIVERY_DESTINATION
    destination_type = var.LOG_DELIVERY_DESTINATION_TYPE
    log_format       = var.LOG_FORMATE
    log_type         = var.LOG_TYPE
  }
  


     tags = merge(
          var.COMMON_TAGS,
          var.TAGS
        )

}

