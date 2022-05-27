data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "null_resource" "k8s_kubeconfig" {
  depends_on = [ aws_eks_fargate_profile.eks-fargateProfile[0]]
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

kubectl patch deployment coredns -n kube-system --type json -p='[{"op": "remove", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type"}]'
kubectl rollout restart deployment -n kube-system coredns
kubectl get configmap aws-auth -n kube-system -o yaml | sed "s/kind: ConfigMap/  mapUsers: \| \n     \- userarn: arn:aws:iam::${data.aws_caller_identity.current.id}:role\/${var.CODEBUILD_ROLE_NAME}\n       username: codebuild\n       groups:\n         - system:masters\nkind: ConfigMap/" | kubectl replace -f -
EOH
  }
}