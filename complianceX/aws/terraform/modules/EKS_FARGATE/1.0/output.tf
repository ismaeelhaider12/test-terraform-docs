
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

output "EKS_FARGATE_ARN" {
    value = toset([
    for eks-fargateProfile in aws_eks_fargate_profile.eks-fargateProfile : eks-fargateProfile.arn
    ])
}

output "EKS_FARGATE_ID" {
    value = toset([
    for eks-fargateProfile in aws_eks_fargate_profile.eks-fargateProfile : eks-fargateProfile.id
    ])
}

output "EKS_FARGATE_STATUS" {
    value = toset([
    for eks-fargateProfile in aws_eks_fargate_profile.eks-fargateProfile : eks-fargateProfile.status
    ])
}