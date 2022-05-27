---
layout: comx
title: Code Pipeline
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/code-pipeline/index.html
---
# Code Pipeline
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
# CodePipeLine
> AWS CodePipeline is a fully managed continuous delivery service that helps you automate your release pipelines for fast and reliable application and infrastructure updates. CodePipeline automates the build, test, and deploy phases of your release process every time there is a code change, based on the release model you define.

To create this entity in your **Litmus Scale** template, use the following data:

```
{
    "RESOURCE": "str",
    "CODE_PIPELINE_NAME": "str",
    "CODE_PIPELINE_ROLE": "str",
    "ARTIFECT_BUCKET_NAME": "str",
    "KMS_ARN": "str",
    "SOURCE_ACTION": [
    {
        "name": "str",
        "category": "str",
        "owner": "str",
        "provider": "str",
        "version": "int",
        "output_artifacts": "list",
        "run_order": "int",
        "configuration": {
        "ConnectionArn": "str",
        "FullRepositoryId": "str",
        "RepositoryName": "str",
        "BranchName": "str",
        "S3Bucket": "str",
        "S3ObjectKey": "str",
        "Owner": "str",
        "Repo": "str",
        "PollForSourceChanges": "bool",
        "Branch": "str",
        "OAuthToken": "str"
        }
    }
    ],
    "BUILD_PROJECT": [
    {
        "name": "str",
        "description": "str",
        "build_timeout": "int",
        "service_role": "str",
        "artifacts": [
        {
            "type": "str"
        }
        ],
        "cache": [
        {
            "type": "str",
            "location": "str"
        }
        ],
        "environment": {
        "compute_type": "str",
        "image": "str",
        "type": "str",
        "image_pull_credentials_type": "str",
        "privileged_mode": "bool",
        "environment_variable": [
            {
            "name": "str",
            "value": "str",
            "type": "str"
            }
        ]
        },
        "source": [
        {
            "buildspec": "str"
        }
        ],
        "vpc_config": [
        {
            "vpc_id": "str",
            "subnets": "list",
            "security_group_ids": "list"
        }
        ]
    }
    ],
    "BUILD_APPROVAL": [
    {
        "name": "str",
        "action": [
        {
            "name": "str",
            "category": "str",
            "owner": "str",
            "provider": "str",
            "version": "str",
            "configuration": {
            "NotificationArn": "str",
            "CustomData": "str"
            }
        }
        ]
    }
    ],
    "BUILD_ACTION": [
    {
        "name": "str",
        "action": {
        "name": "str",
        "category": "str",
        "owner": "str",
        "provider": "str",
        "run_order": "int",
        "version": "int",
        "input_artifacts": "list",
        "output_artifacts": "list",
        "configuration": {
            "ProjectName": "str"
        }
        }
    }
    ],
    "CODEDEPLOY_APPLICATION": [
    {
        "compute_platform": "str",
        "name": "str"
    }
    ],
    "DEPLOYMENT_CONFIG": [
    {
        "deployment_config_name": "str",
        "minimum_healthy_hosts": [
        {
            "type": "str",
            "value": "int"
        }
        ]
    }
    ],
    "DEPLOYMENT_GROUP": [
    {
        "app_name": "str",
        "deployment_group_name": "str",
        "service_role_arn": "str",
        "deployment_config_name": "str",
        "ec2_tag_filter": [
        {
            "key": "str",
            "type": "str",
            "value": "str"
        }
        ],
        "auto_rollback_configuration": [
        {
            "enabled": "bool",
            "events": "list"
        }
        ],
        "alarm_configuration": [
        {
            "alarms": "list",
            "enabled": "bool"
        }
        ]
    }
    ],
    "DEPLOY_APPROVAL": [
    {
        "name": "str",
        "action": [
        {
            "name": "str",
            "category": "str",
            "owner": "str",
            "provider": "str",
            "version": "str",
            "configuration": {
            "NotificationArn": "str",
            "CustomData": "str"
            }
        }
        ]
    }
    ],
    "DEPLOY_ACTION": [
    {
        "name": "str",
        "action": {
        "name": "str",
        "category": "str",
        "owner": "str",
        "provider": "str",
        "input_artifacts": "list",
        "version": "int",
        "region": "str",
        "configuration": {
            "ApplicationName": "str",
            "DeploymentGroupName": "str",
            "ClusterName": "str",
            "ServiceName": "str",
            "FileName": "str"
        }
        }
    }
    ],
    "TAGS": "str"
}

```

