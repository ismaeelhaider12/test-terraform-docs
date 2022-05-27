
module "IAM_Policy" {

    providers = {
      aws = aws.us-east-1
    }

  source            = "../../../modules/IAM_Policy/1.0"
  NAME              = var.NAME
  DESCRIPTION       = var.DESCRIPTION
  STATEMENTS        = var.STATEMENTS
  POLICY_JSON       = var.POLICY_JSON
  POLICY            = var.POLICY
}

output "IAM_POLICY" {
  value = "${module.IAM_Policy.IAM_POLICY}"
}

output "IAM_POLICY_ARN" {
  value = "${module.IAM_Policy.IAM_POLICY_ARN}"
}
output "IAM_POLICY_NAME" {
  value = "${module.IAM_Policy.IAM_POLICY_NAME}"
}