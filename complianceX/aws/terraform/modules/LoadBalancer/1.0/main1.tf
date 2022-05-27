
###########################
# Application Load Balancer
###########################
resource "aws_lb" "alb_this" {
  count = var.CREATE_ALB ? 1 : 0
  name        = var.ALB_NAME
  load_balancer_type = "application"
  internal           = var.ALB_INTERNAL
  security_groups    = var.ALB_SECURITY_GROUP_IDS
  subnets            = var.ALB_SUBNET_IDS
  idle_timeout                     = var.ALB_IDLE_TIMEOUT
  enable_cross_zone_load_balancing = var.ALB_ENABLE_CROSS_ZONE_LOAD_BALANCING
  enable_deletion_protection       = var.ALB_ENABLE_DELETION_PROTECTION
  enable_http2                     = var.ALB_ENABLE_HTTP2
  ip_address_type                  = var.ALB_IP_ADDRESS_TYPE
  drop_invalid_header_fields       = var.ALB_DROP_INVALID_HEADER_FIELDS

  dynamic "access_logs" {
    for_each = length(keys(var.ALB_ACCESS_LOGS)) == 0 ? [] : [var.ALB_ACCESS_LOGS]

    content {
      enabled = true
      bucket  = lookup(access_logs.value, "bucket", null)
      prefix  = lookup(access_logs.value, "prefix", null)
    }
  }

  dynamic "subnet_mapping" {
    for_each = var.ALB_SUBNET_MAPPING

    content {
      subnet_id     = subnet_mapping.value.subnet_id
      allocation_id = lookup(subnet_mapping.value, "allocation_id", null)
    }
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      Name = var.ALB_NAME != null ? var.ALB_NAME : "Application-LoadBalancer"
    },
  )

  timeouts {
    create = var.ALB_LOAD_BALANCER_CREATE_TIMEOUT
    update = var.ALB_LOAD_BALANCER_UPDATE_TIMEOUT
    delete = var.ALB_LOAD_BALANCER_DELETE_TIMEOUT
  }
}


resource "aws_lb_target_group" "alb_target_groups" {
  count = (var.CREATE_ALB || length(var.ALB_TARGET_GROUPS) > 0) ? length(var.ALB_TARGET_GROUPS) : 0

  name        = lookup(var.ALB_TARGET_GROUPS[count.index], "name", null)

  vpc_id      = var.ALB_VPC_ID
  port        = lookup(var.ALB_TARGET_GROUPS[count.index], "backend_port", null)
  protocol    = lookup(var.ALB_TARGET_GROUPS[count.index], "backend_protocol", null) != null ? upper(lookup(var.ALB_TARGET_GROUPS[count.index], "backend_protocol")) : null
  target_type = lookup(var.ALB_TARGET_GROUPS[count.index], "target_type", "instance")

  deregistration_delay               = lookup(var.ALB_TARGET_GROUPS[count.index], "deregistration_delay", null)
  slow_start                         = lookup(var.ALB_TARGET_GROUPS[count.index], "slow_start", null)
  proxy_protocol_v2                  = lookup(var.ALB_TARGET_GROUPS[count.index], "proxy_protocol_v2", false)
  lambda_multi_value_headers_enabled = lookup(var.ALB_TARGET_GROUPS[count.index], "lambda_multi_value_headers_enabled", false)
  load_balancing_algorithm_type      = lookup(var.ALB_TARGET_GROUPS[count.index], "load_balancing_algorithm_type", null)

  dynamic "health_check" {
    for_each = length(keys(lookup(var.ALB_TARGET_GROUPS[count.index], "health_check", {}))) == 0 ? [] : [lookup(var.ALB_TARGET_GROUPS[count.index], "health_check", {})]

    content {
      enabled             = lookup(health_check.value, "enabled", null)
      interval            = lookup(health_check.value, "interval", null)
      path                = lookup(health_check.value, "path", null)
      port                = lookup(health_check.value, "port", "traffic-port")
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", null)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", null)
      timeout             = lookup(health_check.value, "timeout", null)
      protocol            = lookup(health_check.value, "protocol", null)
      matcher             = lookup(health_check.value, "matcher", null)
    }
  }

  dynamic "stickiness" {
    for_each = length(keys(lookup(var.ALB_TARGET_GROUPS[count.index], "stickiness", {}))) == 0 ? [] : [lookup(var.ALB_TARGET_GROUPS[count.index], "stickiness", {})]

    content {
      enabled         = lookup(stickiness.value, "enabled", null)
      cookie_duration = lookup(stickiness.value, "cookie_duration", null)
      type            = lookup(stickiness.value, "type", null)
    }
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    lookup(var.ALB_TARGET_GROUPS[count.index], "tags", {}),
    {
      "Name" = lookup(var.ALB_TARGET_GROUPS[count.index], "name", lookup(var.ALB_TARGET_GROUPS[count.index], "name_prefix", ""))
    },
  )

  depends_on = [aws_lb.alb_this]

}


