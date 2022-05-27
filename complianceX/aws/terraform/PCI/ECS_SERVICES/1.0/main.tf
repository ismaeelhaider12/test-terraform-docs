
module "ECS_SERVICES" {
      providers = {
      aws = aws.var.REGION
    }
  source                      = "../../../modules/ECS_SERVICES/1.0/"
  TAGS                        = var.TAGS
  COMMON_TAGS                 = local.common_tags

  COMPATIBILITIES             = var.COMPATIBILITIES

  LOG_GROUP_NAME              = var.LOG_GROUP_NAME
  RETENTION_DAYS              = var.RETENTION_DAYS

  CLUSTER_ARN                 = var.CLUSTER_ARN
  NETWORK_MODE                = var.NETWORK_MODE
  TASK_ROLE_ARN               = var.TASK_ROLE_ARN
  ECS_TASKS                   = var.ECS_TASKS
  SCHEDULING_STRATEGY         = var.SCHEDULING_STRATEGY
  SERVICE                     = var.SERVICE
}

########################################################
################################## OUTPUTS #############
########################################################

output "SERVICE"{
  value = "${module.ECS_SERVICES.SERVICE}"
}
output "TASK_DEFINATION"{
  value = "${module.ECS_SERVICES.TASK_DEFINATION}"
}