---
layout: comx
title: ECS EC2 Type
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/ecs-ec2-type/index.html
---
# ECS EC2 Type
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# ECS EC2 type
>Amazon ECS is a fully managed container orchestration service that helps you easily deploy, manage, and scale containerized applications.It deeply integrates with the rest of the AWS platform to provide a secure and easy-to-use solution for running container workloads in the cloud and now on your infrastructure with Amazon ECS Anywhere.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
      "CLUSTER_NAME": "str",
      "LOG_GROUP_NAME": "str",
      "KMS_KEY_ID": "str",
      "LAUNCH_TEMPLATE_NAME": "str",
      "IPC_MODE": "str",
      "NETWORK_MODE": "str",
      "PID_MODE": "str",
      "DESIRED_COUNT": "int",
      "SUBNETS": "list",
      "SECURITY_GROUPS": "list",
      "ASSIGN_PUBLIC_IP": "bool",
      "DELETE_ON_TERMINATION": "bool",
      "INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR": "str",
      "EBS_OPTIMIZED": "bool",
      "DISABLE_API_TERMINATION": "bool",
      "RETENTION_DAYS": "int",
      "INSTANCE_PROFILE_NAME": "str",
      "TASK_ROLE_ARN": "str",
      "EXECUTION_ROLE_ARN": "str",
      "AUTOSCALING_NAME": "str",
      "MIN_SIZE": "int",
      "MAX_SIZE": "int",
      "DESIRED_CAPACITY": "int",
      "HEALTH_CHECK_GRACE_PERIOD": "int",
      "DEFAULT_COOLDOWN": "int",
      "FORCE_DELETE": "bool",
      "TERMINATION_POLICIES": "list",
      "SUSPENDED_PROCESSES": "list",
      "PLACEMENT_GROUP": "str",
      "ENABLED_METRICS": "list",
      "METRICS_GRANULARITY": "str",
      "SERVICE_LINKED_ROLE_ARN": "str",
      "MAX_INSTANCE_LIFETIME": "int",
      "SCHEDULING_STRATEGY": "str",
      "AMI_ID": "str",
      "INSTANCE_TYPE": "str",
      "SSH_KEY_NAME": "str",
      "EBS_BLOCK_DEVICE": [
        {
          "device_name": "str",
          "ebs": {
            "delete_on_termination": "bool",
            "volume_type": "str",
            "kms_key_id": "str",
            "volume_size": "int"
          }
        }
      ],
      "MONITORING": "bool",
      "DEPLOYMENT_MIN_HEALTH": "int",
      "DEPLOYMENT_MAX_HEALTH": "int",
      "ECS_TASKS": [
        {
          "family": "str",
          "cpu": "str",
          "memory": "str",
          "container_port": "str",
          "container_name": "str",
          "volume": [
            {
              "name": "str",
              "host_path": "str"
            }
          ],
          "container_definition": [
            {
              "name": "str",
              "image": "str",
              "essential": "bool",
              "cpu": "int",
              "memory": "int",
              "mountPoints": [
                {
                  "sourceVolume": "str",
                  "containerPath": "str"
                }
              ],
              "portMappings": [
                {
                  "containerPort": "int",
                  "protocol": "str",
                  "hostPort": "int"
                }
              ],
              "environment": [
                {
                  "name": "str",
                  "value": "str"
                }
              ],
              "secrets": [
                {
                  "name": "str",
                  "valueFrom": "str"
                }
              ],
              "logConfiguration": {
                "logDriver": "str",
                "options": {
                  "awslogs-group": "str",
                  "awslogs-stream-prefix": "str",
                  "awslogs-region": "str"
                }
              }
            }
          ]
        }
      ],
      "SERVICE": [
        {
          "name": "str",
          "task_definition": "str",
          "desired_count": "int",
          "load_balancer": [
            {
              "target_group_arn": "str",
              "container_name": "str",
              "container_port": "int"
            }
          ],
          "network_configuration": [
            {
              "security_groups": "list",
              "subnets": "list",
              "assign_public_ip": "bool"
            }
          ]
        }
      ],
      "TAGS": "str",
      "INSTANCE_TAGS": "str"
    }
