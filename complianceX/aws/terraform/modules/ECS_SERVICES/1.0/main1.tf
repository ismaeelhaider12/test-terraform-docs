
##########################################################
##################################### CLOUDWATCH LOGS ####
##########################################################
resource "aws_cloudwatch_log_group" "ecs-LogGroup" {

  name              = var.LOG_GROUP_NAME

  retention_in_days = var.RETENTION_DAYS

}

##########################################################
############# EC2 TYPE TASK DEFINATION & SERVICE #########
##########################################################

resource "aws_ecs_task_definition" "task-defination" {

  count = length(var.ECS_TASKS) > 0 ? length(var.ECS_TASKS) : 0

  depends_on            = [aws_cloudwatch_log_group.ecs-LogGroup]
  family                = var.ECS_TASKS[count.index].family

  container_definitions = jsonencode(var.ECS_TASKS[count.index].container_definition)

  task_role_arn            = var.TASK_ROLE_ARN
  network_mode             = var.NETWORK_MODE
  cpu                      = var.ECS_TASKS[count.index].cpu
  memory                   = var.ECS_TASKS[count.index].memory

  requires_compatibilities = [var.COMPATIBILITIES]
  execution_role_arn       = var.TASK_ROLE_ARN
  dynamic "volume" {
    for_each = var.ECS_TASKS[count.index].volume
    content {
      name      = lookup(volume.value, "name", null)
      host_path = lookup(volume.value, "host_path", null)
    }

  }


  tags = merge(
    var.COMMON_TAGS,
    var.TAGS
  )
}

resource "aws_ecs_service" "service" {

  count = length(var.SERVICE) > 0 ? length(var.SERVICE) : 0

  name                               = var.SERVICE[count.index].name
  cluster                            = var.CLUSTER_ARN
  desired_count                      = var.SERVICE[count.index].desired_count
  launch_type                        = var.COMPATIBILITIES
  depends_on                         = [aws_ecs_task_definition.task-defination]
  scheduling_strategy                = var.SCHEDULING_STRATEGY
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  task_definition = var.SERVICE[count.index].task_definition


  dynamic "network_configuration" {
    for_each = var.SERVICE[count.index].network_configuration
    content {
      subnets          = lookup(network_configuration.value, "subnets", null)
      security_groups  = lookup(network_configuration.value, "security_groups", null)
      assign_public_ip = var.COMPATIBILITIES == "FARGATE" ? true : null
    }
  }
  dynamic "load_balancer" {
    for_each = var.SERVICE[count.index].load_balancer
    content {
      target_group_arn = lookup(load_balancer.value, "target_group_arn", null)
      container_name   = lookup(load_balancer.value, "container_name", null)
      container_port   = lookup(load_balancer.value, "container_port", null)
    }

  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS
  )
}
