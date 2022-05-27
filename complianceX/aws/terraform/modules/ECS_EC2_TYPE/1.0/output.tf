output "LAUNCH_TEMPLATE_ARN" {
  description = "launch template outputs <arn>"
  value       = aws_launch_template.launch_template[*].arn
}
output "LAUNCH_TEMPLATE_ID" {
  description = "launch template outputs <id>"
  value       = aws_launch_template.launch_template[*].id
}
output "ECS_CLUSTER_ARN" {
  description = "ECS Cluster outputs <arn>"
  value       = aws_ecs_cluster.cluster.arn
}
output "AUTOSCALING_GROUP_ID" {
  description = "ECS AutoScaling Group <id>"
  value       = aws_autoscaling_group.ecs[*].id
}
output "AUTOSCALING_GROUP_ARN" {
  description = "ECS AutoScaling Group <arn>"
  value       = aws_autoscaling_group.ecs[*].arn
}

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