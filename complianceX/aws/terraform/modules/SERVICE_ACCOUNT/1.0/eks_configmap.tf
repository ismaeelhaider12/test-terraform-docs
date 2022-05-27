data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "null_resource" "k8s_kubeconfig" {
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

EOH
  }
}

resource "null_resource" "serviceaccount" {
  depends_on = [ null_resource.k8s_kubeconfig ]
  triggers = {
        build_number = "${timestamp()}"
    }

 count = length(var.serviceaccount)
  provisioner "local-exec" {
    command = <<EOH
name=${var.serviceaccount[count.index]["name"]}
namespace=${var.serviceaccount[count.index]["namespace"]}
POLICY_ARN=${var.serviceaccount[count.index]["policy_arn"]}
sed -e "s/SERVICEACCOUNTNAMEHOLDER/$${name}/g" -e "s/SERVICEACCOUNTNAMESPACE/$${namespace}/g" serviceaccount.yaml | kubectl apply -f - 
eksctl create iamserviceaccount --cluster=${var.CLUSTER_NAME} --namespace=kube-system  --name=$${name} --attach-policy-arn=$${POLICY_ARN} --override-existing-serviceaccounts  --region ${data.aws_region.current.name}   --approve --profile ${var.CLUSTER_NAME}
EOH
  }
}