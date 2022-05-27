
---
layout: comx
title: EKS Fargate
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/eks-fargate/index.html
---
# EKS Fargate
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


# EKS_FARGATE
> Amazon Elastic Kubernetes Service (Amazon EKS) is a managed container service to run and scale Kubernetes applications in the cloud or on-premises.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
    "LOGS_RETENTION_IN_DAYS": "int",
    "CLUSTER_ROLE_ARN": "str",
    "KMS_ARN": "str",
    "SECURITY_GROUP_IDS": "list",
    "CLUSTER_SUBNET_IDS": "list",
    "ENDPOINT_PUBLIC_ACCESS": "bool",
    "PUBLIC_ACCESS_CIDRS": "list",
    "ENDPOINT_PRIVATE_ACCESS": "bool",
    "CLUSTER_NAME": "str",
    "KUBERNETES_VERSION": "str",
    "LOGGING_TYPE": "list",
    "CODEBUILD_ROLE_NAME": "str",
    "FARGATE_PROFILE": [
    {
        "fargate_profile_name": "str",
        "pod_execution_role_arn": "str",
        "subnet_ids": "list",
        "selector": [
        {
            "namespace": "str"
        }
        ]
    }
    ],
    "TAGS": "str"
}
```

## Properties

---

### LOGS_RETENTION_IN_DAYS
The number of days log events retained in the specified log group.
- **Required** : No
- **Type** : Integer
- **Default** :  7


### CLUSTER_ROLE_ARN
ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf.
- **Required**: Yes
- **Type** : String

### KMS_ARN
ARN of the Key Management Service (KMS) customer master key (CMK)
- **Required** : No
- **Type** : String


### SECURITY_GROUP_IDS
List of security group IDs for the cross-account elastic network interfaces that Amazon EKS creates to use to allow communication between your worker nodes and the Kubernetes control plane
- **Required** : Yes
- **Type** : List

### CLUSTER_SUBNET_IDS
List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane.
- **Required** : Yes
- **Type** : List

### ENDPOINT_PUBLIC_ACCESS
Whether the Amazon EKS public API server endpoint is enabled
- **Required** : No
- **Type** : Boolean
- **Default** :  True

### PUBLIC_ACCESS_CIDRS
List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled
- **Required** : No
- **Type** : List

### ENDPOINT_PRIVATE_ACCESS
A boolean flag to enable/disable assigning of public ip address to an instance on launch
- **Required** : No
- **Type** : Boolean
- **Default** :  False

### CLUSTER_NAME
Name of the cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores
- **Required** : Yes
- **Type** : String

### KUBERNETES_VERSION
Desired Kubernetes master version
- **Required** : No
- **Type** : String
- **Default** :  1.21

### LOGGING_TYPE
List of the desired control plane logging to enable
- **Required** : Yes
- **Type** : List


### CODEBUILD_ROLE_NAME
A role name for codebuild.
- **Required** : Yes
- **Type** : String

### FARGATE_PROFILE
Manages an EKS Fargate Profile.
- **Required** : Yes
- **Type**: List of Fargate Profile
- **Fargate Profile Body**:
    - **fargate_profile_name**:
        - *Name of the EKS Fargate Profile.*
            - **Required** : Yes
            - **Type** : String
    - **pod_execution_role_arn**:
        - *Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Fargate Profile.*
            - **Required** : Yes
            - **Type** : String
    - **subnet_ids**:
        - *Identifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster).*
            - **Required** : Yes
            - **Type** : List of Strings
    
    - **selector**:
        - *Configuration block(s) for selecting Kubernetes Pods to execute with this EKS Fargate Profile.*
            - **Required** : Yes
            - **Type** : List of Selectors 
            - **Selector Body**:
                - **namespace**:
                    - *Kubernetes namespace for selection.*
                        - **Required** : Yes
                        - **Type** : String

### TAGS
The tags for the EKS Fargate.
- **Required**: No
- **Type**: JSON

---

##  Resource Referencing Variables
Resource referencing variables avaialbe for EKS Fargate which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 


### EKS_CLUSTER_ARN
ARN of the EKS cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_FARGATE[index].EKS_CLUSTER_ARN}
    - Previous Request
        - import ${\<reference name \>.EKS_FARGATE[index].EKS_CLUSTER_ARN}
### EKS_CLUSTER_ENDPOINT
End point of the EKS cluster being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_FARGATE[index].EKS_CLUSTER_ENDPOINT}
    - Previous Request
        - import ${\<reference name \>.EKS_FARGATE[index].EKS_CLUSTER_ENDPOINT}
### EKS_CLUSTER_ID
ID of the EKS cluster being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_FARGATE[index].EKS_CLUSTER_ID}
    - Previous Request
        - import ${\<reference name \>.EKS_FARGATE[index].EKS_CLUSTER_ID}
### EKS_FARGATE_ARN
ARN of the EKS fargate being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_FARGATE[index].EKS_FARGATE_ARN}
    - Previous Request
        - import ${\<reference name \>.EKS_FARGATE[index].EKS_FARGATE_ARN}

### EKS_FARGATE_ID
ID of the EKS fargate being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_FARGATE[index].EKS_FARGATE_ID}
    - Previous Request
        - import ${\<reference name \>.EKS_FARGATE[index].EKS_FARGATE_ID}

### EKS_FARGATE_STATUS
Status of the EKS fargate being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_FARGATE[index].EKS_FARGATE_STATUS}
    - Previous Request
        - import ${\<reference name \>.EKS_FARGATE[index].EKS_FARGATE_STATUS}

