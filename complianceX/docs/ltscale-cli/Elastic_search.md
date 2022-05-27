---
layout: comx
title: ElasticSearch
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/elasticsearch/index.html
---
# ElasticSearch
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# ElasticSearch
> OpenSearch is a distributed, open-source search and analytics suite used for a broad set of use cases like real-time application monitoring, log analytics, and website search. OpenSearch provides a highly scalable system for providing fast access and response to large volumes of data with an integrated visualization tool, OpenSearch Dashboards, that makes it easy for users to explore their data.

To create this entity in your **Litmus Scale** template, use the following data:
```
    {
      "TAGS": "str",
      "DOMAIN_NAME": "str",
      "VPC_ENABLED": "bool",
      "SECURITY_GROUP_IDS": "list",
      "SUBNET_IDS": "list",
      "ELASTICSEARCH_VERSION": "str",
      "INSTANCE_TYPE": "str",
      "INSTANCE_COUNT": "int",
      "WARM_ENABLED": "bool",
      "WARM_COUNT": "int",
      "WARM_TYPE": "str",
      "ZONE_AWARENESS_ENABLED": "bool",
      "AVAILABILITY_ZONE_COUNT": "int",
      "EBS_VOLUME_SIZE": "int",
      "EBS_VOLUME_TYPE": "str",
      "EBS_IOPS": "int",
      "ENCRYPT_AT_REST_ENABLED": "bool",
      "ENCRYPT_AT_REST_KMS_KEY_ID": "str",
      "AUTOMATED_SNAPSHOT_START_HOUR": "int",
      "DEDICATED_MASTER_ENABLED": "bool",
      "DEDICATED_MASTER_COUNT": "int",
      "DEDICATED_MASTER_TYPE": "str",
      "ADVANCED_OPTIONS": "str",
      "NODE_TO_NODE_ENCRYPTION_ENABLED": "bool",
      "COGNITO_AUTHENTICATION_ENABLED": "bool",
      "COGNITO_USER_POOL_ID": "str",
      "COGNITO_IDENTITY_POOL_ID": "str",
      "COGNITO_IAM_ROLE_ARN": "str",
      "ADVANCED_SECURITY_OPTION": [
        {
          "enabled": "bool",
          "internal_user_database_enabled": "bool",
          "master_user_options": {
            "master_user_arn": "str",
            "master_user_name": "str",
            "master_user_password": "str"
          }
        }
      ],
      "EBS_OPTIONS": [
        {
          "ebs_enabled": "bool",
          "volume_size": "int",
          "volume_type": "str",
          "iops": "int"
        }
      ],
      "CLUSTER_CONFIGURATION": [
        {
          "instance_count": "int",
          "instance_type": "str",
          "dedicated_master_enabled": "bool",
          "dedicated_master_count": "int",
          "dedicated_master_type": "str",
          "zone_awareness_enabled": "bool",
          "warm_enabled": "bool",
          "warm_count": "int",
          "warm_type": "str",
          "zone_awareness_config": {
            "availability_zone_count": "int"
          }
        }
      ],
      "LOG_PUBLISHING_OPTIONS": [
        {
          "log_type": "str",
          "cloudwatch_log_group_arn": "str"
        }
      ],
      "ELASTIC_SEARCH_POLICY_ACTIONS": "list",
      "ELASTIC_SEARCH_POLICY_PRINCIPAL": [
        {
          "type": "str",
          "identifiers": "list"
        }
      ],
      "DOMAIN_ENDPOINT_OPTIONS": [
        {
          "enforce_https": "bool",
          "tls_security_policy": "str",
          "custom_endpoint_enabled": "bool",
          "custom_endpoint": "str",
          "custom_endpoint_certificate_arn": "str"
        }
      ]
    }

```
## Properties
---
### DOMAIN_NAME
Version of the configuration.
 - **Required** : Yes
 - **Type** : String
 
### VPC_ENABLED
Map of tags to assign to the broker.
- **Required**: No
- **Type**: JSON
 
### SECURITY_GROUP_IDS
List of VPC Security Group IDs to be applied to the Elasticsearch domain endpoints.
- **Required**: No
- **Type**: List
 
### SUBNET_IDS
List of VPC Subnet IDs for the Elasticsearch domain endpoints to be created in.
- **Required**: Yes
- **Type**: List
 
### ELASTICSEARCH_VERSION
Version of Elasticsearch to deploy.
- **Required**: No
- **Type**: Integer
 
### INSTANCE_TYPE
Instance type of data nodes in the cluster.
- **Required**: No
- **Type**: String
 
### INSTANCE_COUNT
Number of instances in the cluster.
- **Required**: No
- **Type**: Integer
 
### WARM_ENABLED
Whether to enable warm storage.
- **Required**: No
- **Type**: Boolean
 
### WARM_COUNT
Number of warm nodes in the cluster.
- **Required**: No
- **Type**: Integer
 
