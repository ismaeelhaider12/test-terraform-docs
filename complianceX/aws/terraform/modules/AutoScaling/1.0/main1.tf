#######################
# Launch template
#######################
resource "aws_launch_template" "launch_template" {

  name = "${var.TEMPLATE_NAME}"

dynamic "block_device_mappings" {
		for_each = var.ASG_EBS_BLOCK_DEVICE
		content {

      device_name  = lookup(block_device_mappings.value, "device_name", null)
      no_device    = lookup(block_device_mappings.value, "no_device", false)
      virtual_name = lookup(block_device_mappings.value, "virtual_name", "")
      dynamic "ebs" {
        for_each = [block_device_mappings.value["ebs"]]
          content {
          delete_on_termination = lookup(ebs.value, "delete_on_termination", true)
          encrypted             = true
          iops                  = lookup(ebs.value, "iops", null)
          kms_key_id            = lookup(ebs.value, "kms_key_id", "")
          snapshot_id           = lookup(ebs.value, "snapshot_id", null)
          volume_size           = lookup(ebs.value, "volume_size", 30)
          volume_type           = lookup(ebs.value, "volume_type", "gp2")
        }
      }
    }
}

  disable_api_termination = var.DISABLE_API_TERMINATION
  ebs_optimized           = var.EBS_OPTIMIZED
  image_id                             = var.IMAGE_ID
  instance_initiated_shutdown_behavior = var.INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR
  instance_type = var.INSTANCE_TYPE
  key_name      = var.KEY_NAME
  user_data = textencodebase64(var.ASG_USER_DATA, "UTF-8")
  iam_instance_profile {
    name = var.ASG_IAM_INSTANCE_PROFILE_NAME
  }
  monitoring {
    enabled = var.ENABLE_MONITORING
  }
  network_interfaces {
    description                 = format("%s%s", var.TEMPLATE_NAME, "-NetworkInterface")
    device_index                = 0
    associate_public_ip_address = var.ASSOCIATE_PUBLIC_IP_ADDRESS
    delete_on_termination       = true
    security_groups             = var.ASG_SECURITY_GROUP_IDS
  }
  tag_specifications {
    resource_type = "volume"
    tags = merge(
      {
        "Name" = format("%s%s", var.TEMPLATE_NAME, "-Volume")
      },
      var.COMMON_TAGS,
      var.TAGS,
    )
  }
  tag_specifications {
    resource_type = "instance"
    tags = merge(
      {
        "Name" = format("%s%s", var.TEMPLATE_NAME, "-Instance")
      },
      var.COMMON_TAGS,
      var.TAGS,
    )
  }
  tags = merge(
    {
        "Name" = format("%s", var.TEMPLATE_NAME)
    },
     var.COMMON_TAGS,
     var.TAGS,
  )
  lifecycle {
    create_before_destroy = true
  }

}


####################
# Autoscaling group
####################
resource "aws_autoscaling_group" "autoscaling_group" {
  name = "${var.ASG_NAME}"
  launch_template {
    id      = "${aws_launch_template.launch_template.id}"
    version = "${aws_launch_template.launch_template.latest_version}"
  }

  vpc_zone_identifier  = var.ASG_SUBNET_IDS
  max_size             = var.ASG_MAX_SIZE
  min_size             = var.ASG_MIN_SIZE
  desired_capacity     = var.ASG_DESIRED_CAPACITY

  load_balancers            = var.ASG_LOAD_BALANCERS
  health_check_grace_period = var.HEALTH_CHECK_GRACE_PERIOD
  health_check_type         = var.HEALTH_CHECK_TYPE

  target_group_arns         = var.ASG_TARGET_GROUP_ARNS
  default_cooldown          = var.DEFAULT_COOLDOWN
  force_delete              = var.FORCE_DELETE
  termination_policies      = var.TERMINATION_POLICIES
  suspended_processes       = var.SUSPENDED_PROCESSES
  placement_group           = var.PLACEMENT_GROUP
  enabled_metrics           = var.ENABLED_METRICS
  metrics_granularity       = var.METRICS_GRANULARITY
  wait_for_capacity_timeout = var.WAIT_FOR_CAPACITY_TIMEOUT
  protect_from_scale_in     = var.PROTECT_FROM_SCALE_IN
  service_linked_role_arn   = var.SERVICE_LINKED_ROLE_ARN
  max_instance_lifetime     = var.MAX_INSTANCE_LIFETIME

   dynamic "tag" {
    for_each = var.COMMON_TAGS
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = false
    }
  }
  
  dynamic "tag" {
      for_each = var.INSTANCE_TAGS
      content {
      key               = tag.key
      value             = tag.value
      propagate_at_launch = true
      }
  }
}


#################
# ScalingPolicies
#################
resource "aws_autoscaling_policy" "scaling_policies" {
  count = length(var.ASG_SCALING_POLICIES) > 0 ? length(var.ASG_SCALING_POLICIES) : 0

  name                   = lookup(var.ASG_SCALING_POLICIES[count.index], "name", null)
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling_group.name}"
  estimated_instance_warmup = lookup(var.ASG_SCALING_POLICIES[count.index], "estimated_warmup", 300)
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = lookup(var.ASG_SCALING_POLICIES[count.index], "metric_type", null)
    }

    target_value = lookup(var.ASG_SCALING_POLICIES[count.index], "target_value", null)
  }
}


###################
# Schedule Scaling
###################
resource "aws_autoscaling_schedule" "autoscaling_schedule" {
  count = length(var.ASG_SCHEDULE_SCALING) > 0 ? length(var.ASG_SCHEDULE_SCALING) : 0
  scheduled_action_name  = lookup(var.ASG_SCHEDULE_SCALING[count.index], "scheduled_action_name", null)
  min_size               = lookup(var.ASG_SCHEDULE_SCALING[count.index], "min_size", null)
  max_size               = lookup(var.ASG_SCHEDULE_SCALING[count.index], "max_size", null)
  desired_capacity       = lookup(var.ASG_SCHEDULE_SCALING[count.index], "desired_capacity", null)
  recurrence             = lookup(var.ASG_SCHEDULE_SCALING[count.index], "recurrence", null)
  start_time             = lookup(var.ASG_SCHEDULE_SCALING[count.index], "start_time", null)
  end_time               = lookup(var.ASG_SCHEDULE_SCALING[count.index], "end_time", null)
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling_group.name}"
}


#######################
# Scaling Notifications
#######################

resource "aws_autoscaling_notification" "autoscaling_notification" {
  count = length(var.ASG_ACTIVITY_NOTIFICATIONS) > 0 ? length(var.ASG_ACTIVITY_NOTIFICATIONS) : 0

  group_names = ["${aws_autoscaling_group.autoscaling_group.name}"]
  notifications = lookup(var.ASG_ACTIVITY_NOTIFICATIONS[count.index], "notifications", null)
  topic_arn = lookup(var.ASG_ACTIVITY_NOTIFICATIONS[count.index], "topic_arn", null)
}


