---
layout: comx
title: Redshift
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/redshift/index.html
---
# Redshift
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Redshift
> OpenSearch is a distributed, open-source search and analytics suite used for a broad set of use cases like real-time application monitoring, log analytics, and website search. OpenSearch provides a highly scalable system for providing fast access and response to large volumes of data with an integrated visualization tool, OpenSearch Dashboards, that makes it easy for users to explore their data.

To create this entity in your **Litmus Scale** template, use the following data:
```
    {
      "CLUSTER_IDENTIFIER": "str",
      "DATABASE_NAME": "str",
      "ADMIN_USER": "str",
      "ADMIN_PASSWORD": "str",
      "NODE_TYPE": "str",
      "CLUSTER_TYPE": "str",
      "REDSHIFT_SUBNET_GROUP_NAME": "str",
      "SUBNET_IDS": "list",
      "VPC_SECURITY_GROUPS": "list",
      "AVAILABILLITY_ZONE": "str",
      "PREFERRED_MAINTENANCE_WINDOW": "str",
      "REDSHIFT_PARAMETER_GROUP_NAME": "str",
      "PARAMETER_GROUP_FAMILY": "str",
      "CLUSTER_PARAMETERS": [
        {
          "name": "str",
          "value": "str"
        }
      ],
      "AUTOMATED_SNAPSHOT_RETENTION_PERIOD": "int",
      "PORT": "int",
      "ENGINE_VERSION": "str",
      "NODES": "int",
      "PUBLICLY_ACCESSIBLE": "bool",
      "ENCRYPTED": "bool",
      "ENHANCED_VPC_ROUTING": "bool",
      "KMS_KEY_ARN": "str",
      "ELASTIC_IP": "str",
      "SKIP_FINAL_SNAPSHOT": "bool",
      "FINAL_SNAPSHOT_IDENTIFIER": "str",
      "SNAPSHOT_IDENTIFIER": "str",
      "SNAPSHOT_CLUSTER_IDENTIFIER": "str",
      "OWNER_ACCOUNT": "str",
      "IAM_ROLES": "list",
      "LOGGING": "bool",
      "LOGGING_BUCKET_NAME": "str",
      "LOGGING_S3_KEY_PREFIX": "str",
      "DEFAULT_SECURITY_GROUP": "bool",
      "TAGS": "str"
    }

```
## Properties
---
### CLUSTER_IDENTIFIER
The Cluster Identifier.
 - **Required** : Yes
 - **Type** : String
 
### DATABASE_NAME
The name of the first database to be created when the cluster is created.
 - **Required** : No
 - **Type** : String
 
### ADMIN_USER
Username for the master DB user.
 - **Required** : (Required unless a snapshot_identifier is provided)
 - **Type** : String
 
### ADMIN_PASSWORD
Password for the master DB user.
 - **Required** : (Required unless a snapshot_identifier is provided)
 - **Type** : String
 
### NODE_TYPE
The node type to be provisioned for the cluster.
 - **Required** : Yes
 - **Type** : String
 
### CLUSTER_TYPE
The cluster type to use. Either single-node or multi-node.
 - **Required** : No
 - **Type** : String
 
### REDSHIFT_SUBNET_GROUP_NAME
The name of a cluster subnet group to be associated with this cluster
 - **Required** : Yes
 - **Type** : String
 
### SUBNET_IDS
An array of VPC subnet IDs.
 - **Required** : Yes
 - **Type** : List
 
### VPC_SECURITY_GROUPS
 A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster.
 - **Required** : Yes
 - **Type** : List
 
### AVAILABILLITY_ZONE
The EC2 Availability Zone (AZ) in which you want Amazon Redshift to provision the cluster. 
 - **Required** : No
 - **Type** : String
 
### PREFERRED_MAINTENANCE_WINDOW
The weekly time range (in UTC) during which automated cluster maintenance can occur. 
 - **Required** : No
 - **Type** : String
 
### REDSHIFT_PARAMETER_GROUP_NAME
The name of the parameter group to be associated with this cluster.
 - **Required** : No
 - **Type** : String
 
### PARAMETER_GROUP_FAMILY
The family of the Redshift parameter group.
 - **Required** : Yes
 - **Type** : String
 
### CLUSTER_PARAMETERS
The parameters of the cluster.
 - **Required** : Yes
 - **Type** : JSON
 
