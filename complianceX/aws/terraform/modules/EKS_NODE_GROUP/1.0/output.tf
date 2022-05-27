output "LAUNCH_TEMPLATE_ARN" {
  description = "launch template outputs <arn>"
  value       = aws_launch_template.launch_template[*].arn
}
output "LAUNCH_TEMPLATE_ID" {
  description = "launch template outputs <id>"
  value       = aws_launch_template.launch_template[*].id
}
output "EKS_CLUSTER_ARN" {
  description = "EKS Cluster outputs <arn>"
  value       = aws_eks_cluster.eks[*].arn
}

output "EKS_CLUSTER_ENDPOINT" {
  description = "EKS Cluster outputs <endpoint>"
  value       = aws_eks_cluster.eks[*].endpoint
}
output "EKS_CLUSTER_ID" {
  description = "EKS Cluster outputs <id>"
  value       = aws_eks_cluster.eks[*].id
}
output "EKS_NODE_GROUP_ARN" {
  description = "EKS Node Group outputs <arn>"
  value       = aws_eks_node_group.eks-node-group[*].arn
}

output "EKS_NODE_GROUP_ID" {
  description = "EKS Node Group outputs <id>"
  value       = aws_eks_node_group.eks-node-group[*].id
}
output "EKS_NODE_GROUP_STATUS" {
  description = "EKS Node Group outputs <status>"
  value       = aws_eks_node_group.eks-node-group[*].status
}
