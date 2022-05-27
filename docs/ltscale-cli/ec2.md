---
layout: comx
title: EC2
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/ec2/index.html
---
# EC2
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
# EC2
> Amazon EC2 provides a wide selection of instance types optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity and give you the flexibility to choose the appropriate mix of resources for your applications.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
      "TAGS": "str",
      "NAME": "str",
      "AMI": "str",
      "INSTANCE_TYPE": "str",
      "KEY_NAME": "str",
      "EC2_SECURITY_GROUP_IDS": "list",
      "SUBNET_ID": "str",
      "ASSOCIATE_PUBLIC_IP_ADDRESS": "bool",
      "USER_DATA": "str",
      "IAM_INSTANCE_PROFILE": "str",
      "EBS_BLOCK_DEVICE": [
        {
          "device_name": "str",
          "volume_type": "str",
          "volume_size": "int",
          "delete_on_termination": "bool",
          "kms_key_id": "str"
        }
      ],
      "ROOT_BLOCK_DEVICE": {
        "volume_size": "int",
        "volume_type": "str",
        "kms_key_id": "str"
      },
      "MONITORING": "bool",
      "TENANCY": "str"
    }
```
## Properties
---


### Name
The name of the Ec2 which is going to be provisioned
 - **Required** : Yes
 - **Type** : String

### AMI
AMI to use for the instance.
- **Required** : Yes
- **Type** : String

### INSTANCE_TYPE
The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance.
- **Required** : Yes
- **Type** : String

### KEY_NAME
The name of the key pair. You can create a key pair using CreateKeyPair or ImportKeyPair.
- **Required** : No
- **Type** : String

### EC2_SECURITY_GROUP_IDS
The IDs of the security groups. You can create a security group using CreateSecurityGroup.
- **Required** : No
- **Type**: List of Strings
- **Default** : []

### SUBNET_ID
The ID of the subnet to launch the instance into.
- **Required** : Yes
- **Type** : String

### ASSOCIATE_PUBLIC_IP_ADDRESS
Whether to associate a public IP address with an instance in a VPC.
- **Required** : No
- **Type** : ""

### USER_DATA
The user data script to make available to the instance. 
- **Required** : No
- **Type** : String

### IAM_INSTANCE_PROFILE
The name of an IAM instance profile.
- **Required** : No
- **Type** : String

### EBS_BLOCK_DEVICE
A boolean flag to enable/disable assigning of public ip address to an instance on launch
- **Required** : No
- **Type**: List of Strings

### ROOT_BLOCK_DEVICE
- **volume_size**: 
  - *Size of the volume in gibibytes (GiB).*
    - **Required**: True
    - **Type**: Integer
- **volume_type**: 
  - * Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2.*
    - **Required**: True
    - **Type**: String
- **kms_key_id**: 
  - *Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection.*
    - **Required**: True
    - **Type**: String
        
### MONITORING
Specifies whether detailed monitoring is enabled for the instance.
- **Required**: No
- **Type**: ""

##  TENANCY
The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware.
- **Required**: No
- **Type**: ""

### TAGS
The tags to add to the instance.
 - **Required** : No
 - **Type** : JSON

---
##  Resource Referencing Variables
Resource referencing variables avaialbe for EC2 which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### EC2_INSTANCE
EC2 Instance of the created EC2.
- **Type** : Object
- **Usage** :
    - Same Request
        - ${EC2[index].EC2_INSTANCE}
    - Previous Request
        - import ${ref.EC2[index].EC2_INSTANCE}

### EC2_INSTANCE_ID
EC2 Instance ID of the created EC2.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EC2[index].EC2_INSTANCE_ID}
    - Previous Request
        - import ${ref.EC2[index].EC2_INSTANCE_ID}	
      
### EC2_INSTANCE_ARN
EC2 Instance ARN of the created EC2.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EC2[index].EC2_INSTANCE_ARN}
    - Previous Request
        - import ${ref.EC2[index].EC2_INSTANCE_ARN}

