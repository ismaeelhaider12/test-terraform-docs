---
layout: comx
title: KMS
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/kms/index.html
---
# KMS Fargate
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


# KMS
> AWS Key Management Service (AWS KMS) makes it easy for you to create and manage cryptographic keys and control their use across a wide range of AWS services and in your applications.The KMS resource specifies a symmetric or asymmetric KMS key in AWS Key Management Service (AWS KMS).

To create this entity in your **Litmus Scale** template, use the following data:
<!-- BEGIN_TF_DOCS -->
```
{
    "ENABLE_KEY_ROTATION": "bool"
    "TAGS": "map"
    "DELETION_WINDOW_IN_DAYS": "number"
    "ALIAS": "string"
    "CUSTOMER_MASTER_KEY_SPEC": "string"
    "DESCRIPTION": "string"
    "KEY_USAGE": "string"
    "KMS_POLICY_JSON": "string"
    "REGION": "string"
} 
```
## Properties
---
### ENABLE\_KEY\_ROTATION
- **Type** : bool
- **Default** : true
- **Required**: No 

A boolean flag to enable/disable KMS key rotation.

### TAGS
- **Type** : map
- **Default** : {
  "TagKey": "TagValue"
}
- **Required**: No 

The tags for the KMS.

### DELETION\_WINDOW\_IN\_DAYS
- **Type** : number
- **Default** : 7

### ALIAS
- **Type** : string
- **Default** : ""
- **Required**: Yes 

Specifies the alias name. The alias must be string of 1-256 characters. It can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-).

### CUSTOMER\_MASTER\_KEY\_SPEC
- **Type** : string
- **Default** : "SYMMETRIC_DEFAULT"
- **Required**: No 

Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports.
- **Allowed Values** : 
    - SYMMETRIC_DEFAULT
    - RSA_2048
    - RSA_3072 
    - RSA_4096 
    - ECC_NIST_P256
    - ECC_NIST_P384
    - ECC_NIST_P521
    - ECC_SECG_P256K1

### DESCRIPTION
- **Type** : string
- **Default** : ""

### KEY\_USAGE
- **Type** : string
- **Default** : "ENCRYPT_DECRYPT"
- **Required**: No 

A boolean flag to enable/disable KMS key rotation.

### KMS\_POLICY\_JSON
- **Type** : string
- **Default** : ""
- **Required**: Yes 

A valid policy JSON document. Policy JSON must be stringified before being added.
Example
```
{\n    \"Version\": \"2012-10-17\",\n    \"Id\": \"Key policy created by CloudTrail\",\n    \"Statement\": [\n        {\n            \"Sid\": \"Enable IAM User Permissions\",\n            \"Effect\": \"Allow\",\n            \"Principal\": \"*\",\n            \"Action\": \"kms:*\",\n            \"Resource\": \"*\"\n        }\n    ]\n}
```

### REGION
- **Type** : string
- **Default** : ""

---

## Resource Referencing Variables
Resource referencing variables avaialbe for RDS which can be used for cross resource referencing
> Note : Replace index and reference with your desired value

### KMS\_KEY
KMS key created 
- **Type** : KMS object
- **Usage** :
    - Same Request
        - \$]{KMS[index].KMS_KEY}
    - Previous Request
        - import \$\{<reference name >.KMS[index].KMS_KEY}

### KMS\_KEY\_ARN
ARN of the created KMS key.
- **Type** : String
- **Usage** :
    - Same Request
        - \$\{KMS[index].KMS_KEY_ARN}
    - Previous Request
        - import \$\{<reference name >.KMS[index].KMS_KEY_ARN}

<!-- END_TF_DOCS -->
