module "SecurityGroup" {
  providers = {
    aws = aws.var.REGION
  }
  source              = "../../../modules/SecurityGroup/1.0"
  COMMON_TAGS         = local.common_tags

  TAGS                = var.TAGS
  SG_NAME             = var.SG_NAME
  SG_DESCRIPTION      = var.SG_DESCRIPTION
  VPC_ID              = var.VPC_ID
  SG_INGRESS          = var.SG_INGRESS
}

#############
# OUTPUTS
#############
output "SECURITY_GROUP" {
  value       = "${module.SecurityGroup.SECURITY_GROUP}"
}
output "SECURITY_GROUP_ID" {
  value       = "${module.SecurityGroup.SECURITY_GROUP_ID}"
}
output "SECURITY_GROUP_NAME" {
  value       = "${module.SecurityGroup.SECURITY_GROUP_NAME}"
}
