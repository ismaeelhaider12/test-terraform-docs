output "AURORA_DATABASE_INSTANCE" {
  description = "AURORA Database Instances outputs"
  value       = var.ENGINE_MODE == "provisioned" ? aws_rds_cluster_instance.this : null
}

output "AURORA_DATABASE_INSTANCE_ARN" {
  description = "AURORA Database Cluster arn outputs"
  value       = var.ENGINE_MODE == "provisioned" ? aws_rds_cluster_instance.this.*.arn : null
}
output "AURORA_DATABASE_INSTANCE_ID" {
  description = "AURORA Database Cluster id outputs"
  value       = var.ENGINE_MODE == "provisioned" ? aws_rds_cluster_instance.this.*.id : null
}

output "AURORA_DATABASE_CLUSTER" {
  description = "AURORA Database Cluster outputs"
  value       = aws_rds_cluster.this
}
output "AURORA_DATABASE_CLUSTER_ARN" {
  description = "AURORA Database Cluster arn outputs"
  value       = aws_rds_cluster.this.*.arn
}
output "AURORA_DATABASE_CLUSTER_ID" {
  description = "AURORA Database Cluster id outputs"
  value       = aws_rds_cluster.this.*.id
}
output "AURORA_SUBNET_GROUP" {
  description = "AURORA Subnet group outputs"
  value       = var.DB_SUBNET_GROUP_NAME == "" ? aws_db_subnet_group.this : null
}
output "AURORA_CLUSTER_PARAMETER_GROUP" {
  description = "AURORA cluster Parameter group outputs"
  value       = aws_rds_cluster_parameter_group.rds_cluster_parameter_group
}

output "AURORA_DB_PARAMETER_GROUP" {
  description = "AURORA Parameter group outputs"
  value       = aws_db_parameter_group.parameter_group_default
}
