output "CLUSTER_ARN" {
  value       = aws_redshift_cluster.default.arn
}

output "CLUSTER_ID" {
  value       = aws_redshift_cluster.default.id
}

output "CLUSTER_IDENTIFIER" {
  value       = aws_redshift_cluster.default.cluster_identifier
}

output "CLUSTER_DATABASE_NAME" {
  value       = aws_redshift_cluster.default.database_name
}

output "CLUSTER_DNS_NAME" {
  value       = aws_redshift_cluster.default.dns_name
}

output "CLUSTER_ENDPOINTS" {
  value       = aws_redshift_cluster.default.endpoint
}
output "CLUSTER_PUBLIC_KEY" {
  value       = aws_redshift_cluster.default.cluster_public_key
}
