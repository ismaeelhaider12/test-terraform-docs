output "RDS_READ_REPLICA_DATABASE" {
  description = "RDS Database outputs"
  value       = aws_db_instance.this_read_replica
}
output "RDS_READ_REPLICA_DATABASE_ID" {
  description = "RDS Database id"
  value       = aws_db_instance.this_read_replica.*.id
}

output "RDS_READ_REPLICA_DATABASE_ARN" {
  description = "RDS Database arn"
  value       = aws_db_instance.this_read_replica.*.arn
}
output "RDS_READ_REPLICA_DATABASE_NAME" {
  description = "RDS Database outputs"
  value       = aws_db_instance.this_read_replica.*.name
}



output "RDS_READ_REPLICA_OPTION" {
  description = "RDS Option outputs"
  value       = aws_db_option_group.this
}
