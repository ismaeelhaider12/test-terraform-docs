---
layout: comx
title: RDS
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/rds/index.html
---
# RDS
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# RDS
> Amazon Relational Database Service (RDS) is a collection of managed services that makes it simple to set up, operate, and scale databases in the cloud. Choose from seven popular engines — Amazon Aurora with MySQL compatibility, Amazon Aurora with PostgreSQL compatibility, MySQL, MariaDB, PostgreSQL, Oracle, and SQL Server 

To create this entity in your **Litmus Scale** template, use the following data:
```
{
      "IDENTIFIER": "str",
      "MONITORING_ROLE_ARN": "str",
      "ENGINE": "str",
      "PERFORMANCE_INSIGHTS_ENABLED": "bool",
      "SUBNET_IDS": "list",
      "SECURITY_GROUP_IDS": "list",
      "KMS_KEY_ARN": "str",
      "PERFORMANCE_INSIGHTS_RETENTION_PERIOD": "int",
      "MAJOR_ENGINE_VERSION": "str",
      "ENGINE_VERSION": "str",
      "INSTANCE_CLASS": "str",
      "NAME": "str",
      "USERNAME": "str",
      "PASSWORD": "str",
      "PORT": "str",
      "MAINTENANCE_WINDOW": "str",
      "BACKUP_WINDOW": "str",
      "STORAGE_TYPE": "str",
      "FAMILY": "str",
      "BACKUP_RETENTION_PERIOD": "int",
      "ALLOCATED_STORAGE": "int",
      "MAX_ALLOCATED_STORAGE": "int",
      "IOPS": "int",
      "PUBLICLY_ACCESSIBLE": "bool",
      "SKIP_FINAL_SNAPSHOT": "bool",
      "FINAL_SNAPSHOT_IDENTIFIER": "str",
      "DELETE_AUTOMATED_BACKUPS": "bool",
      "DELETION_PROTECTION": "bool",
      "RDS_PARAMETERS": [
        {
          "name": "str",
          "value": "str"
        }
      ],
      "RDS_OPTIONS": [
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
      "SNAPSHOT_IDENTIFIER": "str",
      "LICENSE_MODEL": "str",
      "IAM_DATABASE_AUTHENTICATION_ENABLED": "bool",
      "DOMAIN": "str",
      "DOMAIN_IAM_ROLE_NAME": "str",
      "MULTI_AZ": "bool",
      "MONITORING_INTERVAL": "int",
      "ALLOW_MAJOR_VERSION_UPGRADE": "bool",
      "AUTO_MINOR_VERSION_UPGRADE": "bool",
      "APPLY_IMMEDIATELY": "bool",
      "COPY_TAGS_TO_SNAPSHOT": "bool",
      "ENABLED_CLOUDWATCH_LOGS_EXPORTS": "list",
      "TAGS": "JSON",
    }

```
## Properties

---

### IDENTIFIER
The name of the RDS instance.
 - **Required** : Yes
 - **Type** : String

### MONITORING_ROLE_ARN
The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs.
- **Required** : No
- **Type** : String

### ENGINE
The database engine.
- **Required** : Yes
- **Type** : String

### PERFORMANCE_INSIGHTS_ENABLED
Specifies whether Performance Insights are enabled.
- **Required** : No
- **Type**: Boolean
- **Default** : True

### SUBNET_IDS
 A list of VPC subnet IDs.
- **Required** : Yes
- **Type**: List of Strings

### SECURITY_GROUP_IDS
List of VPC security groups to associate.
- **Required** : Yes
- **Type**: List of Strings

### KMS_KEY_ARN
The ARN for the KMS encryption key
- **Required** : Yes
- **Type** : String

### PERFORMANCE_INSIGHTS_RETENTION_PERIOD
The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true.
- **Required** : No
- **Type** : Integer
- **Default**: 7
### MAJOR_ENGINE_VERSION
The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7
- **Required** : No
- **Type** : String

### ENGINE_VERSION
The running version of the database.
- **Required** : Yes
- **Type** : String
### INSTANCE_CLASS
The RDS instance class.
- **Required** : Yes
- **Type** : String
### NAME
The database name.
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
### PORT
The port on which the DB accepts connections.
- **Required** : Yes
- **Type** : String
### MAINTENANCE_WINDOW
The instance maintenance window.
- **Required** : No
- **Type** : String
- **Default** : Mon:00:00-Mon:03:00
### BACKUP_WINDOW
The daily time range (in UTC) during which automated backups are created if they are enabled. Must not overlap with maintenance_window
- **Required** : No
- **Type** : String
- **Default** : 09:46-10:16
### STORAGE_TYPE
Specifies the storage type to be associated with the DB instance.
- **Required** : No
- **Type** : String
- **Default** : gp2
- **Allowed Values** : 
    - standard
    - gp2 
    - io1
### FAMILY
The RDS instance family.
- **Required** : Yes
- **Type** : String
### BACKUP_RETENTION_PERIOD
The days to retain backups for. Must be between 0 and 35. Must be greater than 0.
- **Required** : No
- **Type** : Integer
- **Default** : 7
### ALLOCATED_STORAGE
The allocated storage in gibibytes.
- **Required** : No
- **Type** : Integer
- **Default** : 20

