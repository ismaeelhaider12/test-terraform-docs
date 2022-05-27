
module "Route53" {
  providers = {
    aws = aws.var.REGION
  }
  source            = "../../../modules/Route53/1.0"
  COMMON_TAGS       = local.common_tags
  TAGS              = var.TAGS
  CREATE_ZONE       = var.CREATE_ZONE
  CREATE_RECORD     = var.CREATE_RECORD
  ZONE_NAME         = var.ZONE_NAME
  DESCRIPTION       = var.DESCRIPTION
  RECORDS           = var.RECORDS
  VPCS              = var.VPCS
}

output "ROUTE53_ZONE" {
  value       = "${module.Route53.ROUTE53_ZONE}"
}
output "ROUTE53_RECORDS" {
  value       = "${module.Route53.ROUTE53_RECORDS}"
}
