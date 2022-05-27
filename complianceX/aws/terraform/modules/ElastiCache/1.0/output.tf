output "ElastiCache_ARN" {
  value       = aws_elasticache_cluster.default.arn
}
output "ElastiCache_ENGION_VERSION" {
  value       = aws_elasticache_cluster.default.engine_version_actual
}
output "ElastiCache_CACHE_NODES" {
  value       = aws_elasticache_cluster.default.cache_nodes
}
output "ElastiCache_DNS_NAME" {
  value       = aws_elasticache_cluster.default.cluster_address
}
output "ElastiCache_CONFIG_ENDPOINT" {
  value       = aws_elasticache_cluster.default.configuration_endpoint
}