### AUTOMATED_SNAPSHOT_RETENTION_PERIOD
The number of days that automated snapshots are retained.
 - **Required** : No
 - **Type** : Integer
 
### PORT
The port number on which the cluster accepts incoming connections. 
 - **Required** : No
 - **Type** : Integer
 
### ENGINE_VERSION
The version of the Amazon Redshift engine software that you want to deploy on the cluster.
 - **Required** : No
 - **Type** : String
 
### NODES
The number of compute nodes in the cluster.
 - **Required** : Required when the ClusterType parameter is specified as multi-node.
 - **Type** : String
 
### PUBLICLY_ACCESSIBLE
If true, the cluster can be accessed from a public network.
 - **Required** : No
 - **Type** : Boolean
 
### ENCRYPTED
If true , the data in the cluster is encrypted at rest.
 - **Required** : No
 - **Type** : Boolean
 
### ENHANCED_VPC_ROUTING
If true , enhanced VPC routing is enabled.
 - **Required** : No
 - **Type** : Boolean
 
### KMS_KEY_ARN
The ARN for the KMS encryption key. 
 - **Required** : No
 - **Type** : String

### ELASTIC_IP
The Elastic IP (EIP) address for the cluster.
 - **Required** : No
 - **Type** : String
 
### SKIP_FINAL_SNAPSHOT
Determines whether a final snapshot of the cluster is created before Amazon Redshift deletes the cluster.
 - **Required** : No
 - **Type** : Boolean
 
### FINAL_SNAPSHOT_IDENTIFIER
The identifier of the final snapshot that is to be created immediately before deleting the cluster.
 - **Required** : No
 - **Type** : String
 
### SNAPSHOT_CLUSTER_IDENTIFIER
The name of the cluster the source snapshot was created from.
 - **Required** : No
 - **Type** : String
 
### OWNER_ACCOUNT
The AWS customer account used to create or copy the snapshot.
 - **Required** : No
 - **Type** : String
 
### IAM_ROLES
 list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time.
 - **Required** : No
 - **Type** : List
 
### LOGGING
Enable or disable logging.
 - **Required** : Yes
 - **Type** : String
 
### LOGGING_BUCKET_NAME
name of an existing S3 bucket where the log files are to be stored.
 - **Required** : Required when enable is true
 - **Type** : Boolean
 
### LOGGING_S3_KEY_PREFIX
The prefix applied to the log file names.
 - **Required** : No
 - **Type** : String
 
### DEFAULT_SECURITY_GROUP
The default security group.
 - **Required** : Yes
 - **Type** : String
 
### TAGS
Map  of tags to assign to the resource.
- **Required**: No
- **Type**: JSON
---

##  Resource Referencing Variables
Resource referencing variables available for Redshift which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### CLUSTER_ARN
The ARN of the cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Redshift[index].CLUSTER_ARN}
    - Previous Request
        - import ${\<reference name \>.Redshift[index].CLUSTER_ARN}

### CLUSTER_ID
The ID of the cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Redshift[index].CLUSTER_ID}
    - Previous Request
        - import ${\<reference name \>.Redshift[index].CLUSTER_ID}

### CLUSTER_IDENTIFIER
The identifier of the cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Redshift[index].CLUSTER_IDENTIFIER}
    - Previous Request
        - import ${\<reference name \>.Redshift[index].CLUSTER_IDENTIFIER}

### CLUSTER_DATABASE_NAME
The name of the cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Redshift[index].CLUSTER_DATABASE_NAME}
    - Previous Request
        - import ${\<reference name \>.Redshift[index].CLUSTER_DATABASE_NAME}

### CLUSTER_DNS_NAME
The cluster dns name of the cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Redshift[index].CLUSTER_DNS_NAME}
    - Previous Request
        - import ${\<reference name \>.Redshift[index].CLUSTER_DNS_NAME}
      

### CLUSTER_ENDPOINTS
The cluster endpoints.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Redshift[index].CLUSTER_ENDPOINTS}
    - Previous Request
        - import ${\<reference name \>.Redshift[index].CLUSTER_ENDPOINTS}
      

### CLUSTER_PUBLIC_KEY
The public key of the cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Redshift[index].CLUSTER_PUBLIC_KEY}
    - Previous Request
        - import ${\<reference name \>.Redshift[index].CLUSTER_PUBLIC_KEY}
      
