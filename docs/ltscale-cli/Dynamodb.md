---
layout: comx
title: DynamoDB
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/dynamodb/index.html
---
# DynamoDB
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# DynamoDB
> Amazon DynamoDB is a fully managed proprietary NoSQL database service that supports key–value and document data structures and is offered by Amazon.com as part of the Amazon Web Services portfolio.

To create this entity in your **Litmus Scale** template, use the following data:
```
    {
      "TAGS": "str",
      "TABLE_NAME": "str",
      "AUTOSCALE_WRITE_TARGET": "int",
      "AUTOSCALE_READ_TARGET": "int",
      "AUTOSCALE_MIN_READ_CAPACITY": "int",
      "AUTOSCALE_MAX_READ_CAPACITY": "int",
      "AUTOSCALE_MIN_WRITE_CAPACITY": "int",
      "AUTOSCALE_MAX_WRITE_CAPACITY": "int",
      "BILLING_MODE": "str",
      "ENABLE_STREAMS": "bool",
      "STREAM_VIEW_TYPE": "str",
      "ENABLE_ENCRYPTION": "bool",
      "SERVER_SIDE_ENCRYPTION_KMS_KEY_ARN": "str",
      "ENABLE_POINT_IN_TIME_RECOVERY": "bool",
      "HASH_KEY": "str",
      "HASH_KEY_TYPE": "str",
      "RANGE_KEY": "str",
      "RANGE_KEY_TYPE": "str",
      "TTL_ATTRIBUTE": "str",
      "TTL_ENABLED": "bool",
      "DYNAMODB_ATTRIBUTES": [
        {
          "name": "str",
          "type": "str"
        }
      ],
      "GLOBAL_SECONDARY_INDEX_MAP": [
        {
          "hash_key": "str",
          "name": "str",
          "non_key_attributes": "list",
          "projection_type": "str",
          "range_key": "str",
          "read_capacity": "int",
          "write_capacity": "int"
        }
      ],
      "LOCAL_SECONDARY_INDEX_MAP": [
        {
          "name": "str",
          "non_key_attributes": "list",
          "projection_type": "str",
          "range_key": "str"
        }
      ],
      "REPLICAS": "list",
      "TABLE_AUTOSCALING_ENABLED": "bool",
      "AUTOSCALE_MAX_READ_CAPACITY_INDEX": "int",
      "AUTOSCALE_MIN_READ_CAPACITY_INDEX": "int",
      "AUTOSCALE_READ_TARGET_INDEX": "int",
      "AUTOSCALE_MAX_WRITE_CAPACITY_INDEX": "int",
      "AUTOSCALE_MIN_WRITE_CAPACITY_INDEX": "int",
      "AUTOSCALE_WRITE_TARGET_INDEX": "int"
    }

```
## Properties
---
### TABLE_NAME
The name of the table.
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_WRITE_TARGET
Version of the configuration.
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_READ_TARGET
Version of the configuration.
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_MIN_READ_CAPACITY
The minimum number of read units for this table.
 - **Required** : No
 - **Type** : Integer
 
### AUTOSCALE_MAX_READ_CAPACITY
The maximum number of read units for this table. 
 - **Required** : No
 - **Type** : Integer
 
### AUTOSCALE_MIN_WRITE_CAPACITY
The minimum number of write units for this table. 
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_MAX_WRITE_CAPACITY
The maximum number of write units for this table.
 - **Required** : Yes
 - **Type** : String
 
### BILLING_MODE
Controls how you are charged for read and write throughput and how you manage capacity.
 - **Required** : No
 - **Type** : String
 
### ENABLE_STREAMS
Indicates whether Streams are to be enabled (true) or disabled
 - **Required** : No
 - **Type** : Boolean
 
### STREAM_VIEW_TYPE
When an item in the table is modified, StreamViewType determines what information is written to the table's stream.
 - **Required** : Yes
 - **Type** : String
 
### ENABLE_ENCRYPTION
Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK).
 - **Required** : Yes
 - **Type** : Boolean
 
### SERVER_SIDE_ENCRYPTION_KMS_KEY_ARN
The ARN of the CMK that should be used for the AWS KMS encryption.
 - **Required** : No
 - **Type** : String
 
### ENABLE_POINT_IN_TIME_RECOVERY
Whether to enable point-in-time recovery - note that it can take up to 10 minutes to enable for new tables.
 - **Required** : Yes
 - **Type** : Boolean
 
### HASH_KEY
The attribute to use as the hash (partition) key.
 - **Required** : Yes
 - **Type** : String
 
### HASH_KEY_TYPE
Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data
 - **Required** : Yes
 - **Type** : String
 
### RANGE_KEY
The attribute to use as the range (sort) key.
 - **Required** : No
 - **Type** : String
 
### RANGE_KEY_TYPE
(Required) Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data
 - **Required** : Yes
 - **Type** : String
 
### TTL_ATTRIBUTE
The name of the table attribute to store the TTL timestamp in.
 - **Required** : Yes
 - **Type** : String
 
### TTL_ENABLED
Indicates whether ttl is enabled (true) or disabled (false).
 - **Required** : Yes
 - **Type** : Boolean
 
