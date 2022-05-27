data "aws_availability_zones" "available" {
  state = "available"
  # provider = aws.var.REGION
}
module "VPC" {
    providers = {
      # aws = aws.var.REGION
    }
    source                      = "../../../modules/VPC/1.0"
    AVAILABILITY_ZONES          = data.aws_availability_zones.available.names
    COMMON_TAGS                 = local.common_tags
    TAGS                        = var.TAGS
    FLOW_LOGS_DESTINATION       = var.FLOW_LOGS_DESTINATION
    NAME                        = var.NAME
    AZS_COUNT                   = var.AZS_COUNT
    VPC_CIDR                    = var.VPC_CIDR
    PRIVATE_SUBNETS             = var.PRIVATE_SUBNETS
    PUBLIC_SUBNETS              = var.PUBLIC_SUBNETS
    PRIVATE_SUBNETS_WITHOUT_NG  = var.PRIVATE_SUBNETS_WITHOUT_NG
    ENABLE_DNS_SUPPORT          = var.ENABLE_DNS_SUPPORT
    ENABLE_DNS_HOSTNAMES        = var.ENABLE_DNS_HOSTNAMES
    MAP_PUBLIC_IP_ON_LAUNCH     = var.MAP_PUBLIC_IP_ON_LAUNCH
    INSTANCE_TENANCY            = var.INSTANCE_TENANCY
    CREATE_VPC_FLOW_LOGS        = var.CREATE_VPC_FLOW_LOGS 
}



output "VPC" {
  value = "${module.VPC.VPC}"
  description = "default , dedicated or host ? for instance tenancy value"
}
output "VPC_ID" {
  value = "${module.VPC.VPC_ID}"
  description = <<EOH
 VPC ID of the ismaeel VPC. 
 - **Type** : String
 - **Usage** :
     - Same Request
         - \$\{VPC[index].VPC_ID}
     - Previous Request
         - import \$\{<reference name \>.VPC[index].VPC_ID}  
  EOH
}
output "VPC_CIDR" {
  value = "${module.VPC.VPC_CIDR}"
}
output "PUBLIC_SUBNETS" {
  description = "list"
  value = "${module.VPC.PUBLIC_SUBNETS}"
}
output "PUBLIC_SUBNET_IDS" {
  description = "list"
  value = "${module.VPC.PUBLIC_SUBNET_IDS}"
}
output "PUBLIC_SUBNETS_CIDR" {
  description = "list"
  value = "${module.VPC.PUBLIC_SUBNETS_CIDR}"
}
output "PRIVATE_SUBNETS" {
  description = "list"
  value = "${module.VPC.PRIVATE_SUBNETS}"
}
output "PRIVATE_SUBNETS_IDS" {
  description = "list"
  value = "${module.VPC.PRIVATE_SUBNETS_IDS}"
}
output "PRIVATE_SUBNETS_CIDR" {
  description = "list"
  value = "${module.VPC.PRIVATE_SUBNETS_CIDR}"
}
output "PRIVATE_SUBNETS_WITHOUT_NG" {
  description = "list"
  value = "${module.VPC.PRIVATE_SUBNETS_WITHOUT_NG}"
}
output "PRIVATE_SUBNETS_WITHOUT_NG_IDS" {
  description = "list"
  value = "${module.VPC.PRIVATE_SUBNETS_WITHOUT_NG_IDS}"
}
output "PRIVATE_SUBNETS_WITHOUT_NG_CIDR" {
  description = "list"
  value = "${module.VPC.PRIVATE_SUBNETS_WITHOUT_NG_CIDR}"
}