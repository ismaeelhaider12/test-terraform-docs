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

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->
