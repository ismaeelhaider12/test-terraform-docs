data "template_file" "buildspec" {
  template = "${file("../../../modules/CodePipeline/1.0/ecsBuildspec/buildspec.yaml")}"
}

data "template_file" "buildspeceks" {
  template = "${file("../../../modules/CodePipeline/1.0/eksBuildspec/buildspec.yaml")}"

}

data "template_file" "buildspeceksscan" {
  template = "${file("../../../modules/CodePipeline/1.0/eksBuildspec/scanbuildspec.yaml")}"

}
module "CodePipeline" {
  providers = {
    aws = aws.var.REGION
  }
  source      = "../../../modules/CodePipeline/1.0/"
  TAGS        = var.TAGS
  COMMON_TAGS = local.common_tags
  RESOURCE    = var.RESOURCE

  ########################
  ######## Code Pipe Line

  CODE_PIPELINE_NAME  = var.CODE_PIPELINE_NAME
  CODE_PIPELINE_ROLE  = var.CODE_PIPELINE_ROLE
  ARTIFECT_BUCKET_NAME = var.ARTIFECT_BUCKET_NAME
  KMS_ARN             = var.KMS_ARN


  ########################
  ########## Source , Build & Deploy stage

  SOURCE_ACTION   = var.SOURCE_ACTION
  BUILD_APPROVAL  = var.BUILD_APPROVAL
  BUILD_ACTION    = var.BUILD_ACTION
  DEPLOY_APPROVAL = var.DEPLOY_APPROVAL
  DEPLOY_ACTION = var.DEPLOY_ACTION

  ########################
  ######### build project

  BUILD_PROJECT = var.BUILD_PROJECT

  ########################
  ######## Code deploy Application and deployment Group

  CODEDEPLOY_APPLICATION = var.CODEDEPLOY_APPLICATION
  DEPLOYMENT_CONFIG      = var.DEPLOYMENT_CONFIG
  DEPLOYMENT_GROUP       = var.DEPLOYMENT_GROUP


}

output "CODE_DEPLOY_APPLICATION_ID" {
  value = "${module.CodePipeline.CODE_DEPLOY_APPLICATION_ID}"
}

output "CODE_DEPLOY_APPLICATION_ARN" {
  value = "${module.CodePipeline.CODE_DEPLOY_APPLICATION_ARN}"
}

output "CODE_DEPLOY_DEPLOYMENT_CONFIG_ID" {
  value = "${module.CodePipeline.CODE_DEPLOY_DEPLOYMENT_CONFIG_ID}"
}

output "CODE_DEPLOY_DEPLOYMENT_GROUP_ARN" {
  value = "${module.CodePipeline.CODE_DEPLOY_DEPLOYMENT_GROUP_ARN}"
}

output "CODE_DEPLOY_DEPLOYMENT_GROUP_ID" {
  value = "${module.CodePipeline.CODE_DEPLOY_DEPLOYMENT_GROUP_ID}"
}


output "CODE_BUILD_PROJECT_ARN" {
  value = "${module.CodePipeline.CODE_BUILD_PROJECT_ARN}"
}


output "CODE_BUILD_PROJECT_NAME" {
  value = "${module.CodePipeline.CODE_BUILD_PROJECT_NAME}"
}

output "CODE_PIPELINE_ID" {
  value = "${module.CodePipeline.CODE_PIPELINE_ID}"
}

output "CODE_PIPELINE_ARN" {
  value = "${module.CodePipeline.CODE_PIPELINE_ARN}"
}
