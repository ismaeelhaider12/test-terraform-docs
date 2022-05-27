
resource "aws_elasticsearch_domain" "default" {

  domain_name           = var.DOMAIN_NAME
  elasticsearch_version = var.ELASTICSEARCH_VERSION
  

  advanced_options = var.ADVANCED_OPTIONS


  dynamic "advanced_security_options" {
      for_each = var.ADVANCED_SECURITY_OPTION

      content {
        enabled                         = lookup(advanced_security_options.value, "enabled", false)
        internal_user_database_enabled  = lookup(advanced_security_options.value, "internal_user_database_enabled" , false)
        master_user_options {
          master_user_arn      = lookup(lookup(advanced_security_options.value, "master_user_options"), master_user_arn , "")
          master_user_name     = lookup(lookup(advanced_security_options.value, "master_user_options"), master_user_name , "")
          master_user_password = lookup(lookup(advanced_security_options.value, "master_user_options"), master_user_password , "")
    }
          }
  }


  dynamic "ebs_options" {
      for_each = var.EBS_OPTIONS
      content {
        ebs_enabled = lookup(ebs_options.value, "ebs_enabled", false)
        volume_size = lookup(ebs_options.value, "volume_size", null)
        volume_type = lookup(ebs_options.value, "volume_type", "")
        iops        = lookup(ebs_options.value, "iops", null)
      }
  }

  encrypt_at_rest {
    enabled    = var.ENCRYPT_AT_REST_ENABLED
    kms_key_id = var.ENCRYPT_AT_REST_KMS_KEY_ID
  }

  dynamic "domain_endpoint_options" {
        for_each  = var.DOMAIN_ENDPOINT_OPTIONS

      content {

          enforce_https                   = lookup(domain_endpoint_options.value , "enforce_https" , true)
          tls_security_policy             = lookup(domain_endpoint_options.value , "tls_security_policy" , "Policy-Min-TLS-1-0-2019-07")
          custom_endpoint_enabled         = lookup(domain_endpoint_options.value , "custom_endpoint_enabled" , false)
          custom_endpoint                 = lookup(domain_endpoint_options.value , "custom_endpoint" , "")
          custom_endpoint_certificate_arn = lookup(domain_endpoint_options.value , "custom_endpoint_certificate_arn" , "")
      }
  }


  dynamic "cluster_config" {
    for_each  = var.CLUSTER_CONFIGURATION

    content {
        instance_count           = lookup(cluster_config.value, instance_count , 2)
        instance_type            = lookup(cluster_config.value, instance_type , "t2.small.elasticsearch")
        dedicated_master_enabled = lookup(cluster_config.value, dedicated_master_enabled , false)
        dedicated_master_count   = lookup(cluster_config.value, dedicated_master_count , 0)
        dedicated_master_type    = lookup(cluster_config.value, dedicated_master_type , "t2.small.elasticsearch")
        zone_awareness_enabled   = lookup(cluster_config.value, zone_awareness_enabled , true)
        warm_enabled             = lookup(cluster_config.value, warm_enabled , false)
        warm_count               = lookup(cluster_config.value, warm_count , 2)
        warm_type                = lookup(cluster_config.value, warm_type , "ultrawarm1.medium.elasticsearch")

        dynamic "zone_awareness_config" {
              for_each = var.AVAILABILITY_ZONE_COUNT > 1 && var.ZONE_AWARENESS_ENABLED ? [true] : []
              content {
                availability_zone_count = lookup(lookup(cluster_config.value, "zone_awareness_config") , availability_zone_count , 2 )
              }
        }
    }
  }

  node_to_node_encryption {
    enabled = var.NODE_TO_NODE_ENCRYPTION_ENABLED
  }

  dynamic "vpc_options" {
    for_each = var.VPC_ENABLED ? [true] : []

    content {
      security_group_ids = var.SECURITY_GROUP_IDS
      subnet_ids         = var.SUBNET_IDS
    }
  }

  snapshot_options {
    automated_snapshot_start_hour = var.AUTOMATED_SNAPSHOT_START_HOUR
  }

  dynamic "cognito_options" {
    for_each = var.COGNITO_AUTHENTICATION_ENABLED ? [true] : []
    content {
      enabled          = true
      user_pool_id     = var.COGNITO_USER_POOL_ID
      identity_pool_id = var.COGNITO_IDENTITY_POOL_ID
      role_arn         = var.COGNITO_IAM_ROLE_ARN
    }
  }

  dynamic "log_publishing_options" {
      for_each  = var.LOG_PUBLISHING_OPTIONS

      content {
          log_type                 = lookup(log_publishing_options.value , "log_type" , "" )
          cloudwatch_log_group_arn = lookup(log_publishing_options.value , "cloudwatch_log_group_arn" , "" )
      }
  }

   tags = merge(
    var.COMMON_TAGS,
    var.TAGS
  )
}

resource "aws_elasticsearch_domain_policy" "default" {

   depends_on = [
    aws_elasticsearch_domain.default
  ]
  
  domain_name     = var.DOMAIN_NAME
  access_policies = join("", data.aws_iam_policy_document.default.*.json)
}


data "aws_iam_policy_document" "default" {
  statement {
    effect  = "Allow"
    actions = var.ELASTIC_SEARCH_POLICY_ACTIONS

    resources = [
      join("", aws_elasticsearch_domain.default.*.arn),
      "${join("", aws_elasticsearch_domain.default.*.arn)}/*",
      "*"
    ]
  
  dynamic "principals" {
      for_each = var.ELASTIC_SEARCH_POLICY_PRINCIPAL

    content {
        type        = lookup(principals.value , "type" , "")    
        identifiers = lookup(principals.value , "identifiers" , [])
    }
  }
  }
}