```
## Properties

---

### CLUSTER_NAME
The name of the cluster
- **Required** : Yes
- **Type** : String

### LOG_GROUP_NAME
The name of the CloudWatch log group to send logs to.
- **Required** : No
- **Type** : String

### KMS_KEY_ID
The AWS Key Management Service key ID to encrypt the data between the local client and the container.
- **Required** : No
- **Type** : String

### LAUNCH_TEMPLATE_NAME
Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.
- **Required** : No
- **Type** : String

### NETWORK_MODE
Docker networking mode to use for the containers in the task.
- **Required** : No
- **Type** : String

### PID_MODE
Docker networking mode to use for the containers in the task.
- **Required** : No
- **Type** : String

### IPC_MODE
Process namespace to use for the containers in the task.
- **Required** : No
- **Type** : String

### DESIRED_COUNT
The value, specified as a percent total of a service's desiredCount, to scale the task set.
- **Required** : No
- **Type** : Integer

### SUBNETS
The subnets associated with the task or service.
- **Required** : Yes
- **Type** : String

### SECURITY_GROUPS
The security groups associated with the task or service.
- **Required** : No
- **Type** : String

### ASSIGN_PUBLIC_IP
Whether to assign a public IP address to the ENI (FARGATE launch type only).
- **Required** : No
- **Type** : String

### DELETE_ON_TERMINATION
Enables or disables container-aware termination of instances in the auto scaling group when scale-in happens.
- **Required** : No
- **Type** : Boolean

### TASK_ROLE_ARN
ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services.
- **Required** : No
- **Type** : String

### EXECUTION_ROLE_ARN
ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume.
- **Required** : No
- **Type** : String

### AUTOSCALING_NAME
Name of the capacity provider.
- **Required** : Yes
- **Type** : String

### MIN_SIZE
Minimum step adjustment size. A number between 1 and 10,000.
- **Required** : No
- **Type** : Integer

### MAX_SIZE
Maximum step adjustment size. A number between 1 and 10,000.
- **Required** : No
- **Type** : Integer

### DESIRED_CAPACITY
Target utilization for the capacity provider. A number between 1 and 100.
- **Required** : No
- **Type** : Integer

### HEALTH_CHECK_GRACE_PERIOD   
Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647.
- **Required** : No
- **Type** : Integer

### HEALTH_CHECK_GRACE_PERIOD   
Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647.
- **Required** : No
- **Type** : Integer

### FORCE_DELETE   
Whether to allow deleting the task set without waiting for scaling down to 0. up to 2147483647.
- **Required** : No
- **Type** : Boolean

### SCHEDULING_STRATEGY   
Scheduling strategy to use for the service. The valid values are REPLICA and DAEMON.
- **Required** : No
- **Type** : String

### DEPLOYMENT_MIN_HEALTH   
Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment.
- **Required** : No
- **Type** : String

### DEPLOYMENT_MAX_HEALTH   
Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment.
- **Required** : No
- **Type** : String

### ECS_TASKS
A unique name for your task definition. or from the instances associated with the specified security group.
- **Required** : Yes
- **Type** : List of JSON
- **JSON Body** :
    - **family**: 
      - *A unique name for your task definition.*
        - **Required**: Yes
        - **Type**: Integer
    - **cpu**: 
      - Number of cpu units used by the task.If the requires_compatibilities is FARGATE this field is required.
        - **Required**: No
        - **Type**: Integer
    - **memory**: 
      - Amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required.
        - **Required**: No
        - **Type**: Integer
    - **container_port**: 
      - *The port on the container to associate with the load balancer.*
        - **Required**: True
        - **Type**: Integer
    - **container_name**: 
      - *Name of the container.*
        - **Required**: Yes
        - **Type**: String
    - **volume**: 
      - *Configuration block for volumes that containers in your task may use. Detailed below.*
        - **Required**: No
        - **Type**: Integer
    - **container_definition**:
  
    - list of valid container definitions provided as a single valid JSON document.
      - **name**:
        - **
          - **Required**: True
          - **Type**: String
      - **image**:
        - **
          - **Required**: True
          - **Type**: String
      - **cpu**:
        - * Number of cpu units used by the task.*
          - **Required**: True
          - **Type**: Integer
      - **memory**:
        - *Amount (in MiB) of memory used by the task.*
          - **Required**: True
          - **Type**: Integer
      - **essential**:
        - **
          - **Required**: True
          - **Type**: Boolean
      - **mountPoints**:
        - **sourceVolume**:
          - **
            - **Required**: True
            - **Type**: String
        - **containerPath**:
          - *The type of volume.*
            - **Required**: True
            - **Type**: String
      - **portMappings**:
        - **containerPort**:
          - *Whether the volume should be destroyed on instance termination.*
            - **Required**: True
            - **Type**: Integer
        - **protocol**:
          - *The type of volume.*
            - **Required**: True
            - **Type**: String
        - **hostPort**:
          - *The type of volume.*
            - **Required**: True
            - **Type**: Integer
      - **logConfiguration**:
        - **logDriver**:
          - *Whether the volume should be destroyed on instance termination.*
            - **Required**: True
            - **Type**: string
        - **options**:
          - **awslogs-group**:
            - *The type of volume.*
              - **Required**: True
              - **Type**: String
          - **awslogs-stream-prefix**:
            - *The type of volume.*
              - **Required**: True
              - **Type**: String
          - **awslogs-region**:
            - *The type of volume.*
              - **Required**: True
              - **Type**: String


### SERVICE   
- **Required** : No
  - **Type** : LIST
  - **JSON Body** :
    - **name**:
      - *The name of the service* 
    - **task_definition**:
      - *The family and revision (family:revision) or full ARN of the task definition that you want to run in your service.*
    - **desired_count**:
      - *The desired count*
      - **Required**: Yes
      - **Type**: Integer
    - **load_balancer**:
      - The load_balancer configuration block supports the following:
        - **target_group_arn**:
          - *(Optional, Required for ALB/NLB) The ARN of the Load Balancer target group to associate with the service.*
            - **Type**: String
        - **container_name**:
          - *The name of the container to associate with the load balancer (as it appears in a container definition).*
            - **Required**: Yes
            - **Type**: String
        - **container_port**:
          - *The port on the container to associate with the load balancer.*
            - **Required**: Yes
            - **Type**: String
    - **network_configuration**:
      - The network configuration block supports the following:
        - **security_groups**:
          - *The security groups associated with the task or service.*
            - **Required**: Yes
            - **Type**: String
        - **subnets**:
          - *The subnets associated with the task or service.*
            - **Required**: Yes
            - **Type**: String
        - **assign_public_ip**:
          - *Whether to assign a public IP address to the ENI (FARGATE launch type only).*
            - **Required**: No
            - **Type**: Boolean
    - **TAGS**:
      - *A map of tags to assign to the file system.*
        - **Required**: No
        - **Type**: JSON

##  Resource Referencing Variables
Resource referencing variables available for ECS_EKS_TYPE which can be used for cross resource referencing

### LAUNCH_TEMPLATE_ARN
ARN of the launch template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_EC2_TYPE[index].LAUNCH_TEMPLATE_ARN}
    - Previous Request
        - import ${\<reference name \>.ECS_EC2_TYPE[index].LAUNCH_TEMPLATE_ARN}
### LAUNCH_TEMPLATE_ID
ID of the template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_EC2_TYPE[index].LAUNCH_TEMPLATE_ID}
    - Previous Request
        - import ${\<reference name \>.ECS_EC2_TYPE[index].LAUNCH_TEMPLATE_ID}
### ECS_CLUSTER_ARN
ARN of the launch template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_EC2_TYPE[index].LAUNCH_TEMPLATE_ARN}
    - Previous Request
        - import ${\<reference name \>.ECS_EC2_TYPE[index].LAUNCH_TEMPLATE_ARN}
### AUTOSCALING_GROUP_ID
ARN of the launch template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_EC2_TYPE[index].AUTOSCALING_GROUP_ID}
    - Previous Request
        - import ${\<reference name \>.ECS_EC2_TYPE[index].AUTOSCALING_GROUP_ID}
### AUTOSCALING_GROUP_ARN
ARN of the launch template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_EC2_TYPE[index].AUTOSCALING_GROUP_ARN}
    - Previous Request
        - import ${\<reference name \>.ECS_EC2_TYPE[index].AUTOSCALING_GROUP_ARN}
### SERVICE
ARN of the launch template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_EC2_TYPE[index].SERVICE}
    - Previous Request
        - import ${\<reference name \>.ECS_EC2_TYPE[index].SERVICE}
### TASK_DEFINATION
ARN of the launch template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_EC2_TYPE[index].TASK_DEFINATION}
    - Previous Request
        - import ${\<reference name \>.ECS_EC2_TYPE[index].TASK_DEFINATION}

