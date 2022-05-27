---
layout: comx
title: MQ
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/mq/index.html
---
# MQ
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# MQ
> Amazon MQ is a managed message broker service for Apache ActiveMQ and RabbitMQ that makes it easy to set up and operate message brokers on AWS. Amazon MQ reduces your operational responsibilities by managing the provisioning, setup, and maintenance of message brokers for you.

To create this entity in your **Litmus Scale** template, use the following data:
```
    {
      "BROKER_NAME": "str",                                     
      "SECURITY_GROUPS": "list",                                
      "SUBNET_IDS": "list",                                     
      "HOST_INSTANCE_TYPE": "str",                              
      "ENGINE_TYPE": "str",                                     
      "ENGINE_VERSION": "str",                                  
      "STORAGE_TYPE": "str",                                    
      "AUTHENTICATION_STRATEGY": "str",                          
      "DEPLOYMENT_MODE": "str",                                  
      "APPLY_IMMEDIATELY": "bool",                               
      "AUTO_MINOR_VERSION_UPGRADE": "bool",                      
      "PUBLICLY_ACCESSIBLE": "bool",                             
      "TAGS": "str",                                            
      "USERNAME": "str",                                        
      "PASSWORD": "str",                                        
      "USER_GROUPS": "list",                                    
      "MAINTENANCE_WINDOW_START_TIME": {                        
        "day_of_week": "str",
        "time_of_day": "str",
        "time_zone": "str"
      },
      "logs_general": "bool",                                   
      "KMS_KEY_ID": "str",                                       
      "LOGS_GENERAL": "bool"                                     
    }
```
## Properties
---
### BROKER_NAME
Name of the broker
 - **Required** : Yes
 - **Type** : String

### ENGINE_TYPE
Type of broker engine.
- **Required** : Yes
- **Type**: Strings

### ENGINE_VERSION
Version of the broker engine.
- **Required** : Yes
- **Type**: Integer

### SECURITY_GROUPS
List of security group IDs assigned to the broker.
- **Required** : No
- **Type**: List

### SUBNET_IDS
List of subnet IDs in which to launch the broker.
- **Required** : No
- **Type**: List

### HOST_INSTANCE_TYPE
Broker's instance type.
- **Required** : Yes
- **Type**: String

### STORAGE_TYPE
Storage type of the broker.
- **Required** : No
- **Type**: String

### AUTHENTICATION_STRATEGY
Authentication strategy used to secure the broker.
- **Required** : No
- **Type**: String

### DEPLOYMENT_MODE
Deployment mode of the broker.
- **Required** : No
- **Type**: String

### APPLY_IMMEDIATELY
Specifies whether any broker modifications are applied immediately, or during the next maintenance window.
- **Required** : No
- **Type**: Boolean

### AUTO_MINOR_VERSION_UPGRADE
Whether to automatically upgrade to new minor versions of brokers as Amazon MQ makes releases available.
- **Required** : No
- **Type**: Boolean

### PUBLICLY_ACCESSIBLE
Whether to enable connections from applications outside of the VPC that hosts the broker's subnets.
- **Required** : No
- **Type**: Boolean

### TAGS
Map of tags to assign to the broker.
- **Required**: No
- **Type**: JSON

### USERNAME
Username of the user.
- **Required**: Yes
- **Type**: String

### PASSWORD
Password of the user.
- **Required**: Yes
- **Type**: String

### USER_GROUPS
List of groups (20 maximum) to which the ActiveMQ user belongs.
- **Required**: Yes
- **Type**: String

### MAINTENANCE_WINDOW_START_TIME
Configuration block for the maintenance window start time.
- **Required**: No
- **Type**: JSON
- **Body**: 
  - **day_of_week**: 
    - Day of the week, e.g., MONDAY, TUESDAY, or WEDNESDAY.
  - **time_of_week**: 
    - Time, in 24-hour format, e.g., 02:00.
  - **time_zone**: 
    - Time zone in either the Country/City format or the UTC offset format, e.g., CET.

### KMS_KEY_ID
List of groups (20 maximum) to which the ActiveMQ user belongs.
- **Required**: Yes
- **Type**: String

### LOGS_GENERAL
Enables general logging via CloudWatch.
- **Required**: No
- **Type**: Boolean

---

##  Resource Referencing Variables
Resource referencing variables available for MQ which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### MQ_ARN
The ARN of the MQ.
- **Type** : String
- **Usage** :
    - Same Request
        - ${MQ[index].MQ_ARN}
    - Previous Request
        - import ${\<reference name \>.MQ[index].MQ_ARN}

### MQ_ID
The ID of the MQ.
- **Type** : String
- **Usage** :
    - Same Request
        - ${MQ[index].MQ_ID}
    - Previous Request
        - import ${\<reference name \>.MQ[index].MQ_ID}

### MQ_INSTANCES
List of node objects including id, address, port and availability_zone.
- **Type** : List of node objects
- **Usage** :
    - Same Request
        - Referring all nodes
            - ${MQ[index].MQ_INSTANCES}
        - Referring one public subnet id
            - ${MQ[index].MQ_INSTANCES[index]}
        
    - Previous Request
        - Referring all private subnets
            - import  ${\<reference name \>.MQ[index].MQ_INSTANCES}
        - Referring one private subnet
            - import ${\<reference name \>.MQ[index].MQ_INSTANCES[index]}
