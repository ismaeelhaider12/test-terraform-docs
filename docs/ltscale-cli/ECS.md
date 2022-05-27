---
layout: comx
title: ECS SERVICES
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/ecs-services/index.html
---
# ECS SERVICES
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# ECS SERVICES
> An Amazon ECS service allows you to run and maintain a specified number of instances of a task definition simultaneously in an Amazon ECS cluster.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
        "CLUSTER_ARN": "str",                               
        "RETENTION_DAYS": "int",                            
        "LOG_GROUP_NAME": "str",                            
        "NETWORK_MODE": "str",                              
        "TASK_ROLE_ARN": "str",                             
        "SCHEDULING_STRATEGY": "str",                      
        "ECS_TASKS": [                                      
          {
            "family": "str",                                
            "cpu": "str",                                   
            "memory": "str",                                
            "container_port": "int",                        
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
                "cpu": "int",                              
                "memory": "int",                           
                "essential": "bool",                        
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
            "network_configuration": [                      
              { 
                "subnets": "list",                          
                "security_groups": "list",                  
                "assign_public_ip": "bool"                  
              }
            ],
            "load_balancer": [                              
              {
                "target_group_arn": "str",                  
                "container_name": "str",                    
                "container_port": "int"                     
              }
            ]
          }
        ],
        "TAGS": "str",                                         
        "COMPATIBILITIES": "str"                                
      }
```
## Properties
---


### CLUSTER_ARN
ARN that identifies the cluster.
 - **Required** : Yes
 - **Type** : String

### RETENTION_DAYS
Specifies the number of days you want to retain log events in the specified log group.
- **Required** : No
- **Type** : Integer

### LOG_GROUP_NAME
The name of the CloudWatch log group to send logs to.
- **Required** : Yes
- **Type** : String

### NETWORK_MODE
Docker networking mode to use for the containers in the task.
- **Required** : Yes
- **Type** : String
- 
### TASK_ROLE_ARN
ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services.
- **Required** : Yes
- **Type** : String

### SCHEDULING_STRATEGY
Scheduling strategy to use for the service. The valid values are REPLICA and DAEMON.
- **Required** : No
- **Type**: Strings

### ECS_TASKS
A unique name for your task definition. or from the instances associated with the specified security group.
- **family**: 
  - *A unique name for your task definition.*
    - **Required**: True
    - **Type**: String
- **cpu**: 
  - *Number of cpu units used by the task.If the requires_compatibilities is FARGATE this field is required.*
    - **Required**: True
    - **Type**: String
- **memory**: 
  - *Amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required.*
    - **Required**: True
    - **Type**: String
- **container_port**: 
  - *The port on the container to associate with the load balancer.*
    - **Required**: True
    - **Type**: Integer
- **container_name**: 
  - *Name of the container.*
    - **Required**: True
    - **Type**: String
    - 
- **volume**:
Configuration block for volumes that containers in your task may use.
    - **name**:
      - *Name of the volume.*
        - **Required**: True
        - **Type**: String
    - **host_path**:
      - *Path on the host container instance that is presented to the container.*
        - **Required**: True
        - **Type**: String
- **container_definition**:
 list of valid container definitions provided as a single valid JSON document.
    - **name**:
        - **Required**: True
        - **Type**: String
    - **image**:
        - **Required**: True
        - **Type**: String
    - **cpu**:
        - **Required**: True
        - **Type**: Integer
    - **memory**:
        - **Required**: True
        - **Type**: Integer
    - **essential**:
        - **Required**: True
        - **Type**: Boolean
    - **mountPoints**:
      - **sourceVolume**:
          - **Required**: True
          - **Type**: String
      - **containerPath**:
          - **Required**: True
          - **Type**: String
    - **portMappings**:
      - **containerPort**:
          - **Required**: True
          - **Type**: Integer
      - **protocol**:
          - **Required**: True
          - **Type**: String
      - **hostPort**:
          - **Required**: True
          - **Type**: Integer
    - **logConfiguration**:
      - **logDriver**:
          - **Required**: True
          - **Type**: string
      - **options**:
        - **awslogs-group**:
            - **Required**: True
            - **Type**: String
        - **awslogs-stream-prefix**:
            - **Required**: True
            - **Type**: String
        - **awslogs-region**:
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
Resource referencing variables available for ECS_SERVICES which can be used for cross resource referencing

### SERVICE
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_SERVICES[index].SERVICE}
    - Previous Request
        - import ${\<reference name \>.ECS_SERVICES[index].SERVICE}
### TASK_DEFINATION
- **Type** : String
- **Usage** :
    - Same Request
        - ${ECS_SERVICES[index].TASK_DEFINATION}
    - Previous Request
        - import ${\<reference name \>.ECS_SERVICES[index].TASK_DEFINATION}

