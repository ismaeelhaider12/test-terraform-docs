---
layout: comx
title: EKS Node Group
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/eks-node-group/index.html
---
# EKS Node Group
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


# EKS_NODE_GROUP
> Amazon Elastic Kubernetes Service (Amazon EKS) is a managed container service to run and scale Kubernetes applications in the cloud or on-premises.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
    "IMAGE_ID": "str",
    "TEMPLATE_NAME": "str",
    "KEY_NAME": "str",
    "ASSOCIATE_PUBLIC_IP_ADDRESS": "bool",
    "USER_DATA": "str",
    "EBS_BLOCK_DEVICE": [
    {
        "device_name": "str",
        "ebs": {
        "delete_on_termination": "bool",
        "volume_type": "str",
        "kms_key_id": "str",
        "volume_size": "int"
        }
    }
    ],
    "LOGS_RETENTION_IN_DAYS": "int",
    "CREATE_CLUSTER": "bool",
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
    "NODE_ROLE_ARN": "str",
    "DESIRED_CAPACITY": "int",
    "MAX_SIZE": "int",
    "MIN_SIZE": "int",
    "NODE_INSTANCE_TYPE": "str",
    "NODE_GROUP_SUBNET_IDS": "list",
    "AMI_TYPE": "str",
    "CAPACITY_TYPE": "str",
    "TAGS": "str",
    "INSTANCE_TAGS": "str",
    "CODEBUILD_ROLE_NAME": "str",
    "ALB_INGRESS_POLICY_ARN": "str"
}
```

## Properties
---
### IMAGE_ID
The AMI from which to launch the instance
- **Required** : Yes
- **Type** : String

### TEMPLATE_NAME
The name of the launch template.
- **Required** : Yes
- **Type** : String

### KEY_NAME
The key name to use for the instance
- **Required** : Yes
- **Type** : String

### ASSOCIATE_PUBLIC_IP_ADDRESS
Associate a public ip address with the network interface.
- **Required** : No
- **Type**: Boolean
- **Default** : True

### USER_DATA
The base64-encoded user data to provide when launching the instance.
- **Required** : Yes
- **Type**: String

### EBS_BLOCK_DEVICE
Specify volumes to attach to the instance besides the volumes specified by the AMI
- **Required** : Yes
- **Type**: List of EBS Block
- **EBS Block Body**:
    - **device_name**:
        - *The name of the device to mount.*
            - **Required** : Yes
            - **Type** : String
    - **ebs**:
        - *The volume to attach*
            - **Required** : Yes
            - **Type** : Object of EBS 
            - **EBS Block Body**:
                - **delete_on_termination**:
                    - *Whether the volume should be destroyed on instance termination*
                        - **Required** : Yes
                        - **Type** : Boolean
                - **volume_type**:
                    - *The volume type.*
                        - **Required** : Yes
                        - **Type** : String
                - **kms_key_id**:
                    - *The ARN of the AWS Key Management Service (AWS KMS) customer master key (CMK) to use when creating the encrypted volume.*
                        - **Required** : Yes
                        - **Type** : String
                - **volumne_size**:
                    - *The size of the volume in gigabytes.*
                        - **Required** : Yes
                        - **Type** : Integer
                
            

### LOGS_RETENTION_IN_DAYS
The number of days log events retained in the specified log group.
- **Required** : No
- **Type** : Integer
- **Default** :  7

### CREATE_CLUSTER
A boolean flag to create cluster.
- **Required** : No
- **Type** : Boolean
- **Default** :  True

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


### NODE_ROLE_ARN
Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group
- **Required** : Yes
- **Type** : String

### DESIRED_CAPACITY
Desired number of worker nodes
- **Required** : No
- **Type** : Integer
- **Default** : 1
### MAX_SIZE
Maximum number of worker nodes.
- **Required** : No
- **Type** : Integer
- **Default** : 1

### MIN_SIZE
Minimum number of worker nodes.

- **Required** : No
- **Type** : Integer
- **Default** : 1
### NODE_INSTANCE_TYPE
Instance type associated with the EKS Node Group
- **Required** : Yes
- **Type** : String
### NODE_GROUP_SUBNET_IDS
Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)
- **Required** : Yes
- **Type** : List

### AMI_TYPE
Type of Amazon Machine Image (AMI) associated with the EKS Node Group
- **Required** : No
- **Type** : String
- **Default** : CUSTOM
### CAPACITY_TYPE
Type of capacity associated with the EKS Node Group
- **Required** : Yes
- **Type** : String

### CODEBUILD_ROLE_NAME
A role name for codebuild.
- **Required** : Yes
- **Type** : String

### ALB_INGRESS_POLICY_ARN
To attach the policy with the service account which is used by the loadbalancer ingress.
- **Required** : Yes
- **Type** : String


### INSTANCE_TAGS
The tags for the ec2 instances being created.
- **Required**: No
- **Type**: JSON



### TAGS
The tags for the EKS.
- **Required**: No
- **Type**: JSON

---

##  Resource Referencing Variables
Resource referencing variables avaialbe for EKS Node Group which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### LAUNCH_TEMPLATE_ARN
ARN of the launch template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_NODE_GROUP[index].LAUNCH_TEMPLATE_ARN}
    - Previous Request
        - import ${\<reference name \>.EKS_NODE_GROUP[index].LAUNCH_TEMPLATE_ARN}

### LAUNCH_TEMPLATE_ID
ID of the launch template being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_NODE_GROUP[index].LAUNCH_TEMPLATE_ID}
    - Previous Request
        - import ${\<reference name \>.EKS_NODE_GROUP[index].LAUNCH_TEMPLATE_ID}
### EKS_CLUSTER_ARN
ARN of the EKS cluster.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_NODE_GROUP[index].EKS_CLUSTER_ARN}
    - Previous Request
        - import ${\<reference name \>.EKS_NODE_GROUP[index].EKS_CLUSTER_ARN}
### EKS_CLUSTER_ENDPOINT
End point of the EKS cluster being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_NODE_GROUP[index].EKS_CLUSTER_ENDPOINT}
    - Previous Request
        - import ${\<reference name \>.EKS_NODE_GROUP[index].EKS_CLUSTER_ENDPOINT}
### EKS_CLUSTER_ID
ID of the EKS cluster being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_NODE_GROUP[index].EKS_CLUSTER_ID}
    - Previous Request
        - import ${\<reference name \>.EKS_NODE_GROUP[index].EKS_CLUSTER_ID}
### EKS_NODE_GROUP_ARN
ARN of the EKS node group being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_NODE_GROUP[index].EKS_NODE_GROUP_ARN}
    - Previous Request
        - import ${\<reference name \>.EKS_NODE_GROUP[index].EKS_NODE_GROUP_ARN}

### EKS_NODE_GROUP_ID
ID of the EKS node group being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_NODE_GROUP[index].EKS_NODE_GROUP_ID}
    - Previous Request
        - import ${\<reference name \>.EKS_NODE_GROUP[index].EKS_NODE_GROUP_ID}

### EKS_NODE_GROUP_STATUS
Status of the EKS node group being created.
- **Type** : String
- **Usage** :
    - Same Request
        - ${EKS_NODE_GROUP[index].EKS_NODE_GROUP_STATUS}
    - Previous Request
        - import ${\<reference name \>.EKS_NODE_GROUP[index].EKS_NODE_GROUP_STATUS}

