output "MQ_ARN" {
  value       = aws_mq_broker.this.arn
}

output "MQ_ID" {
  value       = aws_mq_broker.this.id
}

output "MQ_INSTANCES" {
  value       = aws_mq_broker.this.instances
}