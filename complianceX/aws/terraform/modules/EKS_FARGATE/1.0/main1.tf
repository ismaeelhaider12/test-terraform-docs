
################################################################
##################################### Control Plane Logging ####
################################################################

resource "aws_cloudwatch_log_group" "cluster-logs" {
  name = "${var.CLUSTER_NAME}-Log-Group"
  retention_in_days = var.LOGS_RETENTION_IN_DAYS

  tags = {
    Name = "${var.CLUSTER_NAME}-Log-Group"
  }
}
######################################################
##################################### EKS Cluster ####
######################################################

resource "aws_eks_cluster" "eks" {
  name     = var.CLUSTER_NAME
  version  = var.KUBERNETES_VERSION
  role_arn = var.CLUSTER_ROLE_ARN
  enabled_cluster_log_types = var.LOGGING_TYPE
 
  encryption_config {
        resources = [ "secrets" ]
        provider {
            key_arn = var.KMS_ARN
        }
    }

  vpc_config {
    security_group_ids = var.SECURITY_GROUP_IDS
    subnet_ids         = var.CLUSTER_SUBNET_IDS
    endpoint_private_access = var.ENDPOINT_PRIVATE_ACCESS
    endpoint_public_access  = var.ENDPOINT_PUBLIC_ACCESS
    public_access_cidrs     = var.PUBLIC_ACCESS_CIDRS
  }

  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      "Name" = var.CLUSTER_NAME
    },
  )
}

##########################################################
##################################### fargate profile ####
##########################################################

resource "aws_eks_fargate_profile" "eks-fargateProfile" {
  count = length(var.FARGATE_PROFILE) > 0 ? length(var.FARGATE_PROFILE) : 0

  cluster_name           = var.CLUSTER_NAME
  fargate_profile_name   = var.FARGATE_PROFILE[count.index].fargate_profile_name
  pod_execution_role_arn = var.FARGATE_PROFILE[count.index].pod_execution_role_arn
  subnet_ids             = var.FARGATE_PROFILE[count.index].subnet_ids

  dynamic "selector" {
    for_each = var.FARGATE_PROFILE[count.index].selector
    content {
    namespace = lookup(selector.value, "namespace", null)
  }
  }

  depends_on = [
    aws_eks_cluster.eks
  ]


  tags = merge(
    var.COMMON_TAGS,
    var.TAGS,
    {
      "kubernetes.io/cluster/${var.CLUSTER_NAME}" = "shared"
    }
  )
}