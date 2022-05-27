
module "ECS" {
      providers = {
      aws = aws.var.REGION
    }
  source                      = "../../../modules/ECS_FARGATE/1.0"
  TAGS                        = var.TAGS
  COMMON_TAGS                 = local.common_tags
  LOG_GROUP_NAME              = var.LOG_GROUP_NAME
  RETENTION_DAYS              = var.RETENTION_DAYS
##########################
########### Cluster Params
  CLUSTER_NAME                = var.CLUSTER_NAME
  KMS_KEY_ID                  = var.KMS_KEY_ID
  ECS_TASKS                   = var.ECS_TASKS
  SERVICE                     = var.SERVICE
}

########################################################
################################## OUTPUTS #############
########################################################


output "ECS_CLUSTER_ARN"{
  value = "${module.ECS.ECS_CLUSTER_ARN}"
}

output "FARGATE_SERVICE"{
  value = "${module.ECS.FARGATE_SERVICE}"
}

output "FARGATE_TASK_DEFINATION"{
  value = "${module.ECS.FARGATE_TASK_DEFINATION}"
}
