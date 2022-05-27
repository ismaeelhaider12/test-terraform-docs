
output "TASK_DEFINATION" {
  value = toset([
    for task-defination in aws_ecs_task_definition.task-defination : task-defination.arn
  ])
}

output "SERVICE" {
  value = toset([
    for service in aws_ecs_service.service : service.id
  ])
}