### WARM_TYPE
tance type for the Elasticsearch cluster's warm nodes. 
- **Required**: No
- **Type**: String
 
### ZONE_AWARENESS_ENABLED
Whether zone awareness is enabled, set to true for multi-az deployment. 
- **Required**: No
- **Type**: Boolean
 
### AVAILABILITY_ZONE_COUNT
Number of Availability Zones for the domain to use with zone_awareness_enabled.
- **Required**: No
- **Type**: Integer
 
### EBS_VOLUME_SIZE
Size of EBS volumes attached to data nodes (in GiB).
- **Required**: (Required if ebs_enabled is set to true.)
- **Type**: Integer
 
### EBS_VOLUME_TYPE
Type of EBS volumes attached to data nodes.
- **Required**: No
- **Type**: String
 
### EBS_IOPS
Baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type.
- **Required**: No
- **Type**: String
 
### ENCRYPT_AT_REST_ENABLED
Whether advanced security is enabled.
- **Required**: (Required, Forces new resource)
- **Type**: Boolean
 
### ENCRYPT_AT_REST_KMS_KEY_ID
KMS key ARN to encrypt the Elasticsearch domain with.
- **Required**: No
- **Type**: String
 
### AUTOMATED_SNAPSHOT_START_HOUR
Hour during which the service takes an automated daily snapshot of the indices in the domain.
- **Required**: Yes
- **Type**: JSON
 
### DEDICATED_MASTER_ENABLED
Whether dedicated main nodes are enabled for the cluster.
- **Required**: No
- **Type**: Boolean
 
### DEDICATED_MASTER_COUNT
Number of dedicated main nodes in the cluster.
- **Required**: No
- **Type**: Integer
 
### DEDICATED_MASTER_TYPE
Instance type of the dedicated main nodes in the cluster.
- **Required**: No
- **Type**: String
 
### ADVANCED_OPTIONS
Key-value string pairs to specify advanced configuration options. 
- **Required**: No
- **Type**: JSON
 
### NODE_TO_NODE_ENCRYPTION_ENABLED
Configuration block for node-to-node encryption options.
- **Required**: No
- **Type**: JSON
 
### COGNITO_AUTHENTICATION_ENABLED
Whether Amazon Cognito authentication with Kibana is enabled or not.
- **Required**: No
- **Type**: Boolean
 
### COGNITO_USER_POOL_ID
ID of the Cognito User Pool to use.
- **Required**: Yes
- **Type**: String
 
### COGNITO_IDENTITY_POOL_ID
ID of the Cognito Identity Pool to use.
- **Required**: Yes
- **Type**: String
 
### COGNITO_IAM_ROLE_ARN
ARN of the IAM role that has the AmazonESCognitoAccess policy attached.
- **Required**: Yes
- **Type**: String
 
### ADVANCED_SECURITY_OPTION
Configuration block for fine-grained access control.
- **Required**: No
- **Type**: JSON
- **Body**:
  - enabled:
    - Whether advanced security is enabled.
    - **Required**: Yes
    - **Type**: String
  - internal_user_database_enabled:
    - Whether the internal user database is enabled.
    - **Required**: No
    - **Type**: Boolean
  - master_user_options:
    - Configuration block for the main user.
    - **Required**: No
    - **Type**: JSON
    - **Body**:
      - master_user_arn:
        - ARN for the main user. 
        - **Required**: No
        - **Type**: String
      - master_user_name:
        - Main user's username, which is stored in the Amazon Elasticsearch Service domain's internal database.
        - **Required**: No
        - **Type**: String
      - master_user_password:
        - Main user's password, which is stored in the Amazon Elasticsearch Service domain's internal database.
        - **Required**: No
        - **Type**: String


 
### EBS_OPTIONS
Configuration block for EBS related options,
- **Required**: Required based on chosen instance size.
- **Type**: JSON
- **Body**:
  - ebs_enabled:
    - Whether EBS volumes are attached to data nodes in the domain.
    - **Required**: Yes
    - **Type**: Boolean
  - volume_size:
    - Size of EBS volumes attached to data nodes (in GiB).
    - **Required**: (Required if ebs_enabled is set to true.)
    - **Type**: Integer
  - volume_type:
    - Whether the internal user database is enabled.
    - **Required**: No
    - **Type**: String
  - iops:
    - Baseline input/output (I/O) performance of EBS volumes attached to data nodes.
    - **Required**: No
    - **Type**: Integer
 
