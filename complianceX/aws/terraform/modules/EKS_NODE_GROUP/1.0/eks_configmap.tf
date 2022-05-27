data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "null_resource" "k8s_kubeconfig" {
  depends_on = [ aws_eks_node_group.eks-node-group ]
  provisioner "local-exec" {
    command = <<EOH
role_arn="{CLI_TOOL_ASSUME_IAM_ROLE_ARN}"
role_session_name=${var.CLUSTER_NAME}
profile_name=${var.CLUSTER_NAME} 
temp_role=$(aws sts assume-role \
     --role-arn $role_arn \
     --role-session-name $role_session_name)
export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $temp_role | jq -r .Credentials.SessionToken)
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID --profile $profile_name
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY --profile $profile_name
aws configure set aws_session_token $AWS_SESSION_TOKEN --profile $profile_name
aws eks update-kubeconfig --name  ${var.CLUSTER_NAME} --region ${data.aws_region.current.name} --profile $profile_name

kubectl get configmap aws-auth -n kube-system -o yaml | sed "s/kind: ConfigMap/  mapUsers: \| \n     \- userarn: arn:aws:iam::${data.aws_caller_identity.current.id}:role\/${var.CODEBUILD_ROLE_NAME}\n       username: codebuild\n       groups:\n         - system:masters\nkind: ConfigMap/" | kubectl replace -f -
eksctl utils associate-iam-oidc-provider --cluster=${var.CLUSTER_NAME} --approve --region ${data.aws_region.current.name} --profile $profile_name
kubectl apply -f ../../../modules/EKS_NODE_GROUP/1.0/userdata/Serviceaccount.yaml
eksctl create iamserviceaccount --cluster=${var.CLUSTER_NAME} --namespace=kube-system  --name=alb-ingress-controller --attach-policy-arn=${var.ALB_INGRESS_POLICY_ARN} --override-existing-serviceaccounts  --region ${data.aws_region.current.name}   --approve --profile $profile_name

EOH
  }
}

resource "null_resource" "alb_rbac" {
  depends_on = [ null_resource.k8s_kubeconfig]
  provisioner "local-exec" {
    command = <<EOH

    role_arn="{CLI_TOOL_ASSUME_IAM_ROLE_ARN}"
role_session_name=${var.CLUSTER_NAME}
profile_name=${var.CLUSTER_NAME} 
temp_role=$(aws sts assume-role \
     --role-arn $role_arn \
     --role-session-name $role_session_name)
export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq -r .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq -r .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(echo $temp_role | jq -r .Credentials.SessionToken)
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID --profile $profile_name
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY --profile $profile_name
aws configure set aws_session_token $AWS_SESSION_TOKEN --profile $profile_name
aws eks update-kubeconfig --name  ${var.CLUSTER_NAME} --region ${data.aws_region.current.name} --profile $profile_name

kubectl apply -f ../../../modules/EKS_NODE_GROUP/1.0/userdata/rbacrole.yaml
kubectl apply -f ../../../modules/EKS_NODE_GROUP/1.0/userdata/rolebinding.yaml
EOH
  }
}