resource "aws_lb_listener" "alb_listener_frontend_http_tcp" {
  count = var.CREATE_ALB ? length(var.ALB_HTTP_TCP_LISTENERS) : 0

  load_balancer_arn = aws_lb.alb_this[0].arn

  port     = var.ALB_HTTP_TCP_LISTENERS[count.index]["port"]
  protocol = var.ALB_HTTP_TCP_LISTENERS[count.index]["protocol"]

  dynamic "default_action" {
    for_each = length(keys(var.ALB_HTTP_TCP_LISTENERS[count.index])) == 0 ? [] : [var.ALB_HTTP_TCP_LISTENERS[count.index]]


    content {
      type             = lookup(default_action.value, "action_type", "forward")
      target_group_arn = contains([null, "", "forward"], lookup(default_action.value, "action_type", "")) ? aws_lb_target_group.alb_target_groups[lookup(default_action.value, "target_group_index", count.index)].id : null

      dynamic "redirect" {
        for_each = length(keys(lookup(default_action.value, "redirect", {}))) == 0 ? [] : [lookup(default_action.value, "redirect", {})]

        content {
          path        = lookup(redirect.value, "path", null)
          host        = lookup(redirect.value, "host", null)
          port        = lookup(redirect.value, "port", null)
          protocol    = lookup(redirect.value, "protocol", null)
          query       = lookup(redirect.value, "query", null)
          status_code = redirect.value["status_code"]
        }
      }

      dynamic "fixed_response" {
        for_each = length(keys(lookup(default_action.value, "fixed_response", {}))) == 0 ? [] : [lookup(default_action.value, "fixed_response", {})]

        content {
          content_type = fixed_response.value["content_type"]
          message_body = lookup(fixed_response.value, "message_body", null)
          status_code  = lookup(fixed_response.value, "status_code", null)
        }
      }
    }
  }
}

resource "aws_lb_listener" "alb_listener_frontend_https" {
  count = var.CREATE_ALB ? length(var.ALB_HTTPS_LISTENERS) : 0

  load_balancer_arn = aws_lb.alb_this[0].arn

  port            = var.ALB_HTTPS_LISTENERS[count.index]["port"]
  protocol        = lookup(var.ALB_HTTPS_LISTENERS[count.index], "protocol", "HTTPS")
  certificate_arn = var.ALB_HTTPS_LISTENERS[count.index]["certificate_arn"]
  ssl_policy      = lookup(var.ALB_HTTPS_LISTENERS[count.index], "ssl_policy", var.ALB_LISTENER_SSL_POLICY_DEFAULT)

  dynamic "default_action" {
    for_each = length(keys(var.ALB_HTTPS_LISTENERS[count.index])) == 0 ? [] : [var.ALB_HTTPS_LISTENERS[count.index]]


    content {
      type             = lookup(default_action.value, "action_type", "forward")
      target_group_arn = contains([null, "", "forward"], lookup(default_action.value, "action_type", "")) ? aws_lb_target_group.alb_target_groups[lookup(default_action.value, "target_group_index", count.index)].id : null

      dynamic "redirect" {
        for_each = length(keys(lookup(default_action.value, "redirect", {}))) == 0 ? [] : [lookup(default_action.value, "redirect", {})]

        content {
          path        = lookup(redirect.value, "path", null)
          host        = lookup(redirect.value, "host", null)
          port        = lookup(redirect.value, "port", null)
          protocol    = lookup(redirect.value, "protocol", null)
          query       = lookup(redirect.value, "query", null)
          status_code = redirect.value["status_code"]
        }
      }

      dynamic "fixed_response" {
        for_each = length(keys(lookup(default_action.value, "fixed_response", {}))) == 0 ? [] : [lookup(default_action.value, "fixed_response", {})]

        content {
          content_type = fixed_response.value["content_type"]
          message_body = lookup(fixed_response.value, "message_body", null)
          status_code  = lookup(fixed_response.value, "status_code", null)
        }
      }
    }
  }

  dynamic "default_action" {
    for_each = contains(["authenticate-oidc", "authenticate-cognito"], lookup(var.ALB_HTTPS_LISTENERS[count.index], "action_type", {})) ? [var.ALB_HTTPS_LISTENERS[count.index]] : []
    content {
      type             = "forward"
      target_group_arn = aws_lb_target_group.alb_target_groups[lookup(default_action.value, "target_group_index", count.index)].id
    }
  }
}