### CLUSTER_CONFIGURATION
Configuration block for the cluster of the domain.
- **Required**: No
- **Type**: JSON
- **Body**:
  - instance_count:
    - Number of instances in the cluster.
    - **Required**: No
    - **Type**: Integer
  - instance_type:
    - Instance type of data nodes in the cluster.
    - **Required**: No
    - **Type**: Integer
  - dedicated_master_enabled:
    - Whether dedicated main nodes are enabled for the cluster.
    - **Required**: No
    - **Type**: Boolean
  - dedicated_master_count:
    - Baseline input/output (I/O) performance of EBS volumes attached to data nodes.
    - **Required**: No
    - **Type**: Integer
  - dedicated_master_type:
    - Number of dedicated main nodes in the cluster.
    - **Required**: No
    - **Type**: Integer
  - zone_awareness_enabled:
    - Whether zone awareness is enabled, set to true for multi-az deployment.
    - **Required**: No
    - **Type**: Boolean
  - warm_enabled:
    - Whether to enable warm storage.
    - **Required**: No
    - **Type**: Boolean
  - warm_count:
    - Number of warm nodes in the cluster.
    - **Required**: No
    - **Type**: Integer
  - warm_type:
    - Instance type of data nodes in the cluster.
    - **Required**: No
    - **Type**: String
  - zone_awareness_config:
    - Configuration block containing zone awareness settings.
    - **Required**: No
    - **Type**: JSON
    - **Body**:
      - availability_zone_count
        - Number of Availability Zones for the domain to use with zone_awareness_enabled.
        - **Required**: No
        - **Type**: Integer
    
### LOG_PUBLISHING_OPTIONS
Configuration block for publishing slow and application logs to CloudWatch Logs.
- **Required**: No
- **Type**: JSON
- **Body**:
  - log_type:
    - Type of Elasticsearch log.
    - **Required**: Yes
    - **Type**: String
  - cloudwatch_log_group_arn:
    - ARN of the Cloudwatch log group to which log needs to be published.
    - **Required**: Yes
    - **Type**: String

 
 
### ELASTIC_SEARCH_POLICY_ACTIONS
List of policy actions.
- **Required**: No
- **Type**: List
 
### ELASTIC_SEARCH_POLICY_PRINCIPAL
Map of tags to assign to the broker.
- **Required**: No
- **Type**: JSON
- **Body**:
  - type:
    - Type of Elasticsearch log.
    - **Required**: Yes
    - **Type**: String
  - identifiers:
    - ARN of the Cloudwatch log group to which log needs to be published.
    - **Required**: Yes
    - **Type**: String
 
### DOMAIN_ENDPOINT_OPTIONS
Configuration block for domain endpoint HTTP(S) related options.
- **Required**: No
- **Type**: JSON
- **Body**:
  - enforce_https:
    - Whether or not to require HTTPS.
    - **Required**: No
    - **Type**: Boolean
  - tls_security_policy:
    - Name of the TLS security policy that needs to be applied to the HTTPS endpoint.
    - **Required**: No
    - **Type**: String
  - custom_endpoint_enabled:
    - ) Whether to enable custom endpoint for the Elasticsearch domain.
    - **Required**: No
    - **Type**: Boolean
  - custom_endpoint:
    - Fully qualified domain for your custom endpoint.
    - **Required**: No
    - **Type**: String
  - custom_endpoint_certificate_arn:
    - ACM certificate ARN for your custom endpoint.
    - **Required**: No
    - **Type**: String
 
### TAGS
Map  of tags to assign to the resource.
- **Required**: No
- **Type**: JSON
---

##  Resource Referencing Variables
Resource referencing variables available for ElasticSearch which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### ELASTIC_SEARCH_ARN
The ARN of the Elastic search.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ElasticSearch[index].ELASTIC_SEARCH_ARN}
    - Previous Request
        - import ${\<reference name \>.ElasticSearch[index].ELASTIC_SEARCH_ARN}

### ELASTIC_SEARCH_DOMAIN_ID
The ID of the Elastic Search domain.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ElasticSearch[index].ELASTIC_SEARCH_DOMAIN_ID}
    - Previous Request
        - import ${\<reference name \>.ElasticSearch[index].ELASTIC_SEARCH_DOMAIN_ID}

### ELASTIC_SEARCH_DOMAIN_NAME
The Name of the Elastic Search domain.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ElasticSearch[index].ELASTIC_SEARCH_DOMAIN_NAME}
    - Previous Request
        - import ${\<reference name \>.ElasticSearch[index].ELASTIC_SEARCH_DOMAIN_NAME}

### ELASTIC_SEARCH_ENDPOINT
The Endpoint of the Elastic Search domain.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ElasticSearch[index].ELASTIC_SEARCH_ENDPOINT}
    - Previous Request
        - import ${\<reference name \>.ElasticSearch[index].ELASTIC_SEARCH_ENDPOINT}

### ELASTIC_SEARCH_KIBANA_ENDPOINT
The ELASTIC_SEARCH_KIBANA_ENDPOINT of the Elastic Search domain.
- **Type** : String
- **Usage** :
    - Same Request
        - ${ElasticSearch[index].ELASTIC_SEARCH_KIBANA_ENDPOINT}
    - Previous Request
        - import ${\<reference name \>.ElasticSearch[index].ELASTIC_SEARCH_KIBANA_ENDPOINT}
      
