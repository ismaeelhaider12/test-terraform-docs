
##########################################################
##################################### USER DATA ##########
##########################################################

data "template_file" "template_userdata" {
  template = "${file("${path.module}/userdata/userdata.sh")}"
  vars = {
    "CLUSTER_NAME" = "${var.CLUSTER_NAME}"
  }
}

data "template_cloudinit_config" "userdata" {
  gzip          = true
  base64_encode = true
  part {
    filename     = "userdata.sh"
    content_type = "text/x-shellscript"
    content      = "${data.template_file.template_userdata.rendered}"
  }
  part {
    content_type = "text/x-shellscript"
    content      = "enycontent"
  }
}


##########################################################
##################################### CLOUDWATCH LOGS ####
##########################################################
resource "aws_cloudwatch_log_group" "ecs-LogGroup" {
  name = var.LOG_GROUP_NAME
  retention_in_days = var.RETENTION_DAYS

}


##########################################################
##################################### ECS CLUSTER ########
##########################################################

resource "aws_ecs_cluster" "cluster" {
  name = var.CLUSTER_NAME

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  configuration {
    execute_command_configuration {
      kms_key_id = var.KMS_KEY_ID
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.ecs-LogGroup.name
      }
    }
  }
  

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      "Name" = var.CLUSTER_NAME
    },
  )
}


##########################################################
################################ LAUNCH TEMPLATE #########
##########################################################

resource "aws_launch_template" "launch_template" {

  name = var.LAUNCH_TEMPLATE_NAME

  dynamic "block_device_mappings" {
		for_each = var.EBS_BLOCK_DEVICE
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
  instance_initiated_shutdown_behavior = var.INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR
  image_id                = var.AMI_ID
  instance_type = var.INSTANCE_TYPE
  key_name      = var.SSH_KEY_NAME
  user_data = "${data.template_cloudinit_config.userdata.rendered}"
  iam_instance_profile {
    name = var.INSTANCE_PROFILE_NAME
  }
  monitoring {
    enabled = var.MONITORING
  }
  network_interfaces {
    description                 = format("%s%s", var.CLUSTER_NAME, "-NetworkInterface")
    device_index                = 0
    associate_public_ip_address = var.ASSIGN_PUBLIC_IP
    delete_on_termination       = var.DELETE_ON_TERMINATION
    security_groups             = var.SECURITY_GROUPS
  }

  tag_specifications {
    resource_type = "volume"
    tags = merge(
      {
        "Name" = format("%s%s", "${var.CLUSTER_NAME}-Launch-Template", "-Volume")
      },
      var.COMMON_TAGS,
      var.TAGS,
    )
  }
  
  tag_specifications {
    resource_type = "instance"
    tags = merge(
      {
        "Name" = format("%s%s", "${var.CLUSTER_NAME}-Launch-Template", "-Instance")
      },
      var.COMMON_TAGS,
      var.TAGS,
    )
  }
  tags = merge(
    {
        "Name" = format("%s", "${var.CLUSTER_NAME}-Launch-Template")
    },
     var.COMMON_TAGS,
     var.TAGS,
  )
  lifecycle {
    create_before_destroy = true
  }

}
##########################################################
########################## AUTU SCALING GROUP ############
##########################################################

resource "aws_autoscaling_group" "ecs" {

  name                 = var.AUTOSCALING_NAME
  vpc_zone_identifier  = var.SUBNETS
  min_size             = var.MIN_SIZE
  max_size             = var.MAX_SIZE
  desired_capacity     = var.DESIRED_CAPACITY
  health_check_grace_period = var.HEALTH_CHECK_GRACE_PERIOD

  default_cooldown          = var.DEFAULT_COOLDOWN
  force_delete              = var.FORCE_DELETE
  termination_policies      = var.TERMINATION_POLICIES
  suspended_processes       = var.SUSPENDED_PROCESSES
  placement_group           = var.PLACEMENT_GROUP
  enabled_metrics           = var.ENABLED_METRICS
  metrics_granularity       = var.METRICS_GRANULARITY
  service_linked_role_arn   = var.SERVICE_LINKED_ROLE_ARN
  max_instance_lifetime     = var.MAX_INSTANCE_LIFETIME

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }

    lifecycle {
    create_before_destroy = true
  }

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
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

}

##########################################################
############# EC2 TYPE TASK DEFINATION & SERVICE #########
##########################################################

resource "aws_ecs_task_definition" "task-defination" {
  count = length(var.ECS_TASKS) > 0 ? length(var.ECS_TASKS) : 0
  depends_on = [aws_ecs_cluster.cluster,aws_cloudwatch_log_group.ecs-LogGroup]
  family   = var.ECS_TASKS[count.index].family
  container_definitions = jsonencode(var.ECS_TASKS[count.index].container_definition)

  task_role_arn            = var.TASK_ROLE_ARN
  network_mode             = var.NETWORK_MODE
  cpu                      = var.ECS_TASKS[count.index].cpu
  memory                   = var.ECS_TASKS[count.index].memory
  requires_compatibilities = ["EC2"]
  execution_role_arn       = var.EXECUTION_ROLE_ARN
  dynamic "volume" {
          for_each = var.ECS_TASKS[count.index].volume
          content {
    name      = lookup(volume.value, "name", null)
    host_path = lookup(volume.value, "host_path", null)
  }
  }


  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
     {
        "Name" = format("%s", "${var.CLUSTER_NAME}-Task-Defination")
    },
  )
}

resource "aws_ecs_service" "service" {
  count = length(var.SERVICE) > 0 ? length(var.SERVICE) : 0

  name          = var.SERVICE[count.index].name
  cluster       = aws_ecs_cluster.cluster.id
  desired_count = var.SERVICE[count.index].desired_count
  launch_type   = "EC2"
  depends_on = [aws_ecs_cluster.cluster,
  aws_ecs_task_definition.task-defination]
  scheduling_strategy                = var.SCHEDULING_STRATEGY
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200

  task_definition = var.SERVICE[count.index].task_definition

 dynamic "load_balancer" {
          for_each =  var.SERVICE[count.index].load_balancer
          content {
        target_group_arn = lookup(load_balancer.value, "target_group_arn", null)
        container_name =  lookup(load_balancer.value, "container_name", null)
        container_port =  lookup(load_balancer.value, "container_port", null)
  }
  }
  
 dynamic "network_configuration"{
        for_each = var.SERVICE[count.index].network_configuration

        content {
    security_groups = lookup(network_configuration.value, "security_groups", [])
    subnets = lookup(network_configuration.value, "subnets", [])
    assign_public_ip  = lookup(network_configuration.value, "assign_public_ip", false)
 }
 }


  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
        "Name" = format("%s", "${var.CLUSTER_NAME}-Service")
    }
  )
}
