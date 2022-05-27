
module "EKS" {
    providers = {
      aws = aws.var.REGION
    }
  source                      = "../../../modules/SERVICE_ACCOUNT/1.0"
  TAGS                        = var.TAGS
  COMMON_TAGS                 = local.common_tags
  serviceaccount              = var.serviceaccount
  CLUSTER_NAME                = var.CLUSTER_NAME
}

####################
## OUTPUTS  #######
###################
