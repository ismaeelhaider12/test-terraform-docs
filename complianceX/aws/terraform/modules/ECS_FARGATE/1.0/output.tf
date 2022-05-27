
output "ECS_CLUSTER_ARN" {
  description = "ECS Cluster outputs <arn>"
  value       = aws_ecs_cluster.cluster.arn
}
output "FARGATE_TASK_DEFINATION" {
  value = toset([
    for task-defination in aws_ecs_task_definition.task-defination : task-defination.arn
  ])
}

output "FARGATE_SERVICE" {
  value = toset([
    for service in aws_ecs_service.service : service.id
  ])
}

