output "ROUTE53_ZONE" {
  description = "Route53 zone"
  value       = var.CREATE_ZONE ? data.aws_route53_zone.this[*] : null
}

output "ROUTE53_RECORDS" {
  description = "Route53 records"
  value       = var.CREATE_RECORD && length(var.RECORDS) > 0 ? aws_route53_record.this.* : null
}
