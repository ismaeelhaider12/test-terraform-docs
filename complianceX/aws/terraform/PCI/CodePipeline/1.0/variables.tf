variable "REGION" {
    type    = string
    default = ""
}
variable "RESOURCE" {
    type    = string
    default = ""
}
variable "CODE_PIPELINE_NAME" {
  type        = string
  description = "Provide name for Code Pipeline"
  default     = ""
}

variable "CODE_PIPELINE_ROLE" {
  type        = string
  description = "Provide Role ARN for Code Pipeline"
  default     = ""
}

variable "ARTIFECT_BUCKET_NAME" {
  type        = string
  description = "Provide Bucket ARN where artifects will be saved"
  default     = ""
}

variable "KMS_ARN" {
  type        = string
  description = "Provide KMS key ARN to encrypt artifects"
  default     = ""
}

variable "SOURCE_ACTION" {
  type = list(object({
    name             = string
    category         = string
    owner            = string
    provider         = string
    version          = number
    output_artifacts = list(string)
    run_order        = number
    configuration = object({
      ConnectionArn         = string
      FullRepositoryId      = string
      RepositoryName        = string
      BranchName            = string
      S3Bucket              = string
      S3ObjectKey           = string
      Owner                = string
      Repo                 = string
      PollForSourceChanges = bool
      Branch               = string
      OAuthToken           = string
    })
  }))
 default = []

}
variable "BUILD_PROJECT" {
  description = "list of variables to define build projects for build stages"
  type = list(object({
    name          = string
    description   = string
    build_timeout = number
    service_role  = string
    artifacts = list(object({
      type = string
    }))
    cache = list(object({
      type     = string
      location = string
    }))
    environment = object({
      compute_type                = string
      image                       = string
      type                        = string
      image_pull_credentials_type = string
      privileged_mode             = bool
      environment_variable = list(object({
        name  = string
        value = string
        type  = string
      }))
    })
    source = list(object({
      buildspec       = string
    }))
    vpc_config = list(object({
      vpc_id             = string
      subnets            = list(string)
      security_group_ids = list(string)
    }))
  }))

 default = []
}

variable "BUILD_APPROVAL" {

  type = list(object({
    name = string
    action = list(object({
      name     = string
      category = string
      owner    = string
      provider = string
      version  = string
      configuration = object({
        NotificationArn = string
        CustomData      = string
      })
    }))
  }))

 default = []

}

variable "BUILD_ACTION" {
  type = list(object({
    name      = string
    action= object({
    name             = string
    category         = string
    owner            = string
    provider         = string
    run_order        = number
    version          = number
    input_artifacts  = list(string)
    output_artifacts = list(string)
    configuration = object({
      ProjectName = string
    })
  })
  }))
  
  default = []
}

variable "CODEDEPLOY_APPLICATION" {
  type = list(object({
    compute_platform = string
    name             = string
  }))
  description = "Provide values for code deploy application"
  default = []
}

variable "DEPLOYMENT_CONFIG" {
  type = list(object({
    deployment_config_name = string
    minimum_healthy_hosts = list(object({
      type  = string
      value = number
    }))
  }))
  default = []
}

variable "DEPLOYMENT_GROUP" {
  type = list(object({
    app_name               = string
    deployment_group_name  = string
    service_role_arn       = string
    deployment_config_name = string
    ec2_tag_filter = list(object({
      key   = string
      type  = string
      value = string
    }))
    auto_rollback_configuration = list(object({
      enabled = bool
      events  = list(string)
    }))
    alarm_configuration = list(object({
      alarms  = list(string)
      enabled = bool
    }))
  }))
  default = []
}
variable "DEPLOY_APPROVAL" {
  type = list(object({
    name = string
    action = list(object({
      name     = string
      category = string
      owner    = string
      provider = string
      version  = string
      configuration = object({
        NotificationArn = string
        CustomData      = string
      })
    }))
  }))

  default = []
}

variable "DEPLOY_ACTION" {
  type = list(object({
    name  = string
    action=object({
    name            = string
    category        = string
    owner           = string
    provider        = string
    input_artifacts = list(string)
    version         = number
    region          = string
    configuration = object({
      ApplicationName     = string
      DeploymentGroupName = string
      ClusterName         = string
      ServiceName         = string
      FileName            = string
    })
  })
  }))
default = []
}
variable "TAGS" {
  default = {

    "TagKey" = "TagVlaue",
  }
}

