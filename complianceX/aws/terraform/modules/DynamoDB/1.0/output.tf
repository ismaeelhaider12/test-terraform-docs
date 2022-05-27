output "DYNAMODB_TABLE_ARN" {
  value       = aws_dynamodb_table.default.arn
}

output "DYNAMODB_TABLE_ID" {
  value       = aws_dynamodb_table.default.id
}

output "DYNAMODB_TABLE_STREAM_ARN" {
  value       = aws_dynamodb_table.default.stream_arn
}


output "DYNAMODB_TABLE_STREAM_LABEL" {
  value       = aws_dynamodb_table.default.stream_label
}
