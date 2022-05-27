---
layout: comx
title: RDS Read Replica
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/rds-read-replica/index.html
---
# RDS Read Replica
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# RDS Read Replica
>Amazon RDS Read Replicas provide enhanced performance and durability for RDS database (DB) instances. They make it easy to elastically scale out beyond the capacity constraints of a single DB instance for read-heavy database workloads. You can create one or more replicas of a given source DB Instance and serve high-volume application read traffic from multiple copies of your data, thereby increasing aggregate read throughput.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
      "TAGS": "str",
      "IDENTIFIER": "str",
      "ENGINE": "str",
      "ENGINE_VERSION": "str",
      "MAJOR_ENGINE_VERSION": "str",
      "INSTANCE_CLASS": "str",
      "NAME": "str",
      "PORT": "str",
      "SOURCE_DB_IDENTIFIER": "str",
      "PERFORMANCE_INSIGHTS_RETENTION_PERIOD": "int",
      "PERFORMANCE_INSIGHTS_ENABLED": "bool",
      "SECURITY_GROUP_IDS": "list",
      "RDS_READ_REPLICA_OPTIONS": [
        {
          "option_name": "str",
          "option_settings": [
            {
              "name": "str",
              "value": "str"
            }
          ]
        }
      ],
      "KMS_KEY_ID": "str",
      "LICENSE_MODEL": "str",
      "IAM_DATABASE_AUTHENTICATION_ENABLED": "bool",
      "FINAL_SNAPSHOT_IDENTIFIER": "str",
      "MULTI_AZ": "bool",
      "PUBLICLY_ACCESSIBLE": "bool",
      "MONITORING_INTERVAL": "int",
      "MONITORING_ROLE_ARN": "str",
      "ALLOW_MAJOR_VERSION_UPGRADE": "bool",
      "AUTO_MINOR_VERSION_UPGRADE": "bool",
      "APPLY_IMMEDIATELY": "bool",
      "MAINTENANCE_WINDOW": "str",
      "SKIP_FINAL_SNAPSHOT": "bool",
      "COPY_TAGS_TO_SNAPSHOT": "bool",
      "BACKUP_RETENTION_PERIOD": "int",
      "BACKUP_WINDOW": "str",
      "ENABLED_CLOUDWATCH_LOGS_EXPORTS": "list",
      "DELETION_PROTECTION": "bool",
      "DELETE_AUTOMATED_BACKUPS": "bool"
    }