## Properties
---
### RESOURCE
The Resource on which you want to deploy.
- **Required** : Yes
- **Type** : String
- **Allowed Value** :
    - EKS
    - ECS

### CODE_PIPELINE_NAME
The name of the pipeline.
- **Required** : Yes
- **Type** : String

### CODE_PIPELINE_ROLE
A service role Amazon Resource Name (ARN) that grants AWS CodePipeline permission to make calls to AWS services on your behalf
- **Required** : Yes
- **Type** : String

### ARTIFECT_BUCKET_NAME
The location where AWS CodePipeline stores artifacts for a pipeline.
- **Required** : Yes
- **Type**: String

### KMS_ARN
The encryption key block AWS CodePipeline uses to encrypt the data in the artifact store, such as an AWS Key Management Service (AWS KMS) key.
- **Required** : Yes
- **Type**: String

### SOURCE_ACTION
The action(s) to include in the stage
- **Required** : Yes
- **Type**: List of Source Action
- **Source Action Body**:
    - **name**:
        - *The name of the stage.*
            - **Required** : Yes
            - **Type** : String
    - **category**:
        - * category defines what kind of action can be taken in the stage, and constrains the provider type for the action.*
            - **Required** : Yes
            - **Type** : String
    - **owner**:
        - *The creator of the action being called.*
            - **Required** : Yes
            - **Type** : String
    - **provider**:
        - *The provider of the service being called by the action. Valid providers are determined by the action category.*
            - **Required** : Yes
            - **Type** : String
    - **version**:
        - *A string that identifies the action type.*
            - **Required** : Yes
            - **Type** : String
    - **input_artifacts**:
        - *A list of artifact names to be worked on.*
            - **Required** : Yes
            - **Type** : List of Strings
    - **output_artifacts**:
        - *A list of artifact names to output. Output artifact names must be unique within a pipeline.*
            - **Required** : Yes
            - **Type** : List of Strings
    - **run_order**:
        - *The order in which actions are run.*
            - **Required** : Yes
            - **Type** : Integer
    - **configuration**:
        - *A map of the action declaration's configuration*
            - **Required** : Yes
            - **Type** : Object of Configuration 
            - **Configuration Body**:
                - **ConnectionArn**:
                    - *The connection ARN that is configured and authenticated for the source provider.*
                        - **Required** : No
                        - **Type** : String
                - **FullRepositoryId**:
                    - *The owner and name of the repository where source changes are to be detected*
                        - **Required** : No
                        - **Type** : String
                - **RepositoryName**:
                    - *The name of the repository where the commit that triggered the pipeline was made*
                        - **Required** : No
                        - **Type** : String
                - **BranchName**:
                    - *The name of the branch where source changes are to be detected.*
                        - **Required** : No
                        - **Type** : Integer
                - **S3Bucket**:
                    - *The name of the Amazon S3 bucket where source changes are to be detected..*
                        - **Required** : No
                        - **Type** : String
                - **S3ObjectKey**:
                    - *The name of the Amazon S3 object key where source changes are to be detected.*
                        - **Required** : No
                        - **Type** : String
                - **Owner**:
                    - *Owner of the repository*
                        - **Required** : No
                        - **Type** : String
                - **Repo**:
                    - *The name of the repository where the commit that triggered the pipeline was made.*
                        - **Required** : No
                        - **Type** : String
                - **PollForSourceChanges**:
                    - *PollForSourceChanges controls whether CodePipeline polls the GitHub repository for source changes.*
                        - **Required** : No
                        - **Type** : String
                - **Branch**:
                    - *The name of the branch where source changes are to be detected.*
                        - **Required** : No
                        - **Type** : String
                - **OAuthToken**:
                    - *Represents the GitHub authentication token that allows CodePipeline to perform operations on your GitHub repository.*
                        - **Required** : No
                        - **Type** : String