###########
# Classis Load Balancer
###########

resource "aws_elb" "elb" {
  count = var.CREATE_ELB ? 1 : 0

  name        = var.ELB_NAME

  subnets         = var.ELB_SUBNET_IDS
  internal        = var.ELB_INTERNAL
  security_groups = var.ELB_SECURITY_GROUPS

  cross_zone_load_balancing   = var.ELB_CROSS_ZONE_LOAD_BALANCING
  idle_timeout                = var.ELB_IDLE_TIMEOUT
  connection_draining         = var.ELB_CONNECTION_DRAINING
  connection_draining_timeout = var.ELB_CONNECTION_DRAINING_TIMEOUT

  dynamic "listener" {
    for_each = var.ELB_LISTENER
    content {
      instance_port      = listener.value.instance_port
      instance_protocol  = listener.value.instance_protocol
      lb_port            = listener.value.lb_port
      lb_protocol        = listener.value.lb_protocol
      ssl_certificate_id = lookup(listener.value, "ssl_certificate_id", null)
    }
  }

  dynamic "access_logs" {
    for_each = length(keys(var.ELB_ACCESS_LOGS)) == 0 ? [] : [var.ELB_ACCESS_LOGS]
    content {
      bucket        = access_logs.value.bucket
      bucket_prefix = lookup(access_logs.value, "bucket_prefix", null)
      interval      = lookup(access_logs.value, "interval", "60")
      enabled       = true
    }
  }

  health_check {
    healthy_threshold   = lookup(var.ELB_HEALTH_CHECK, "healthy_threshold")
    unhealthy_threshold = lookup(var.ELB_HEALTH_CHECK, "unhealthy_threshold")
    target              = lookup(var.ELB_HEALTH_CHECK, "target")
    interval            = lookup(var.ELB_HEALTH_CHECK, "interval")
    timeout             = lookup(var.ELB_HEALTH_CHECK, "timeout")
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      "Name" = format("%s", var.ELB_NAME)
    },
  )
}


###########################
# Network Load Balancer
###########################
resource "aws_lb" "nlb_this" {
  count = var.CREATE_NLB ? 1 : 0
  name        = var.NLB_NAME
  load_balancer_type = "network"
  internal           = var.NLB_INTERNAL
  subnets            = var.NLB_SUBNET_IDS
  idle_timeout                     = var.NLB_IDLE_TIMEOUT
  enable_cross_zone_load_balancing = var.NLB_ENABLE_CROSS_ZONE_LOAD_BALANCING
  enable_deletion_protection       = var.NLB_ENABLE_DELETION_PROTECTION
  enable_http2                     = var.NLB_ENABLE_HTTP2
  ip_address_type                  = var.NLB_IP_ADDRESS_TYPE
  drop_invalid_header_fields       = var.NLB_DROP_INVALID_HEADER_FIELDS

  dynamic "access_logs" {
    for_each = length(keys(var.NLB_ACCESS_LOGS)) == 0 ? [] : [var.NLB_ACCESS_LOGS]

    content {
      enabled = true
      bucket  = lookup(access_logs.value, "bucket", null)
      prefix  = lookup(access_logs.value, "prefix", null)
    }
  }

  dynamic "subnet_mapping" {
    for_each = var.NLB_SUBNET_MAPPING

    content {
      subnet_id     = subnet_mapping.value.subnet_id
      allocation_id = lookup(subnet_mapping.value, "allocation_id", null)
    }
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      Name = var.NLB_NAME != null ? var.NLB_NAME : "Network-LoadBalancer"
    },
  )

  timeouts {
    create = var.NLB_LOAD_BALANCER_CREATE_TIMEOUT
    update = var.NLB_LOAD_BALANCER_UPDATE_TIMEOUT
    delete = var.NLB_LOAD_BALANCER_DELETE_TIMEOUT
  }
}