```
## Properties

---

### TAGS
The tags for the RDS.
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
### PORT
The port on which the DB accepts connections.
- **Required** : No
- **Type** : String
### SOURCE_DB_IDENTIFIER
The identifier of the source DB instance from which to restore. Must match the identifier of an existing DB instance. Required if source_db_instance_automated_backups_arn or source_dbi_resource_id is not specified.
- **Required** : No
- **Type** : String
### PERFORMANCE_INSIGHTS_RETENTION_PERIOD
The amount of time in days to retain Performance Insights data.
- **Required** : No
- **Type** : String
### PERFORMANCE_INSIGHTS_ENABLED
Specifies whether Performance Insights are enabled. Defaults to false.
- **Required** : No
- **Type** : String
### ENGINE
The database engine.
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
### RDS_READ_REPLICA_OPTIONS
Provides an RDS DB option group resource.
- **Required** : Yes
- **Type**: List of JSONS
- **JSON Body**:
  - **option_name**  
      - The Name of the Option (e.g., MEMCACHED).

  - **option_settings**  
      - **name**:
        - The name of the setting,
      - **value**:
        - The value of the setting,
### PREFERRED_BACKUP_WINDOW
The daily time range during which automated backups are created if automated backups are enabled.
- **Required** : No
- **Type** : String
### PREFERRED_MAINTENANCE_WINDOW
The window to perform maintenance in.
- **Required** : No
- **Type** : String
### KMS_KEY_ID
The ARN for the KMS encryption key.
- **Required** : No
- **Type** : String
### LICENSE_MODEL
License model information for this DB instance.(Optional, but required for some DB engines, i.e., Oracle SE1)
- **Required** : No
- **Type** : String
### IAM_DATABASE_AUTHENTICATION_ENABLED
Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled.
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
### MAJOR_ENGINE_VERSION
The running version of the database.
- **Required** : Yes
- **Type** : String
### INSTANCE_CLASS
The instance type of the RDS instance.
- **Required** : Yes
- **Type** : String
### BACKUP_RETENTION_PERIOD
The days to retain backups for. Must be between 0 and 35. Must be greater than 0.
- **Required** : No
- **Type** : Integer
- **Default** : 7
### BACKUP_WINDOW
The daily time range (in UTC) during which automated backups are created if they are enabled.
- **Required** : No
- **Type** : String
### DELETE_AUTOMATED_BACKUPS
Specifies whether to remove automated backups immediately after the DB instance is deleted.
- **Required** : No
- **Type** : Boolean
### PUBLICLY_ACCESSIBLE
Boolean to control if instance is publicly accessible.
- **Required** : No
- **Type** : Boolean
- **Default**: False
### MONITORING_INTERVAL
The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance.
- **Required** : No
- **Type** : Integer
### MONITORING_ROLE_ARN
The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs.
- **Required** : No
- **Type** : String
### MAINTENANCE_WINDOW
The instance maintenance window.
- **Required** : No
- **Type** : String
### ALLOW_MAJOR_VERSION_UPGRADE
Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible.
- **Required** : No
- **Type** : Boolean
### SKIP_FINAL_SNAPSHOT
Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier
- **Required** : No
- **Type** : Boolean
- **Default**: True
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
### ENABLED_CLOUDWATCH_LOGS_EXPORTS
The database engine.
- **Required** : Yes
- **Type** : String

---

##  Resource Referencing Variables
Resource referencing variables available for RDS_READ_REPLICAS which can be used for cross resource referencing

### RDS_READ_REPLICA_DATABASE
- **Type** : String
- **Usage** :
    - Same Request
        - ${RDS_READ_REPLICAS[index].RDS_READ_REPLICA_DATABASE}
    - Previous Request
        - import ${\<reference name \>.RDS_READ_REPLICAS[index].RDS_READ_REPLICA_DATABASE}
### RDS_READ_REPLICA_DATABASE_ID
- **Type** : String
- **Usage** :
    - Same Request
        - ${RDS_READ_REPLICAS[index].RDS_READ_REPLICA_DATABASE_ID}
    - Previous Request
        - import ${\<reference name \>.RDS_READ_REPLICAS[index].RDS_READ_REPLICA_DATABASE_ID}
### RDS_READ_REPLICA_DATABASE_ARN
- **Type** : String
- **Usage** :
    - Same Request
        - ${RDS_READ_REPLICAS[index].RDS_READ_REPLICA_DATABASE_ARN}
    - Previous Request
        - import ${\<reference name \>.RDS_READ_REPLICAS[index].RDS_READ_REPLICA_DATABASE_ARN}
### RDS_READ_REPLICA_DATABASE
- **Type** : String
- **Usage** :
    - Same Request
        - ${RDS_READ_REPLICAS[index].RDS_READ_REPLICA_DATABASE_NAME}
    - Previous Request
        - import ${\<reference name \>.RDS_READ_REPLICAS[index].RDS_READ_REPLICA_DATABASE_NAME}
### RDS_READ_REPLICA_OPTION
- **Type** : String
- **Usage** :
    - Same Request
        - ${RDS_READ_REPLICAS[index].RDS_READ_REPLICA_OPTION}
    - Previous Request
        - import ${\<reference name \>.RDS_READ_REPLICAS[index].RDS_READ_REPLICA_OPTION}


