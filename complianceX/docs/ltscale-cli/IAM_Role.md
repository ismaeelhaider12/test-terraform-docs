---
layout: comx
title: IAM Role
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/iam-role/index.html
---
# IAM Role
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


# IAM Role
> An IAM role is an IAM identity that you can create in your account that has specific permissions. An IAM role is similar to an IAM user, in that it is an AWS identity with permission policies that determine what the identity can and cannot do in AWS. However, instead of being uniquely associated with one person, a role is intended to be assumable by anyone who needs it.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
    "NAME": "str",
    "CREATE_INSTANCE_PROFILE": "bool",
    "POLICIES_ARN": "list",
    "PATH": "str",
    "STATEMENTS": [
    {
        "effect": "str",
        "actions": "list",
        "principals": {
        "type": "str",
        "identifiers": "list"
        }
    }
    ],
    "TAGS": "JSON"
    
}


```
## Properties

---

### NAME
Friendly name of the role
 - **Required** : Yes
 - **Type** : String

### CREATE_INSTANCE_PROFILE
A boolean key to create an instance profile
- **Required** : No
- **Type** : Boolean
- **Default** : False

### POLICIES_ARN
List of ARNS of policies to attach
- **Required** : No
- **Type** : List


### PATH
Path to the role
- **Required** : Yes
- **Type** : String

### STATEMENTS
Policy Statements for assume role
- **Required** : No
- **Type** : List of Statements
- **Statement  Body**:
    - **effect**:
        - *The effect of the statement*
            - **Required** : Yes
            - **Type** : String
    - **actions**:
        - *The actions for which the statement is being added.*
            - **Required** : No
            - **Type** : List of Strings
            
    - **principals**:
        - *A principal to apply on the policy*
            - **Required** : No
            - **Type** : Object of principal
            - **Condition Body**:
                - **type**:
                    - *The type of principal*
                        - **Required** : Yes
                        - **Type** : String
                - **identifiers**:
                    - *The identifier of the principal*
                        - **Required** : Yes
                        - **Type** : String
                        
### TAGS
The tags for the IAM Role.
- **Required**: No
- **Type**: JSON

---

##  Resource Referencing Variables
Resource referencing variables avaialbe for IAM Policy which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### IAM_ROLE
IAM Role  created 
- **Type** : Role object
- **Usage** :
    - Same Request
        - ${IAM_Role[index].IAM_ROLE}
    - Previous Request
        - import ${\<reference name \>.IAM_Role[index].IAM_ROLE}

### IAM_ROLE_ARN
ARN of the IAM Role created. 
- **Type** : String
- **Usage** :
    - Same Request
        - ${IAM_Role[index].IAM_ROLE_ARN}
    - Previous Request
        - import ${\<reference name \>.IAM_Role[index].IAM_ROLE_ARN}

### IAM_ROLE_NAME
Name of the role created 
- **Type** : String
- **Usage** :
    - Same Request
        - ${IAM_Role[index].IAM_ROLE_NAME}
    - Previous Request
        - import ${\<reference name \>.IAM_Role[index].IAM_ROLE_NAME}


### IAM_INSTANCE_PROFILE
IAM Instance Profile  created 
- **Type** : Role object
- **Usage** :
    - Same Request
        - ${IAM_Role[index].IAM_INSTANCE_PROFILE}
    - Previous Request
        - import ${\<reference name \>.IAM_Role[index].IAM_INSTANCE_PROFILE}

### IAM_INSTANCE_PROFILE_ARN
ARN of the IAM Instance Profile created. 
- **Type** : String
- **Usage** :
    - Same Request
        - ${IAM_Role[index].IAM_INSTANCE_PROFILE_ARN}
    - Previous Request
        - import ${\<reference name \>.IAM_Role[index].IAM_INSTANCE_PROFILE_ARN}

### IAM_INSTANCE_PROFILE_NAME
Name of the the IAM Instance Profile created. 
- **Type** : String
- **Usage** :
    - Same Request
        - ${IAM_Role[index].IAM_INSTANCE_PROFILE_NAME}
    - Previous Request
        - import ${\<reference name \>.IAM_Role[index].IAM_INSTANCE_PROFILE_NAME}