### BUILD_PROJECT
Provides a CodeBuild Project resource
- **Required** : No
- **Type**: List of Build Project
- **Build Project Body**:
    - **name**:
        - *Project's name*
            - **Required** : Yes
            - **Type** : String
    - **description**:
        - *Short description of the project*
            - **Required** : Yes
            - **Type** : String
    - **build_timeout**:
        - *Number of minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed.*
            - **Required** : Yes
            - **Type** : Integer
    - **service_role**:
        - *Specifies the service role ARN for the batch build project.*
            - **Required** : Yes
            - **Type** : String
 
    - **artifacts**:
        - *Configuration block*
            - **Required** : Yes
            - **Type** : List of Artifcats
            - **Artificat Body**:
                - **type**:
                    - *Build output artifact's type.*
                        - **Required** : Yes
                        - **Type** : String
    - **cache**:
         - *Configuration block.*
            - **Required** : Yes
            - **Type** : String
            - **Source Action Body**:
                - **type**:
                    - *Type of storage that will be used for the AWS CodeBuild project cache.*
                        - **Required** : Yes
                        - **Type** : String
                - **location**:
                    - *Location where the AWS CodeBuild project stores cached resources.*
                        - **Required** : Yes
                        - **Type** : String
    - **environment**:
        - *Configuration block.*
            - **Required** : Yes
            - **Type** : Object of Configuration 
            - **Configuration Body**:
                - **compute_type**:
                    - *Information about the compute resources the build project will use. Valid values: BUILD_GENERAL1_SMALL, BUILD_GENERAL1_MEDIUM, BUILD_GENERAL1_LARGE, BUILD_GENERAL1_2XLARGE. BUILD_GENERAL1_SMALL is only valid if type is set to LINUX_CONTAINER. When type is set to LINUX_GPU_CONTAINER, compute_type must be BUILD_GENERAL1_LARGE*
                        - **Required** : Yes
                        - **Type** : String
                - **image**:
                    - *TDocker image to use for this build project*
                        - **Required** : Yes
                        - **Type** : String
                - **type**:
                    - *Type of build environment to use for related builds. Valid values: LINUX_CONTAINER, LINUX_GPU_CONTAINER, WINDOWS_CONTAINER (deprecated), WINDOWS_SERVER_2019_CONTAINER, ARM_CONTAINER.*
                        - **Required** : Yes
                        - **Type** : String
                - **image_pull_credentials_type**:
                    - *Type of credentials AWS CodeBuild uses to pull images in your build. Valid values: CODEBUILD, SERVICE_ROLE.*
                        - **Required** : Yes
                        - **Type** : String
                - **privileged_mode**:
                    - *Whether to enable running the Docker daemon inside a Docker container.*
                        - **Required** : Yes
                        - **Type** : Boolean
                - **environment_variable**:
                     - *Configuration Block.*
                        - **Required** : No
                        - **Type** : List of Environment Variables
                        - **Environment Variable Body**:
                            - **name**:
                                - *Environment variable's name or key.*
                                    - **Required** : Yes
                                    - **Type** : String
                            - **value**:
                                - *Environment variable's value.*
                                    - **Required** : Yes
                                    - **Type** : String
                            - **type**:
                                - *Type of environment variable. Valid values: PARAMETER_STORE, PLAINTEXT, SECRETS_MANAGER.*
                                    - **Required** : Yes
                                    - **Type** : String
                - **source**:
                    - *Configuration Block.*
                        - **Required** : Yes
                        - **Type** : List of Sources
                        - **Source Body**:
                            - **buildspec**:
                                - *Build specification to use for this build project's related builds.*
                                    - **Required** : Yes
                                    - **Type** : String
                - **vpc_config**:
                    - *Configuration block.*
                        - **Required** : No
                        - **Type** : List of VPC Configs
                        - **VPC Config Body**:
                            - **vpc_id**:
                                - *ID of the VPC within which to run builds.*
                                    - **Required** : Yes
                                    - **Type** : List of Strings
                            - **subnets**:
                                - *Subnet IDs within which to run builds.*
                                    - **Required** : Yes
                                    - **Type** : List of Strings
                            - **security_group_ids**:
                                - *Security group IDs to assign to running builds*
                                    - **Required** : Yes
                                    - **Type** : List of Strings