### DYNAMODB_ATTRIBUTES
Version of the configuration.
 - **Required** : Yes
 - **Type** : JSON
 - **Body** :
   - name:
     - The name of the attribute.
     - **Required**: Yes
     - **Type**: String
   - type:
     - Attribute type, which must be a scalar type: S, N, or B for (S)tring, (N)umber or (B)inary data.
     - **Required**: Yes
     - **Type**: String

 
### GLOBAL_SECONDARY_INDEX_MAP
Describe a GSI for the table; subject to the normal limits on the number of GSIs, projected attributes, etc.
 - **Required** : No
 - **Type** : JSON
 - **Body** :
   - hash_key:
     - The name of the hash key in the index; must be defined as an attribute in the resource.
     - **Required**: Yes
     - **Type**: String
   - name:
     - The name of the index.
     - **Required**: Yes
     - **Type**: String
   - non_key_attributes:
     - Only required with INCLUDE as a projection type; a list of attributes to project into the index.
     - **Required**: No
     - **Type**: String
   - projection_type:
     - One of ALL, INCLUDE or KEYS_ONLY where ALL projects every attribute into the index, KEYS_ONLY projects just the hash and range key into the index, and INCLUDE projects only the keys specified in the non_key_attributes parameter.
     - **Required**: Yes
     - **Type**: String
   - range_key:
     - The name of the range key; must be defined.
     - **Required**: No
     - **Type**: String
   - read_capacity:
     - The number of read units for this index. Must be set if billing_mode is set to PROVISIONED.
     - **Required**: No
     - **Type**: Integer
   - write_capacity:
     - The number of write units for this index. Must be set if billing_mode is set to PROVISIONED.
     - **Required**: No
     - **Type**: Integer
 
### LOCAL_SECONDARY_INDEX_MAP
Describe an LSI on the table; these can only be allocated at creation so you cannot change this definition after you have created the resource.
 - **Required** : No
 - **Type** : JSON
 - **Body** :
   - name:
     - The name of the index.
     - **Required**: Yes
     - **Type**: String   
     - non_key_attributes:
       - Only required with INCLUDE as a projection type; a list of attributes to project into the index.
       - **Required**: No
       - **Type**: String
   - projection_type:
     - One of ALL, INCLUDE or KEYS_ONLY where ALL projects every attribute into the index, KEYS_ONLY projects just the hash and range key into the index, and INCLUDE projects only the keys specified in the non_key_attributes parameter.
     - **Required**: Yes
     - **Type**: String
   - range_key:
     - The name of the range key; must be defined.
     - **Required**: No
     - **Type**: String
 
### REPLICAS
Configuration block(s) with DynamoDB Global Tables V2 (version 2019.11.21) replication configurations.
 - **Required** : No
 - **Type** : JSON
 
### TABLE_AUTOSCALING_ENABLED
Whether or not to enable autoscaling.
 - **Required** : Yes
 - **Type** : Boolean
 
### AUTOSCALE_MAX_READ_CAPACITY_INDEX
The number of maximum read units for this table.
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_MIN_READ_CAPACITY_INDEX
The number of minimum read units for this table.
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_READ_TARGET_INDEX
The target value for the metric.
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_MAX_WRITE_CAPACITY_INDEX
The number of maximum write units for this table.
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_MIN_WRITE_CAPACITY_INDEX
The number of minimum write units for this table.
 - **Required** : Yes
 - **Type** : String
 
### AUTOSCALE_WRITE_TARGET_INDEX
The target value for the metric.
 - **Required** : Yes
 - **Type** : String
 
### TAGS
Map  of tags to assign to the resource.
- **Required**: No
- **Type**: JSON
---

##  Resource Referencing Variables
Resource referencing variables available for DynamoDB which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### DYNAMODB_TABLE_ARN
The ARN of the table.
- **Type** : String
- **Usage** :
    - Same Request
        - ${DynamoDB[index].DYNAMODB_TABLE_ARN}
    - Previous Request
        - import ${\<reference name \>.DynamoDB[index].DYNAMODB_TABLE_ARN}

### DYNAMODB_TABLE_ID
The ID of the table.
- **Type** : String
- **Usage** :
    - Same Request
        - ${DynamoDB[index].DYNAMODB_TABLE_ID}
    - Previous Request
        - import ${\<reference name \>.DynamoDB[index].DYNAMODB_TABLE_ID}

### DYNAMODB_TABLE_STREAM_ARN
The stream of the table.
- **Type** : String
- **Usage** :
    - Same Request
        - ${DynamoDB[index].DYNAMODB_TABLE_STREAM_ARN}
    - Previous Request
        - import ${\<reference name \>.DynamoDB[index].DYNAMODB_TABLE_STREAM_ARN}

### DYNAMODB_TABLE_STREAM_LABEL
The label of the table stream.
- **Type** : String
- **Usage** :
    - Same Request
        - ${DynamoDB[index].DYNAMODB_TABLE_STREAM_LABEL}
    - Previous Request
        - import ${\<reference name \>.DynamoDB[index].DYNAMODB_TABLE_STREAM_LABEL}
      
