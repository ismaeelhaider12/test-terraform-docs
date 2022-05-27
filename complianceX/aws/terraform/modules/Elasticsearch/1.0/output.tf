output "ELASTIC_SEARCH_ARN" {
  value       = aws_elasticsearch_domain.default.arn
}
output "ELASTIC_SEARCH_DOMAIN_ID" {
  value       = aws_elasticsearch_domain.default.domain_id
}
output "ELASTIC_SEARCH_DOMAIN_NAME" {
  value       = aws_elasticsearch_domain.default.domain_name
}
output "ELASTIC_SEARCH_ENDPOINT" {
  value       = aws_elasticsearch_domain.default.endpoint
}
output "ELASTIC_SEARCH_KIBANA_ENDPOINT" {
  value       = aws_elasticsearch_domain.default.kibana_endpoint
}