### BUILD_APPROVAL
The action(s) to include in the stage
- **Required** : Yes
- **Type**: List of Build Approvals
- **Build Approval Body**:
    - **name**:
        - *The name of the stage.*
            - **Required** : Yes
            - **Type** : String
    - **action**:
        - *Configuration block*
            - **Required** : Yes
            - **Type** : List of Actions
            - **Action Body**:
                - **category**:
                    - * category defines what kind of action can be taken in the stage, and constrains the provider type for the action.*
                        - **Required** : Yes
                        - **Type** : String
                - **owner**:
                    - *The creator of the action being called.*
                        - **Required** : Yes
                        - **Type** : String
                - **provider**:
                    - *The provider of the service being called by the action. Valid providers are determined by the action category.*
                        - **Required** : Yes
                        - **Type** : String
                - **version**:
                    - *A string that identifies the action type.*
                        - **Required** : Yes
                        - **Type** : String
                - **configuration**:
                    - *A map of the action declaration's configuration*
                        - **Required** : Yes
                        - **Type** : Object of Configuration 
                        - **Configuration Body**:
                            - **NotificationArn**:
                                - *ARN of the notifcation*
                                    - **Required** : No
                                    - **Type** : String
                            - **CustomData**:
                                - *Custom Data for notification*
                                    - **Required** : No
                                    - **Type** : String
                

### BUILD_ACTION
The action(s) to include in the stage
- **Required** : Yes
- **Type**: List of Source Action
- **Source Action Body**:
    - **name**:
        - *The name of the stage.*
            - **Required** : Yes
            - **Type** : String
    - **action**:
        - *Configuration block*
            - **Required** : Yes
            - **Type** : List of Actions
            - **Action Body**:
                - **category**:
                    - * category defines what kind of action can be taken in the stage, and constrains the provider type for the action.*
                        - **Required** : Yes
                        - **Type** : String
                - **owner**:
                    - *The creator of the action being called.*
                        - **Required** : Yes
                        - **Type** : String
                - **provider**:
                    - *The provider of the service being called by the action. Valid providers are determined by the action category.*
                        - **Required** : Yes
                        - **Type** : String
                - **version**:
                    - *A string that identifies the action type.*
                        - **Required** : Yes
                        - **Type** : String
                - **input_artifacts**:
                    - *A list of artifact names to be worked on.*
                        - **Required** : Yes
                        - **Type** : List of Strings
                - **output_artifacts**:
                    - *A list of artifact names to output. Output artifact names must be unique within a pipeline.*
                        - **Required** : Yes
                        - **Type** : List of Strings
                - **configuration**:
                    - *A map of the action declaration's configuration*
                        - **Required** : Yes
                        - **Type** : Object of Configuration 
                        - **Configuration Body**:
                            - **ProjectName**:
                                - *Name of the project*
                                    - **Required** : Yes
                                    - **Type** : String
### CODEDEPLOY_APPLICATION
Provides a CodeDeploy application to be used as a basis for deployments
- **Required** : Yes
- **Type**: List of CodeDeploy Applications
- **CodeDeploy Application Body**:
    - **compute_platform**:
        - *The compute platform can either be ECS, Lambda, or Server.*
            - **Required** : Yes
            - **Type** : String
    - **name**:
        - *The name of the application.*
            - **Required** : Yes
            - **Type** : String



### DEPLOYMENT_CONFIG
Provides a CodeDeploy deployment config for an application
- **Required** : No
- **Type**: List of CodeDeploy Configs
- **CodeDeploy Configs Body**:
    - **deployment_config_name**:
        - *The name of the deployment config.*
            - **Required** : Yes
            - **Type** : String
    - **minimum_healthy_hosts**:
        - *A minimum_healthy_hosts block*
                - **Required** : Yes
                - **Type** : Object of Minimum Health Host 
                - **Minimum Health Host Body**:
                    - **type**:
                        - *The type can either be FLEET_PERCENT or HOST_COUNT.*
                            - **Required** : Yes
                            - **Type** : String
                    - **value**:
                        - *The value when the type is FLEET_PERCENT represents the minimum number of healthy instances as a percentage of the total number of instances in the deployment. If you specify FLEET_PERCENT, at the start of the deployment, AWS CodeDeploy converts the percentage to the equivalent number of instance and rounds up fractional instances. When the type is HOST_COUNT, the value represents the minimum number of healthy instances as an absolute value.*
                            - **Required** : Yes
                            - **Type** : Integer

