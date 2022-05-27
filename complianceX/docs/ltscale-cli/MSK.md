---
layout: comx
title: MSK
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/msk/index.html
---
# MSK
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# MSK
> Amazon MSK is a fully managed, secure, and highly available Apache Kafka service that makes it easy to ingest and process streaming data in real time.

To create this entity in your **Litmus Scale** template, use the following data:
```
    {
      "TAGS": "str",
      "KAFKA_CONFIGURATION_VERSIONS": "list",
      "CONFIGURATION_NAME": "str",
      "SERVER_PROPERTIES": "str",
      "CLUSTER_NAME": "str",
      "KAFKA_CLUSTER_VERSION": "str",
      "NUMBER_OF_BROKER_NODES": "int",
      "ENHANCED_MONITORING": "str",
      "BROKER_NODE_CLIENT_SUBNETS": "list",
      "BROKER_NODE_VOLUME_SIZE": "int",
      "BROKER_NODE_INSTANCE_TYPE": "str",
      "BROKER_NODE_SECURITY_GROUPS": "list",
      "ENCRYPTION_AT_REST_KMS_KEY_ARN": "str",
      "ENCRYPTION_IN_TRANSIT_CLIENT_BROKER": "str",
      "ENCRYPTION_IN_TRANSIT_IN_CLUSTER": "bool",
      "MONITORING_PROMETHEUS_JMX_EXPORTER": "bool",
      "MONITORING_PROMETHEUS_NODE_EXPORTER": "bool",
      "S3_LOGS_BUCKET": "str",
      "S3_LOGS_PREFIX": "str",
      "CLOUDWATCH_LOGS_GROUP": "str",
      "FIREHOSE_LOGS_DELIVERY_STREAM": "str",
      "CLIENT_TLS_AUTHENTICATION_ENABLED": "bool",
      "CLIENT_SASL_SCRAM_ENABLED": "bool",
      "CLIENT_SASL_IAM_ENABLED": "bool",
      "CERTIFICATE_AUTHORITY_ARNS": "list"
    }

```
## Properties
---
### KAFKA_CONFIGURATION_VERSIONS
Version of the configuration.
 - **Required** : Yes
 - **Type** : String
 
### CONFIGURATION_NAME
Name of the configuration.
 - **Required** : Yes
 - **Type** : String
 
### CLUSTER_NAME
Name of the MSK cluster.
 - **Required** : Yes
 - **Type** : String
 
### SERVER_PROPERTIES
Contents of the server.properties file.
 - **Required** : Yes
 - **Type** : String
 
### KAFKA_CLUSTER_VERSION
Specify the desired Kafka software version.
 - **Required** : Yes
 - **Type** : String
 
### NUMBER_OF_BROKER_NODES
The desired total number of broker nodes in the kafka cluster.
 - **Required** : Yes
 - **Type** : String
 
### ENHANCED_MONITORING
Specify the desired enhanced MSK CloudWatch monitoring level. 
 - **Required** : No
 - **Type** : String
 
### BROKER_NODE_CLIENT_SUBNETS
A list of subnets to connect to in client VPC.
 - **Required** : Yes
 - **Type** : List
 
### BROKER_NODE_VOLUME_SIZE
The size in GiB of the EBS volume for the data drive on each broker node.
 - **Required** : Yes
 - **Type** : Integer
 
### BROKER_NODE_INSTANCE_TYPE
Specify the instance type to use for the kafka brokersE.g., kafka.m5.large.
 - **Required** : Yes
 - **Type** : String
 
### BROKER_NODE_SECURITY_GROUPS
A list of the security groups to associate with the elastic network interfaces to control who can communicate with the cluster.
 - **Required** : Yes
 - **Type** : List
 
### ENCRYPTION_AT_REST_KMS_KEY_ARN
You may specify a KMS key short ID or ARN (it will always output an ARN) to use for encrypting your data at rest.
 - **Required** : No
 - **Type** : String
 
### ENCRYPTION_IN_TRANSIT_CLIENT_BROKER
Configuration block to specify encryption in transit. 
 - **Required** : No
 - **Type** : String
 
### ENCRYPTION_IN_TRANSIT_IN_CLUSTER
Whether data communication among broker nodes is encrypted.
 - **Required** : Yes
 - **Type** : String
 
### MONITORING_PROMETHEUS_JMX_EXPORTER
Configuration block for JMX Exporter. 
 - **Required** : No
 - **Type** : String
 
### MONITORING_PROMETHEUS_NODE_EXPORTER
Configuration block for Node Exporter.
 - **Required** : No
 - **Type** : String
 
### S3_LOGS_BUCKET
Name of the S3 bucket to deliver logs to.
 - **Required** : Yes
 - **Type** : String
 
### S3_LOGS_PREFIX
Prefix to append to the folder name.
 - **Required** : Yes
 - **Type** : String
 
### CLOUDWATCH_LOGS_GROUP
Name of the Cloudwatch Log Group to deliver logs to.
 - **Required** : No
 - **Type** : String
 
### FIREHOSE_LOGS_DELIVERY_STREAM
Name of the Kinesis Data Firehose delivery stream to deliver logs to.
 - **Required** : No
 - **Type** : String
 
### CLIENT_TLS_AUTHENTICATION_ENABLED
Configuration block for specifying a client authentication.
 - **Required** : No
 - **Type** : Boolean
 
### CLIENT_SASL_SCRAM_ENABLED
Enables SCRAM client authentication via AWS Secrets Manager.
 - **Required** : No
 - **Type** : String
 
### CLIENT_SASL_IAM_ENABLED
Enables IAM client authentication.
 - **Required** : No
 - **Type** : String
 
### CERTIFICATE_AUTHORITY_ARNS
List of ACM Certificate Authority Amazon Resource Names (ARNs).
 - **Required** : No
 - **Type** : List

### TAGS
A map of tags to assign to the resource.
- **Required**: No
- **Type**: JSON
---

##  Resource Referencing Variables
Resource referencing variables available for MQ which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### MSK_CONFIGURATION_ARN
The ARN of the MQ.
- **Type** : String
- **Usage** :
    - Same Request
        - ${MSK[index].MQ_ARN}
    - Previous Request
        - import ${\<reference name \>.MSK[index].MQ_ARN}

### MSK_CONFIGURATION_LATEST_REVISION
The ARN of the MQ.
- **Type** : String
- **Usage** :
    - Same Request
        - ${MSK[index].MSK_CONFIGURATION_LATEST_REVISION}
    - Previous Request
        - import ${\<reference name \>.MSK[index].MSK_CONFIGURATION_LATEST_REVISION}

### MSK_CLUSTER_ARN
The ID of the MQ.
- **Type** : String
- **Usage** :
    - Same Request
        - ${MSK[index].MSK_CLUSTER_ARN}
    - Previous Request
        - import ${\<reference name \>.MSK[index].MSK_CLUSTER_ARN}

### MSK_CLUSTER_CURRENT_VERSION
The ID of the MQ.
- **Type** : String
- **Usage** :
    - Same Request
        - ${MSK[index].MQ_ID}
    - Previous Request
        - import ${\<reference name \>.MSK[index].MQ_ID}
      
