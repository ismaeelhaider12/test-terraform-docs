output "KMS_KEY" {
  value       = "${aws_kms_key.kms_key}"
  description = "KMS Key"
}
output "KMS_KEY_ARN" {
  value       = "${aws_kms_key.kms_key.arn}"
  description = "KMS Key arn"
}