### DEPLOYMENT_GROUP
Provides a CodeDeploy Deployment Group for a CodeDeploy Application
- **Required** : Yes
- **Type**: List of Deployment Groups
- **Deployment Group Body**:
    - **app_name**:
        - *The name of the application.*
            - **Required** : Yes
            - **Type** : String
    - **deployment_group_name**:
        - *he name of the deployment group.*
            - **Required** : Yes
            - **Type** : String
    - **service_role_arn**:
        - *The service role ARN that allows deployments.*
            - **Required** : Yes
            - **Type** : String
    - **deployment_config_name**:
        - *The name of the group's deployment config.*
            - **Required** : Yes
            - **Type** : String
    - **ec2_tag_filter**:
        - *Tag filters associated with the deployment group.*
            - **Required** : No
            - **Type** : List of EC2 Tag Filters
            - **EC2 Tag Filter Body**:
                - **key**:
                    - *The tag filter key.*
                        - **Required** : Yes
                        - **Type** : String
                - **type**:
                    - *The tag filter type. Valid Values: KEY_ONLY,VALUE_ONLY, KEY_AND_VALUE.*
                        - **Required** : Yes
                        - **Type** : String
                - **value**:
                    - *The tag filter value.*
                        - **Required** : Yes
                        - **Type** : String
    - **auto_rollback_configuration**:
        - *Configuration block of the automatic rollback configuration associated with the deployment group*
            - **Required** : Yes
            - **Type** : List of Auto RollBacks
            - **Auto RollBacks Body**:
                - **enabled**:
                    - *Indicates whether a defined automatic rollback configuration is currently enabled for this Deployment Group. If you enable automatic rollback, you must specify at least one event type.*
                        - **Required** : Yes
                        - **Type** : Boolean
                - **events**:
                    - *The event type or types that trigger a rollback.*
                        - **Required** : Yes
                        - **Type** : List of Strings
    - **alarm_configuration**:
        - *Configuration block of alarms associated with the deployment group*
            - **Required** : No
            - **Type** : List of Alarm Configurations
            - **Alarm Configuration Body**:
                - **alarms**:
                    - *A list of alarms configured for the deployment group*
                        - **Required** : Yes
                        - **Type** : Lisr of Strings
                - **enabled**:
                    - *Indicates whether the alarm configuration is enabled. This option is useful when you want to temporarily deactivate alarm monitoring for a deployment group without having to add the same alarms again later.*
                        - **Required** : Yes
                        - **Type** : Boolean

### DEPLOY_APPROVAL
The action(s) to include in the stage
- **Required** : No
- **Type**: List of Deploy Approvals
- **Deploy Approvals Body**:
    - **name**:
        - *The name of the stage.*
            - **Required** : Yes
            - **Type** : String
    - **action**:
        - *Configuration block*
            - **Required** : Yes
            - **Type** : List of Actions
            - **Action Body**:
                - **category**:
                    - * category defines what kind of action can be taken in the stage, and constrains the provider type for the action.*
                        - **Required** : Yes
                        - **Type** : String
                - **owner**:
                    - *The creator of the action being called.*
                        - **Required** : Yes
                        - **Type** : String
                - **provider**:
                    - *The provider of the service being called by the action. Valid providers are determined by the action category.*
                        - **Required** : Yes
                        - **Type** : String
                - **version**:
                    - *A string that identifies the action type.*
                        - **Required** : Yes
                        - **Type** : String
                - **configuration**:
                    - *A map of the action declaration's configuration*
                        - **Required** : Yes
                        - **Type** : Object of Configuration 
                        - **Configuration Body**:
                            - **NotificationArn**:
                                - *ARN of the notifcation*
                                    - **Required** : No
                                    - **Type** : String
                            - **CustomData**:
                                - *Custom Data for notification*
                                    - **Required** : No
                                    - **Type** : String

