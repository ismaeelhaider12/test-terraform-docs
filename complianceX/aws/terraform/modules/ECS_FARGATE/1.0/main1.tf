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
############# FARGATE TASK DEFINATION & SERVICE ##########
##########################################################
resource "aws_ecs_task_definition" "task-defination" {
  count = length(var.ECS_TASKS) > 0 ? length(var.ECS_TASKS) : 0
  depends_on = [aws_ecs_cluster.cluster,aws_cloudwatch_log_group.ecs-LogGroup]
  family   = var.ECS_TASKS[count.index].family
  container_definitions = jsonencode(var.ECS_TASKS[count.index].container_definition)

  task_role_arn            = var.ECS_TASKS[count.index].task_role_arn
  network_mode             = var.ECS_TASKS[count.index].network_mode
  cpu                      = var.ECS_TASKS[count.index].cpu
  memory                   = var.ECS_TASKS[count.index].memory
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = var.ECS_TASKS[count.index].execution_role_arn

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
  launch_type   = "FARGATE"
  depends_on    = [aws_ecs_cluster.cluster, aws_ecs_task_definition.task-defination]
  scheduling_strategy                = var.SERVICE[count.index].scheduling_strategy
  deployment_minimum_healthy_percent = var.SERVICE[count.index].deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.SERVICE[count.index].deployment_maximum_percent

  task_definition = var.SERVICE[count.index].task_definition

  network_configuration {
    subnets          = var.SERVICE[count.index].subnets 
    security_groups  = var.SERVICE[count.index].security_groups
    assign_public_ip = var.SERVICE[count.index].assign_public_ip
  }

 dynamic "load_balancer" {
          for_each = var.SERVICE[count.index].load_balancer  
          content {
        target_group_arn = lookup(load_balancer.value, "target_group_arn", null)
        container_name =  lookup(load_balancer.value, "container_name", null)
        container_port =  lookup(load_balancer.value, "container_port", null)
  }
  }
  
  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      Name = "${var.CLUSTER_NAME}-fargate-Service"
    },
  )
}
