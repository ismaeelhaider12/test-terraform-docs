
module "IAM_Role" {

    providers = {
      aws = aws.us-east-1
    }

  source                  = "../../../modules/IAM_Role/1.0"
  COMMON_TAGS             = local.common_tags
  TAGS                    = var.TAGS
  NAME                    = var.NAME
  STATEMENTS              = var.STATEMENTS
  CREATE_INSTANCE_PROFILE = var.CREATE_INSTANCE_PROFILE
  POLICIES_ARN            = var.POLICIES_ARN
  PATH                    = var.PATH
}
output "IAM_ROLE" {
  value = "${module.IAM_Role.IAM_ROLE}"
}
output "IAM_ROLE_ARN" {
  value = "${module.IAM_Role.IAM_ROLE_ARN}"
}
output "IAM_ROLE_NAME" {
  value = "${module.IAM_Role.IAM_ROLE_NAME}"
}
output "IAM_INSTANCE_PROFILE" {
  value = "${module.IAM_Role.IAM_INSTANCE_PROFILE}"
}
output "IAM_INSTANCE_PROFILE_ARN" {
  value = "${module.IAM_Role.IAM_INSTANCE_PROFILE_ARN}"
}
output "IAM_INSTANCE_PROFILE_NAME" {
  value = "${module.IAM_Role.IAM_INSTANCE_PROFILE_NAME}"
}