resource "aws_lb_target_group" "nlb_target_groups" {
  count = (var.CREATE_NLB || length(var.NLB_TARGET_GROUPS) > 0 ) ? length(var.NLB_TARGET_GROUPS) : 0

  name        = lookup(var.NLB_TARGET_GROUPS[count.index], "name", null)

  vpc_id      = var.NLB_VPC_ID
  port        = lookup(var.NLB_TARGET_GROUPS[count.index], "backend_port", null)
  protocol    = lookup(var.NLB_TARGET_GROUPS[count.index], "backend_protocol", null) != null ? upper(lookup(var.NLB_TARGET_GROUPS[count.index], "backend_protocol")) : null
  target_type = lookup(var.NLB_TARGET_GROUPS[count.index], "target_type", "instance")

  deregistration_delay               = lookup(var.NLB_TARGET_GROUPS[count.index], "deregistration_delay", null)
  slow_start                         = lookup(var.NLB_TARGET_GROUPS[count.index], "slow_start", null)
  proxy_protocol_v2                  = lookup(var.NLB_TARGET_GROUPS[count.index], "proxy_protocol_v2", false)
  lambda_multi_value_headers_enabled = lookup(var.NLB_TARGET_GROUPS[count.index], "lambda_multi_value_headers_enabled", false)
  load_balancing_algorithm_type      = lookup(var.NLB_TARGET_GROUPS[count.index], "load_balancing_algorithm_type", null)

  dynamic "health_check" {
    for_each = length(keys(lookup(var.NLB_TARGET_GROUPS[count.index], "health_check", {}))) == 0 ? [] : [lookup(var.NLB_TARGET_GROUPS[count.index], "health_check", {})]

    content {
      enabled             = lookup(health_check.value, "enabled", null)
      interval            = lookup(health_check.value, "interval", null)
      path                = lookup(health_check.value, "path", null)
      port                = lookup(health_check.value, "port", "traffic-port")
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", null)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", null)
      timeout             = lookup(health_check.value, "timeout", null)
      protocol            = lookup(health_check.value, "protocol", null)
      matcher             = lookup(health_check.value, "matcher", null)
    }
  }

  dynamic "stickiness" {
    for_each = length(keys(lookup(var.NLB_TARGET_GROUPS[count.index], "stickiness", {}))) == 0 ? [] : [lookup(var.NLB_TARGET_GROUPS[count.index], "stickiness", {})]

    content {
      enabled         = lookup(stickiness.value, "enabled", null)
      cookie_duration = lookup(stickiness.value, "cookie_duration", null)
      type            = lookup(stickiness.value, "type", null)
    }
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    lookup(var.NLB_TARGET_GROUPS[count.index], "tags", {}),
    {
      "Name" = lookup(var.NLB_TARGET_GROUPS[count.index], "name", lookup(var.NLB_TARGET_GROUPS[count.index], "name_prefix", ""))
    },
  )

  depends_on = [aws_lb.nlb_this]

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_lb_listener" "nlb_listener_frontend_http_tcp" {
  count = var.CREATE_NLB ? length(var.NLB_HTTP_TCP_LISTENERS) : 0

  load_balancer_arn = aws_lb.nlb_this[0].arn

  port     = var.NLB_HTTP_TCP_LISTENERS[count.index]["port"]
  protocol = var.NLB_HTTP_TCP_LISTENERS[count.index]["protocol"]

  dynamic "default_action" {
    for_each = length(keys(var.NLB_HTTP_TCP_LISTENERS[count.index])) == 0 ? [] : [var.NLB_HTTP_TCP_LISTENERS[count.index]]


    content {
      type             = lookup(default_action.value, "action_type", "forward")
      target_group_arn = contains([null, "", "forward"], lookup(default_action.value, "action_type", "")) ? aws_lb_target_group.nlb_target_groups[lookup(default_action.value, "target_group_index", count.index)].id : null

      dynamic "redirect" {
        for_each = length(keys(lookup(default_action.value, "redirect", {}))) == 0 ? [] : [lookup(default_action.value, "redirect", {})]

        content {
          path        = lookup(redirect.value, "path", null)
          host        = lookup(redirect.value, "host", null)
          port        = lookup(redirect.value, "port", null)
          protocol    = lookup(redirect.value, "protocol", null)
          query       = lookup(redirect.value, "query", null)
          status_code = redirect.value["status_code"]
        }
      }

      dynamic "fixed_response" {
        for_each = length(keys(lookup(default_action.value, "fixed_response", {}))) == 0 ? [] : [lookup(default_action.value, "fixed_response", {})]

        content {
          content_type = fixed_response.value["content_type"]
          message_body = lookup(fixed_response.value, "message_body", null)
          status_code  = lookup(fixed_response.value, "status_code", null)
        }
      }
    }
  }
}

