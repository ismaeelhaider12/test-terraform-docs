output "RDS_DATABASE" {
  description = "RDS Database outputs"
  value       = aws_db_instance.this
}

output "RDS_DATABASE_ID" {
  description = "RDS Database outputs"
  value       = aws_db_instance.this.*.id
}
output "RDS_DATABASE_NAME" {
  description = "RDS Database outputs"
  value       = aws_db_instance.this.*.name
}
output "RDS_DATABASE_ARN" {
  description = "RDS Database outputs"
  value       = aws_db_instance.this.*.arn
}

output "RDS_DATABASE_ENDPOINT" {
  description = "RDS Database endpoint"
  value       = aws_db_instance.this.*.address
}

output "RDS_SUBNET_GROUP" {
  description = "RDS Subnet group outputs"
  value       = aws_db_subnet_group.this
}
output "RDS_PARAMETER_GROUP" {
  description = "RDS Parameter group outputs"
  value       = aws_db_parameter_group.this_db_parameter_group
}
output "RDS_OPTION" {
  description = "RDS Option outputs"
  value       = aws_db_option_group.this
}