### MAX_ALLOCATED_STORAGE
When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage.
- **Required** : No
- **Type** : Integer
- **Default** : 25
### IOPS
The amount of provisioned IOPS. Setting this implies a storage_type of "io1".
- **Required** : No
- **Type** : Integer
- **Default**: 100
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
### FINAL_SNAPSHOT_IDENTIFIER
The name of your final DB snapshot when this DB instance is deleted
- **Required** : No
- **Type** : String
### DELETE_AUTOMATED_BACKUPS
Specifies whether to remove automated backups immediately after the DB instance is deleted.
- **Required** : No
- **Type** : Boolean
- **Default** : True
### DELETION_PROTECTION
If the DB instance should have deletion protection enabled.
- **Required** : No
- **Type** : Boolean
- **Default** : False

### RDS_PARAMETERS
Provides an RDS DB parameter group resource
- **Required** : No
- **Type** : List of RDS Parameters
- **RDS Parameter Body**:
    - **name**:
        - *The name of the DB parameter group.*
            - **Required** : Yes
            - **Type** : String
    - **value**:
        - *The value of the DB parameter.*
            - **Required** : Yes
            - **Type** : String
    
### RDS_OPTIONS
Provides an RDS DB option group resource
- **Required** : No
- **Type** : List of RDS Options
- **RDS Option Body**:
    - **option_name**:
        - *The Name of the Option*
            - **Required** : Yes
            - **Type** : String
    - **option_settings**:
        - *A list of option settings to apply.*
            - **Required** : Yes
            - **Type** : List of Option Settings
            - **Option Setting Body**:
                - **name**:
                    - *The Name of the setting*
                        - **Required** : Yes
                        - **Type** : String
                - **value**:
                    - *The Value of the setting*
                        - **Required** : Yes
                        - **Type** : String
      

### SNAPSHOT_IDENTIFIER
Specifies whether or not to create this database from a snapshot
- **Required** : No
- **Type** : String
### LICENSE_MODEL
License model information for this DB instance
- **Required** : No
- **Type** : String
### IAM_DATABASE_AUTHENTICATION_ENABLED
Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled.
- **Required** : No
- **Type** : Boolean
- **Default** : False
### DOMAIN
The ID of the Directory Service Active Directory domain to create the instance in.
- **Required** : No
- **Type** : String
### DOMAIN_IAM_ROLE_NAME
The name of the IAM role to be used when making API calls to the Directory Service.
- **Required** : No
- **Type** : String
### MULTI_AZ
Specifies if the RDS instance is multi-AZ
- **Required** : No
- **Type** : Boolean
- **Default** : True
### MONITORING_INTERVAL
The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0.
- **Required** : No
- **Type** : String
- **Default** : 0
- **Allowed Values** :
  - 0
  - 1
  - 5
  - 10
  - 15
  - 30
  - 60
### ALLOW_MAJOR_VERSION_UPGRADE
Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible.
- **Required** : No
- **Type** : Boolean
- **Default** : False
### AUTO_MINOR_VERSION_UPGRADE
Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window.
- **Required** : No
- **Type** : Boolean
- **Default** : True

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


### TAGS
The tags for the RDS.
- **Required**: No
- **Type**: JSON

---

##  Resource Referencing Variables
Resource referencing variables avaialbe for RDS which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### RDS_DATABASE
RDS Database instance created 
- **Type** : RDS object
- **Usage** :
    - Same Request
        - ${RDS[index].RDS_DATABASE}
    - Previous Request
        - import ${\<reference name \>.RDS[index].RDS_DATABASE}

### RDS_DATABASE_ID
Database id  of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${RDS[index].RDS_DATABASE_ID}
    - Previous Request
        - import ${\<reference name \>.RDS[index].RDS_DATABASE_ID}

### RDS_DATABASE_NAME
Database name  of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${RDS[index].RDS_DATABASE_NAME}
    - Previous Request
        - import ${\<reference name \>.RDS[index].RDS_DATABASE_NAME}

### RDS_DATABASE_ARN
Database ARN  of the created RDS instance.
- **Type** : String
- **Usage** :
    - Same Request
        - ${RDS[index].RDS_DATABASE_ARN}
    - Previous Request
        - import ${\<reference name \>.RDS[index].RDS_DATABASE_ARN}

### RDS_SUBNET_GROUP
Database Subnet Group  of the created RDS instance.
- **Type** : Subnet Group Object
- **Usage** :
    - Same Request
        - ${RDS[index].RDS_SUBNET_GROUP}
    - Previous Request
        - import ${\<reference name \>.RDS[index].RDS_SUBNET_GROUP}

### RDS_PARAMETER_GROUP
Database Parameter Group of the created RDS instance.
- **Type** : Parameter Group Object
- **Usage** :
    - Same Request
        - ${RDS[index].RDS_PARAMETER_GROUP}
    - Previous Request
        - import ${\<reference name \>.RDS[index].RDS_PARAMETER_GROUP}

### RDS_OPTION
Database Option Group of the created RDS instance.
- **Type** : Option Group Object
- **Usage** :
    - Same Request
        - ${RDS[index].RDS_OPTION}
    - Previous Request
        - import ${\<reference name \>.RDS[index].RDS_OPTION}


