---
layout: comx
title: Aurora
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/aurora/index.html
---
# Aurora
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Aurora
>Amazon Aurora is a MySQL and PostgreSQL-compatible relational database built for the cloud that combines the performance and availability of traditional enterprise databases with the simplicity and cost-effectiveness of open source databases.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
      "TAGS": "str",
      "IDENTIFIER": "str",
      "MASTER_USERNAME": "str",
      "MASTER_PASSWORD": "str",
      "NAME": "str",
      "ENGINE": "str",
      "ENGINE_VERSION": "str",
      "FAMILY": "str",
      "SUBNET_IDS": "list",
      "ENGINE_MODE": "str",
      "SECURITY_GROUP_IDS": "list",
      "RDS_ENHANCED_MONITORING_ROLE_ARN": "str",
      "REPLICA_COUNT": "int",
      "REPLICA_SCALE_ENABLED": "bool",
      "REPLICA_SCALE_MAX": "int",
      "REPLICA_SCALE_MIN": "int",
      "AURORA_INSTANCE_TYPE": "str",
      "AURORA_SCALING_CONFIGURATION": {
        "auto_pause": "bool",
        "min_capacity": "int",
        "max_capacity": "int",
        "seconds_until_auto_pause": "int",
        "timeout_action": "str"
      },
      "AURORA_PARAMETER": [
        {
          "name": "str",
          "value": "str"
        }
      ],
      "PERFORMANCE_INSIGHTS_ENABLED": "bool",
      "KMS_KEY_ID": "str",
      "AURORA_MONITORING_INTERVAL": "int",
      "PUBLICLY_ACCESSIBLE": "bool",
      "DATABASE_NAME": "str",
      "SKIP_FINAL_SNAPSHOT": "bool",
      "DELETION_PROTECTION": "bool",
      "BACKUP_RETENTION_PERIOD": "int",
      "PREFERRED_BACKUP_WINDOW": "str",
      "PREFERRED_MAINTENANCE_WINDOW": "str",
      "APPLY_IMMEDIATELY": "bool",
      "AUTO_MINOR_VERSION_UPGRADE": "bool",
      "SNAPSHOT_IDENTIFIER": "str",
      "ENABLE_HTTP_ENDPOINT": "bool",
      "REPLICA_SCALE_CPU": "int",
      "IAM_DATABASE_AUTHENTICATION_ENABLED": "bool",
      "ENABLED_CLOUDWATCH_LOGS_EXPORTS": "list",
      "AURORA_REPLICATION_SOURCE_IDENTIFIER": "str",
      "COPY_TAGS_TO_SNAPSHOT": "bool"
    }



