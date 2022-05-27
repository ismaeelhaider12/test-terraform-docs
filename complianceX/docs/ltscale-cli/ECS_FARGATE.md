---
layout: comx
title: ECS Fargate
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/ecs-fargate/index.html
---
# ECS Fargate
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# ECS Fargate
>Fargate is a serverless, pay-as-you-go compute engine that lets you focus on building applications without managing servers.
To create this entity in your **Litmus Scale** template, use the following data:
```
{
          "family": "str",
          "cpu": "str",
          "memory": "str",
          "container_port": "str",
          "container_name": "str",
          "task_role_arn": "str",
          "execution_role_arn": "str",
          "network_mode": "str",
          "container_definition": [
            {
              "name": "str",
              "image": "str",
              "essential": "bool",
              "portMappings": [
                {
                  "containerPort": "int",
                  "protocol": "str",
                  "hostPort": "int"
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
          "scheduling_strategy": "str",
          "deployment_minimum_healthy_percent": "int",
          "deployment_maximum_percent": "int",
          "subnets": "list",
          "security_groups": "list",
          "assign_public_ip": "bool",
          "load_balancer": [
            {
              "target_group_arn": "str",
              "container_name": "str",
              "container_port": "int"
            }
          ]
        }
      ],
      "TAGS": "str"
    }
```
## Properties

---
### network_mode
Docker networking mode to use for the containers in the task.
- **Required** : No
- **Type** : String
### task_role_arn
ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services.
- **Required** : No
- **Type** : String
### execution_role_arn
ARN of the task execution role that the Amazon ECS container agent and the Docker daemon can assume.
- **Required** : No
- **Type** : String
### family
- *A unique name for your task definition.*
  - **Required**: Yes
  - **Type**: Integer
### cpu   
- Number of cpu units used by the task.If the requires_compatibilities is FARGATE this field is required.
  - **Required**: No
  - **Type**: Integer
### memory   
- Amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required.
  - **Required**: No
  - **Type**: Integer
### cpu   
- Number of cpu units used by the task.If the requires_compatibilities is FARGATE this field is required.
  - **Required**: No
  - **Type**: Integer
### container_port   
- *The port on the container to associate with the load balancer.*
  - **Required**: True
  - **Type**: Integer
### container_name   
- *Name of the container*
  - **Required**: Yes
  - **Type**: String

### SERVICE   
The short name or ARN of the ECS service
- **Required** : No
- **Type** : LIST
- **JSON Body** :
  - **name**:
    - *The name of the service* 
  - **task_definition**:
    - *The family and revision (family:revision) or full ARN of the task definition that you want to run in your service.*
  - **desired_count**:
    - *The desired count*
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
  - **deployment_minimum_healthy_percent**:
    - Lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment.
      - **Required**: No
      - **Type**: String
  - **deployment_maximum_percent**:
    - Upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment.
      - **Required**: No
      - **Type**: String
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

### ECS_CLUSTER_ARN
ARN of the launch ECS cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_FARGATE[index].ECS_CLUSTER_ARN}
    - Previous Request
        - import ${\<reference name \>.ECS_FARGATE[index].ECS_CLUSTER_ARN}
### FARGATE_SERVICE
The fargate service.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_FARGATE[index].FARGATE_SERVICE}
    - Previous Request
        - import ${\<reference name \>.ECS_FARGATE[index].FARGATE_SERVICE}
### FARGATE_TASK_DEFINATION
The fargate task definition.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_FARGATE[index].FARGATE_TASK_DEFINATION}
    - Previous Request
        - import ${\<reference name \>.ECS_FARGATE[index].FARGATE_TASK_DEFINATION}

