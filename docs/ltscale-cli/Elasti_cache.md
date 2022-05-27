---
layout: comx
title: ElastiCache
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/elasticache/index.html
---
# ElastiCache
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# ElastiCache
> Amazon ElastiCache is a fully managed, in-memory caching service supporting flexible, real-time use cases. You can use ElastiCache for caching, which accelerates application and database performance, or as a primary data store for use cases that don't require durability like session stores, gaming leaderboards, streaming, and analytics.

To create this entity in your **Litmus Scale** template, use the following data:
```
    {
      "TAGS": "str",
      "MAX_ITEM_SIZE": "int",
      "SUBNETS": "list",
      "PARAMETER_GROUP_NAME": "str",
      "PARAMETERS": [
        {
          "name": "str",
          "value": "str"
        }
      ],
      "MAINTENANCE_WINDOW": "str",
      "CLUSTER_SIZE": "int",
      "INSTANCE_TYPE": "str",
      "ENGINE": "str",
      "ENGINE_VERSION": "str",
      "SECURITY_GROUP_IDS": "list",
      "NOTIFICATION_TOPIC_ARN": "str",
      "APPLY_IMMEDIATELY": "bool",
      "CLUSTER_NAME": "str",
      "AVAILABILITY_ZONE": "str",
      "AVAILABILITY_ZONES": "list",
      "AZ_MODE": "str",
      "PORT": "int",
      "SUBNET_GROUP_NAME": "str",
      "ELASTICACHE_PARAMETER_GROUP_FAMILY": "str",
      "LOG_DELIVERY_DESTINATION": "str",
      "LOG_DELIVERY_DESTINATION_TYPE": "str",
      "LOG_FORMATE": "str",
      "LOG_TYPE": "str"
    }
```
## Properties
---
### SUBNETS
List of VPC Subnet IDs for the cache subnet group.
 - **Required** : Yes
 - **Type** : String
 - 
### PARAMETER_GROUP_NAME
The name of the parameter group to associate with this cache cluster.
 - **Required** : (Required unless replication_group_id is provided)
 - **Type** : String
 - 
### PARAMETERS
The name of the parameter group to associate with this cache cluster.
 - **Required** : Yes
 - **Type** : JSON
 - **Body** :
   - name:
     - The name of the parameter
   - value:
     - The value of the parameter
 
### MAINTENANCE_WINDOW
Specifies the weekly time range for when maintenance on the cache cluster is performed.
- **Required** : No
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

### INSTANCE_TYPE
The instance class used.
- **Required** : (Required unless replication_group_id is provided) 
- **Type**: String

### ENGINE
Name of the cache engine to be used for this cache cluster.
- **Required** : No
- **Type**: String

### ENGINE_VERSION
Version number of the cache engine to be used.
- **Required** : No
- **Type**: String

### SECURITY_GROUP_IDS
One or more VPC security groups associated with the cache cluster.
- **Required** : No
- **Type**: List of String

### NOTIFICATION_TOPIC_ARN
ARN of an SNS topic to send ElastiCache notifications to.
- **Required** : No
- **Type**: String

### APPLY_IMMEDIATELY
Whether any database modifications are applied immediately, or during the next maintenance window.
- **Required** : No
- **Type**: Boolean

### CLUSTER_NAME
Group identifier.
- **Required** : No
- **Type**: String

### AVAILABILITY_ZONE
Availability Zone for the cache cluster.
- **Required** : No
- **Type**: String

### AVAILABILITY_ZONES
List of the Availability Zones in which cache nodes are created.
- **Required** : No
- **Type**: List of String

### AZ_MODE
Whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region.
- **Required** : No
- **Type**: String

### PORT
The port number on which each of the cache nodes will accept connections.
- **Required** : No
- **Type**: Integer

### SUBNET_GROUP_NAME
Name of the subnet group to be used for the cache cluster.
- **Required** : No
- **Type**: String

### ELASTICACHE_PARAMETER_GROUP_FAMILY
The family of the ElastiCache parameter group.
- **Required** : Yes
- **Type**: String

### LOG_DELIVERY_DESTINATION
Specifies the destination and format of Redis SLOWLOG or Redis Engine Log.
- **Required** : No
- **Type**: String

### LOG_DELIVERY_DESTINATION_TYPE
For CloudWatch Logs use cloudwatch-logs or for Kinesis Data Firehose use kinesis-firehose.
- **Required** : No
- **Type**: String

### LOG_FORMATE
Valid values are json or text
- **Required** : No
- **Type**: String

### LOG_TYPE
Valid values are slow-log or engine-log.
- **Required** : No
- **Type**: String

### TAGS
Map of tags to assign to the broker.
- **Required**: No
- **Type**: JSON
---

##  Resource Referencing Variables
Resource referencing variables available for ElastiCache which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### ElastiCache_ARN
The ARN of the cache cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Elasticache[index].ElastiCache_ARN}
    - Previous Request
        - import ${ref.Elasticache[index].ElastiCache_ARN}	

### ElastiCache_ENGION_VERSION
Nested argument with Launch template specification to use to launch instances.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Elasticache[index].ElastiCache_ARN}
    - Previous Request
        - import ${ref.Elasticache[index].ElastiCache_ARN}	

### ElastiCache_CACHE_NODES
All the private subnets created.
- **Type** : List of node objects
- **Usage** :
    - Same Request
        - Referring all nodes
            - ${ElastiCache[index].ElastiCache_CACHE_NODES}
        - Referring one public subnet id
            - ${ElastiCache[index].ElastiCache_CACHE_NODES[index]}
        
    - Previous Request
        - Referring all private subnets
            - import  ${\<reference name \>.ElastiCache[index].ElastiCache_CACHE_NODES}
        - Referring one private subnet
            - import ${\<reference name \>.ElastiCache[index].ElastiCache_CACHE_NODES[index]}
	
### ElastiCache_DNS_NAME
DNS name of the cache cluster without the port appended.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Elasticache[index].ElastiCache_DNS_NAME}
    - Previous Request
        - import ${ref.Elasticache[index].ElastiCache_DNS_NAME}	

### ElastiCache_CONFIG_ENDPOINT
Configuration endpoint to allow host discovery.
- **Type** : Integer
- **Usage** :
    - Same Request
        - ${Elasticache[index].ElastiCache_DNS_NAME}
    - Previous Request
        - import ${ref.Elasticache[index].ElastiCache_DNS_NAME}	