```
## Properties
---

### TAGS
The tags for the Aurora.
- **Required**: No
- **Type**: JSON
### IDENTIFIER
The name of the RDS instance.
 - **Required** : Yes
 - **Type** : String
### USERNAME
Username for the master DB user.
- **Required** : Yes
- **Type** : String
### PASSWORD
Password for the master DB user.
- **Required** : Yes
- **Type** : String
### NAME
The name of the database.
- **Required** : Yes
- **Type** : String
### ENGINE
The database engine.
- **Required** : Yes
- **Type** : String
### FAMILY
The RDS instance family.
- **Required** : Yes
- **Type** : String
### SUBNET_IDS
 A list of VPC subnet IDs.
- **Required** : Yes
- **Type**: List of Strings
### ENGINE_MODE
 The database engine mode. E.g: global, multimaster, parallelquery, provisioned, serverless.
- **Required** : No
- **Type**: Strings
### SECURITY_GROUP_IDS
List of VPC security groups to associate.
- **Required** : Yes
- **Type**: List of Strings
### RDS_ENHANCED_MONITORING_ROLE_ARN
The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs.
- **Required** : No
- **Type** : String
### REPLICA_COUNT
Number of replicas to create
- **Required** : No
- **Type** : Integer
### REPLICA_SCALE_ENABLED
Boolean value to enable or disable scale-in activities for a policy.
- **Required** : Yes
- **Type** : Boolean
### REPLICA_SCALE_MAX
The maximum capacity for an Aurora DB cluster in serverless DB engine mode.
- **Required** : No
- **Type** : Integer
### REPLICA_SCALE_MIN
The minimum capacity for an Aurora DB cluster in serverless DB engine mode.
- **Required** : No
- **Type** : Integer
### AURORA_INSTANCE_TYPE
The instance class to use.
- **Required** : Yes
- **Type** : String
### AURORA_SCALING_CONFIGURATION
Nested attribute with scaling properties. Only valid when engine_mode is set to serverless.
- **Required** : No
- **Type** : JSON
- **Body**:
  - **auto_pause**  
      - Whether to enable automatic pause. A DB cluster can be paused only when it's idle (it has no connections).

  - **max_capacity**  
      - The maximum capacity for an Aurora DB cluster in serverless DB engine mode.

  - **min_capacity**  
      - The minimum capacity for an Aurora DB cluster in serverless DB engine mode.

  - **seconds_until_auto_pause**  
      - The time, in seconds, before an Aurora DB cluster in serverless mode is paused.

  - **timeout_action**  
      - The action to take when the timeout is reached.
### AURORA_PARAMETER
Provides an RDS DB cluster parameter group resource.
- **Required** : Yes
- **Type** : LIST of parameters JSONS
- **Parameter body**:
  - **name**  
      - The name of the DB parameter.
  - **value**  
      - The value of the DB parameter.
### AURORA_MONITORING_INTERVAL
The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance.
- **Required** : No
- **Type** : Integer
### PREFERRED_BACKUP_WINDOW
The daily time range during which automated backups are created if automated backups are enabled.
- **Required** : No
- **Type** : String
### PREFERRED_MAINTENANCE_WINDOW
The window to perform maintenance in.
- **Required** : No
- **Type** : String
### PERFORMANCE_INSIGHTS_ENABLED
Specifies whether Performance Insights are enabled.
- **Required** : No
- **Type**: Boolean
- **Default** : True
### KMS_KEY_ID
The ARN for the KMS encryption key.
- **Required** : No
- **Type** : String
### DATABASE_NAME
Name for an automatically created database on cluster creation.
- **Required** : No
- **Type** : String
### AUTO_MINOR_VERSION_UPGRADE
Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window.
- **Required** : No
- **Type** : Boolean
- **Default** : True
### ENGINE_VERSION
Version of the database engine for this DB cluster snapshot.
- **Required** : Yes
- **Type** : String
### BACKUP_RETENTION_PERIOD
The days to retain backups for. Must be between 0 and 35. Must be greater than 0.
- **Required** : No
- **Type** : Integer
- **Default** : 7
### PUBLICLY_ACCESSIBLE
Boolean to control if instance is publicly accessible
- **Required** : No
- **Type** : Boolean
- **Default**: False
### SKIP_FINAL_SNAPSHOT
Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier
- **Required** : No
- **Type** : Boolean
- **Default**: True
### SNAPSHOT_IDENTIFIER
The DB Cluster Identifier from which to take the snapshot.
- **Required** : Yes
- **Type** : String
### DELETION_PROTECTION
If the DB instance should have deletion protection enabled.
- **Required** : No
- **Type** : Boolean
- **Default** : False
### APPLY_IMMEDIATELY
Specifies whether any database modifications are applied immediately, or during the next maintenance window
- **Required** : No
- **Type** : Boolean
- **Default** : True
### COPY_TAGS_TO_SNAPSHOT
On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)
- **Required** : No
- **Type** : Boolean
- **Default** : True
### ENABLE_HTTP_ENDPOINT
Enable HTTP endpoint (data API). Only valid when engine_mode is set to serverless.
- **Required** : No
- **Type** : String
### ENABLED_CLOUDWATCH_LOGS_EXPORTS
The database engine.
- **Required** : Yes
- **Type** : String
### AURORA_REPLICATION_SOURCE_IDENTIFIER
ARN of a source DB cluster or DB instance if this DB cluster is to be created as a Read Replica.
- **Required** : No
- **Type** : String

---

##  Resource Referencing Variables
Resource referencing variables available for Aurora which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### Aurora
Aurora Database instance created 
- **Type** : Aurora object
- **Usage** :
    - Same Request
        - ${Aurora[0].AURORA_DATABASE_INSTANCE}
    - Previous Request
        - import ${\<reference name>.Aurora[0].AURORA_DATABASE_INSTANCE}

### AURORA_DATABASE_INSTANCE_ARN
Aurora database ARN  of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Aurora[index].AURORA_DATABASE_INSTANCE_ARN}
    - Previous Request
        - import ${\<reference name \>.Aurora[index].AURORA_DATABASE_INSTANCE_ARN}

### AURORA_DATABASE_INSTANCE_ID
Aurora database ID of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Aurora[index].AURORA_DATABASE_INSTANCE_ID}
    - Previous Request
        - import ${\<reference name \>.Aurora[index].AURORA_DATABASE_INSTANCE_ID}

### AURORA_DATABASE_CLUSTER
Aurora database cluster of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Aurora[index].AURORA_DATABASE_CLUSTER}
    - Previous Request
        - import ${\<reference name \>.Aurora[index].AURORA_DATABASE_CLUSTER}

### AURORA_DATABASE_CLUSTER_ID
Aurora database cluster ID of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Aurora[index].AURORA_DATABASE_CLUSTER_ID}
    - Previous Request
        - import ${\<reference name \>.Aurora[index].AURORA_DATABASE_CLUSTER_ID}

### AURORA_DATABASE_CLUSTER_ARN
Aurora database cluster ARN of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Aurora[index].AURORA_DATABASE_CLUSTER_ARN}
    - Previous Request
        - import ${\<reference name \>.Aurora[index].AURORA_DATABASE_CLUSTER_ARN}

### AURORA_SUBNET_GROUP
Aurora database subnet group of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Aurora[index].AURORA_SUBNET_GROUP}
    - Previous Request
        - import ${\<reference name \>.Aurora[index].AURORA_SUBNET_GROUP}
### AURORA_CLUSTER_PARAMETER_GROUP
Aurora cluster parameter group of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Aurora[index].AURORA_SUBNET_GROUP}
    - Previous Request
        - import ${\<reference name \>.Aurora[index].AURORA_SUBNET_GROUP}
### AURORA_DB_PARAMETER_GROUP
Aurora database cluster parameter group of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${Aurora[index].AURORA_DB_PARAMETER_GROUP}
    - Previous Request
        - import ${\<reference name \>.Aurora[index].AURORA_DB_PARAMETER_GROUP}
