---
layout: comx
title: IAM Policy
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/iam-policy/index.html
---
# IAM Policy
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---



# IAM Policy
> You manage access in AWS by creating policies and attaching them to IAM identities (users, groups of users, or roles) or AWS resources. A policy is an object in AWS that, when associated with an identity or resource, defines their permissions.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
    "NAME": "str",
    "DESCRIPTION": "str",
    "POLICY_JSON": "bool",
    "POLICY": "str",
    "STATEMENTS": [
        {
            "effect": "str",
            "actions": "list",
            "resources": "list",
            "condition": [
                {
                    "test": "str",
                    "variable": "str",
                    "values": "list"
                }
            ]
        }
    ]
}

```
## Properties

---
### NAME
The name of the policy document.
This parameter allows (through its regex pattern) a string of characters consisting of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters _+=,.@-
 - **Required** : Yes
 - **Type** : String

### DESCRIPTION
Description of the IAM policy
- **Required** : Yes
- **Type** : String

### POLICY_JSON
A boolean key to define if the policy document would be added as stringifed json or by using the statements key. If True Policy should be added in policy key as stringifed json otherwise use statements variable to pass a json.
- **Required** : No
- **Type** : Boolean
- **Default**: False


### POLICY
A valid policy JSON document. Policy JSON must be stringified before being added.
- **Required** : Yes
- **Type** : String


### STATEMENTS
The statements for an IAM policy
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
    - **resources**:
        - *The resources for which the statement is being added *
            - **Required** : No
            - **Type** : List of Strings
            
    - **condition**:
        - *A condition to apply on the policy*
            - **Required** : No
            - **Type** : List of Condtion
            - **Condition Body**:
                - **test**:
                    - *The test for the condition*
                        - **Required** : Yes
                        - **Type** : String
                - **variable**:
                    - *The variable for the condition to check*
                        - **Required** : Yes
                        - **Type** : String
                - **values**:
                    - *The values for the condition.*
                        - **Required** : No
                        - **Type** : List of String
                        

---
##  Resource Referencing Variables
Resource referencing variables avaialbe for IAM Policy which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### IAM_POLICY
IAM policy  created 
- **Type** : Policy object
- **Usage** :
    - Same Request
        - ${IAM_Policy[index].IAM_POLICY}
    - Previous Request
        - import ${\<reference name \>.IAM_Policy[index].IAM_POLICY}

### IAM_POLICY_NAME
Name of the IAM policy created. 
- **Type** : String
- **Usage** :
    - Same Request
        - ${IAM_Policy[index].IAM_POLICY_NAME}
    - Previous Request
        - import ${\<reference name \>.IAM_Policy[index].IAM_POLICY_NAME}

### IAM_POLICY_ARN
ARN of the polic created 
- **Type** : String
- **Usage** :
    - Same Request
        - ${IAM_Policy[index].IAM_POLICY_ARN}
    - Previous Request
        - import ${\<reference name \>.IAM_Policy[index].IAM_POLICY_ARN}
