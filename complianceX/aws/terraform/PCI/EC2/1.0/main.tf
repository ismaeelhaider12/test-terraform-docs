module "EC2" {
    source = "../../../modules/EC2/1.0"
    providers = {
      aws = aws.var.REGION
    }
    COMMON_TAGS                 = local.common_tags
    TAGS                        = var.TAGS

    NAME                        = var.NAME
    AMI                         = var.AMI
    INSTANCE_TYPE               = var.INSTANCE_TYPE
    SUBNET_ID                   = var.SUBNET_ID
    EC2_SECURITY_GROUP_IDS      = var.EC2_SECURITY_GROUP_IDS
    ASSOCIATE_PUBLIC_IP_ADDRESS = var.ASSOCIATE_PUBLIC_IP_ADDRESS
    KEY_NAME                    = var.KEY_NAME
    USER_DATA                   = var.USER_DATA
    IAM_INSTANCE_PROFILE        = var.IAM_INSTANCE_PROFILE
    EBS_BLOCK_DEVICE            = var.EBS_BLOCK_DEVICE
    ROOT_BLOCK_DEVICE           = var.ROOT_BLOCK_DEVICE
    MONITORING                  = var.MONITORING
    TENANCY                     = var.TENANCY
}

output "EC2_INSTANCE" {
  value       = "${module.EC2.EC2_INSTANCES}"
}
output "EC2_INSTANCE_ID" {
  value       = "${module.EC2.EC2_INSTANCE_ID}"
}
output "EC2_INSTANCE_ARN" {
  value       = "${module.EC2.EC2_INSTANCE_ARN}"
}