### DEPLOY_ACTION
The action(s) to include in the stage
- **Required** : Yes
- **Type**: List of Deploy Action
- **Deploy Action Body**:
    - **name**:
        - *The name of the stage.*
            - **Required** : Yes
            - **Type** : String
    - **action**:
        - *Configuration block*
            - **Required** : Yes
            - **Type** : Object of Action
            - **Action Body**:
                - **name**:
                    - *The name of the stage.*
                        - **Required** : Yes
                        - **Type** : String
    
                - **category**:
                    - * category defines what kind of action can be taken in the stage, and constrains the provider type for the action.*
                        - **Required** : Yes
                        - **Type** : String
                - **owner**:
                    - *The creator of the action being called.*
                        - **Required** : Yes
                        - **Type** : String
                - **provider**:
                    - *The provider of the service being called by the action. Valid providers are determined by the action category.*
                        - **Required** : Yes
                        - **Type** : String
                - **version**:
                    - *A string that identifies the action type.*
                        - **Required** : Yes
                        - **Type** : String
                - **input_artifacts**:
                    - *A list of artifact names to be worked on.*
                        - **Required** : Yes
                        - **Type** : List of Strings
                - **region**:
                    - *The region where the artifact store is located. Required for a cross-region CodePipeline.*
                        - **Required** : Yes
                        - **Type** : List of Strings
                - **configuration**:
                    - *A map of the action declaration's configuration*
                        - **Required** : Yes
                        - **Type** : Object of Configuration 
                        - **Configuration Body**:
                            - **ApplicationName**:
                                - *Name of the Application*
                                    - **Required** : No
                                    - **Type** : String

                            - **DeploymentGroupName**:
                                - *Name of the Deployment Group*
                                    - **Required** : No
                                    - **Type** : String
                            - **ClusterName**:
                                - *Name of the Cluster*
                                    - **Required** : No
                                    - **Type** : String
                            - **ServiceName**:
                                - *Name of the Service*
                                    - **Required** : No
                                    - **Type** : String
                            - **FileName**:
                                - *Name of the File*
                                    - **Required** : No
                                    - **Type** : String

### TAGS
The tags for the Code Pipeline.
- **Required**: No
- **Type**: JSON

---

##  Resource Referencing Variables
Resource referencing variables avaialbe for Code Pipeline which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### CODE_DEPLOY_APPLICATION_ID
Code Deploy Application ID.
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_DEPLOY_APPLICATION_ID}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_DEPLOY_APPLICATION_ID}

### CODE_DEPLOY_APPLICATION_ARN
Code Deploy Application ARN.
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_DEPLOY_APPLICATION_ARN}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_DEPLOY_APPLICATION_ARN}
### CODE_DEPLOY_DEPLOYMENT_CONFIG_ID
Code Deploy Configuration ID.
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_DEPLOY_DEPLOYMENT_CONFIG_ID}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_DEPLOY_DEPLOYMENT_CONFIG_ID}
### CODE_DEPLOY_DEPLOYMENT_GROUP_ARN
Code Deploy Configuration ARN.
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_DEPLOY_DEPLOYMENT_GROUP_ARN}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_DEPLOY_DEPLOYMENT_GROUP_ARN}
### CODE_DEPLOY_DEPLOYMENT_GROUP_ID
Code Deploy Deployment Group ID
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_DEPLOY_DEPLOYMENT_GROUP_ID}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_DEPLOY_DEPLOYMENT_GROUP_ID}
### CODE_BUILD_PROJECT_ARN
Code Deploy Build Project ARN.
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_BUILD_PROJECT_ARN}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_BUILD_PROJECT_ARN}

### CODE_BUILD_PROJECT_NAME
NAME of the CODE Build Project.
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_BUILD_PROJECT_NAME}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_BUILD_PROJECT_NAME}

### CODE_PIPELINE_ID
ID of code pipeline
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_PIPELINE_ID}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_PIPELINE_ID}

### CODE_PIPELINE_ARN
ARN of code pipeline
- **Type** : String
- **Usage** :
    - Same Request
        - ${CodePipeline[index].CODE_PIPELINE_ARN}
    - Previous Request
        - import ${\<reference name \>.CodePipeline[index].CODE_PIPELINE_ARN}