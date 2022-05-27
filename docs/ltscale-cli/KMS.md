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
```
{
    "ALIAS": "str",
    "DELETION_WINDOW_IN_DAYS": "int",
    "DESCRIPTION": "str",
    "KMS_POLICY_JSON": "str",
    "ENABLE_KEY_ROTATION": "bool",
    "KEY_USAGE": "str",
    "CUSTOMER_MASTER_KEY_SPEC": "str"
    "TAGS":"JSON"
}

```
## Properties

---
### ALIAS
Specifies the alias name. The alias must be string of 1-256 characters. It can contain only alphanumeric characters, forward slashes (/), underscores (_), and dashes (-).
 - **Required** : Yes
 - **Type** : String

### DELETION_WINDOW_IN_DAYS
The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30.
- **Required** : No
- **Type** : Integer
- **Default**: 7

### KMS_POLICY_JSON
A valid policy JSON document. Policy JSON must be stringified before being added.
- **Required** : Yes
- **Type** : String

Example
```
{\n    \"Version\": \"2012-10-17\",\n    \"Id\": \"Key policy created by CloudTrail\",\n    \"Statement\": [\n        {\n            \"Sid\": \"Enable IAM User Permissions\",\n            \"Effect\": \"Allow\",\n            \"Principal\": \"*\",\n            \"Action\": \"kms:*\",\n            \"Resource\": \"*\"\n        }\n    ]\n}
```

### ENABLE_KEY_ROTATION
A boolean flag to enable/disable KMS key rotation.
- **Required** : No
- **Type**: Boolean
- **Default** : True

### KEY_USAGE
Determines the cryptographic operations for which you can use the KMS key
- **Required** : No
- **Type**: String
- **Default** : "ENCRYPT_DECRYPT"
- **Allowed Values** : 
    - "ENCRYPT_DECRYPT"
    - "SIGN_VERIFY"

### CUSTOMER_MASTER_KEY_SPEC
Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports
- **Required** : No
- **Type**: String
- **Default** : SYMMETRIC_DEFAULT
- **Allowed Values** : 
    - SYMMETRIC_DEFAULT
    - RSA_2048
    - RSA_3072 
    - RSA_4096 
    - ECC_NIST_P256
    - ECC_NIST_P384
    - ECC_NIST_P521
    - ECC_SECG_P256K1

### TAGS
The tags for the KMS.
- **Required**: No
- **Type**: JSON

---
##  Resource Referencing Variables
Resource referencing variables avaialbe for KMS which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### KMS_KEY
KMS key created 
- **Type** : KMS object
- **Usage** :
    - Same Request
        - ${KMS[index].KMS_KEY}
    - Previous Request
        - import ${\<reference name \>.KMS[index].KMS_KEY}

### KMS_KEY_ARN
ARN of the created KMS key.
- **Type** : String
- **Usage** :
    - Same Request
        - ${KMS[index].KMS_KEY_ARN}
    - Previous Request
        - import ${\<reference name \>.KMS[index].KMS_KEY_ARN}