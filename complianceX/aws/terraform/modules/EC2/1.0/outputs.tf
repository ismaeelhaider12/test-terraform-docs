output "EC2_INSTANCES" {
  description = "List of Ec2 instances"
  value       = "${aws_instance.this_instance.*}"
}
output "EC2_INSTANCE_ID" {
  description = "List of Ec2 instance id"
  value       = "${aws_instance.this_instance.*.id}"
}
output "EC2_INSTANCE_ARN" {
  description = "List of Ec2 instance arn"
  value       = "${aws_instance.this_instance.*.arn}"
}