resource "aws_lb_listener" "nlb_listener_frontend_https" {
  count = var.CREATE_NLB ? length(var.NLB_HTTPS_LISTENERS) : 0

  load_balancer_arn = aws_lb.nlb_this[0].arn

  port            = var.NLB_HTTPS_LISTENERS[count.index]["port"]
  protocol        = lookup(var.NLB_HTTPS_LISTENERS[count.index], "protocol", "HTTPS")
  certificate_arn = var.NLB_HTTPS_LISTENERS[count.index]["certificate_arn"]
  ssl_policy      = lookup(var.NLB_HTTPS_LISTENERS[count.index], "ssl_policy", var.NLB_LISTENER_SSL_POLICY_DEFAULT)

  dynamic "default_action" {
    for_each = length(keys(var.NLB_HTTPS_LISTENERS[count.index])) == 0 ? [] : [var.NLB_HTTPS_LISTENERS[count.index]]


    content {
      type             = lookup(default_action.value, "action_type", "forward")
      target_group_arn = contains([null, "", "forward"], lookup(default_action.value, "action_type", "")) ? aws_lb_target_group.nlb_target_groups[lookup(default_action.value, "target_group_index", count.index)].id : null

      dynamic "redirect" {
        for_each = length(keys(lookup(default_action.value, "redirect", {}))) == 0 ? [] : [lookup(default_action.value, "redirect", {})]

        content {
          path        = lookup(redirect.value, "path", null)
          host        = lookup(redirect.value, "host", null)
          port        = lookup(redirect.value, "port", null)
          protocol    = lookup(redirect.value, "protocol", null)
          query       = lookup(redirect.value, "query", null)
          status_code = redirect.value["status_code"]
        }
      }

      dynamic "fixed_response" {
        for_each = length(keys(lookup(default_action.value, "fixed_response", {}))) == 0 ? [] : [lookup(default_action.value, "fixed_response", {})]

        content {
          content_type = fixed_response.value["content_type"]
          message_body = lookup(fixed_response.value, "message_body", null)
          status_code  = lookup(fixed_response.value, "status_code", null)
        }
      }
    }
  }

  dynamic "default_action" {
    for_each = contains(["authenticate-oidc", "authenticate-cognito"], lookup(var.NLB_HTTPS_LISTENERS[count.index], "action_type", {})) ? [var.NLB_HTTPS_LISTENERS[count.index]] : []
    content {
      type             = "forward"
      target_group_arn = aws_lb_target_group.nlb_target_groups[lookup(default_action.value, "target_group_index", count.index)].id
    }
  }
}
