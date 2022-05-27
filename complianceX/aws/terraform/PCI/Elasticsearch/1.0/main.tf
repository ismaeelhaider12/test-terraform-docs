module "Elasticsearch" {
  providers = {
    aws = aws.var.REGION
  }
  source      = "../../../modules/Elasticsearch/1.0"
  TAGS        = var.TAGS
  COMMON_TAGS = local.common_tags

  #########################
  ######## Elastic Search

  DOMAIN_NAME                                              = var.DOMAIN_NAME
  ELASTICSEARCH_VERSION                                    = var.ELASTICSEARCH_VERSION
  ADVANCED_OPTIONS                                         = var.ADVANCED_OPTIONS
  EBS_VOLUME_SIZE                                          = var.EBS_VOLUME_SIZE
  EBS_VOLUME_TYPE                                          = var.EBS_VOLUME_TYPE
  EBS_IOPS                                                 = var.EBS_IOPS
  ENCRYPT_AT_REST_ENABLED                                  = var.ENCRYPT_AT_REST_ENABLED
  ENCRYPT_AT_REST_KMS_KEY_ID                               = var.ENCRYPT_AT_REST_KMS_KEY_ID
  INSTANCE_COUNT                                           = var.INSTANCE_COUNT
  INSTANCE_TYPE                                            = var.INSTANCE_TYPE
  DEDICATED_MASTER_ENABLED                                 = var.DEDICATED_MASTER_ENABLED
  DEDICATED_MASTER_COUNT                                   = var.DEDICATED_MASTER_COUNT
  DEDICATED_MASTER_TYPE                                    = var.DEDICATED_MASTER_TYPE
  ZONE_AWARENESS_ENABLED                                   = var.ZONE_AWARENESS_ENABLED
  WARM_ENABLED                                             = var.WARM_ENABLED
  WARM_COUNT                                               = var.WARM_COUNT
  WARM_TYPE                                                = var.WARM_TYPE
  AVAILABILITY_ZONE_COUNT                                  = var.AVAILABILITY_ZONE_COUNT
  NODE_TO_NODE_ENCRYPTION_ENABLED                          = var.NODE_TO_NODE_ENCRYPTION_ENABLED
  VPC_ENABLED                                              = var.VPC_ENABLED
  SECURITY_GROUP_IDS                                       = var.SECURITY_GROUP_IDS
  SUBNET_IDS                                               = var.SUBNET_IDS
  AUTOMATED_SNAPSHOT_START_HOUR                            = var.AUTOMATED_SNAPSHOT_START_HOUR
  COGNITO_AUTHENTICATION_ENABLED                           = var.COGNITO_AUTHENTICATION_ENABLED
  COGNITO_USER_POOL_ID                                     = var.COGNITO_USER_POOL_ID
  COGNITO_IDENTITY_POOL_ID                                 = var.COGNITO_IDENTITY_POOL_ID
  COGNITO_IAM_ROLE_ARN                                     = var.COGNITO_IAM_ROLE_ARN
  ADVANCED_SECURITY_OPTION                                 = var.ADVANCED_SECURITY_OPTION
  EBS_OPTIONS                                              = var.EBS_OPTIONS
  CLUSTER_CONFIGURATION                                    = var.CLUSTER_CONFIGURATION
  LOG_PUBLISHING_OPTIONS                                   = var.LOG_PUBLISHING_OPTIONS
  ELASTIC_SEARCH_POLICY_ACTIONS                            = var.ELASTIC_SEARCH_POLICY_ACTIONS
  DOMAIN_ENDPOINT_OPTIONS                                  = var.DOMAIN_ENDPOINT_OPTIONS
  ELASTIC_SEARCH_POLICY_PRINCIPAL                          = var.ELASTIC_SEARCH_POLICY_PRINCIPAL
  }

output "ELASTIC_SEARCH_ARN" {
  value = module.Elasticsearch.ELASTIC_SEARCH_ARN
}

output "ELASTIC_SEARCH_DOMAIN_ID" {
  value = module.Elasticsearch.ELASTIC_SEARCH_DOMAIN_ID
}

output "ELASTIC_SEARCH_DOMAIN_NAME" {
  value = module.Elasticsearch.ELASTIC_SEARCH_DOMAIN_NAME
}

output "ELASTIC_SEARCH_ENDPOINT" {
  value = module.Elasticsearch.ELASTIC_SEARCH_ENDPOINT
}

output "ELASTIC_SEARCH_KIBANA_ENDPOINT" {
  value = module.Elasticsearch.ELASTIC_SEARCH_KIBANA_ENDPOINT
}
