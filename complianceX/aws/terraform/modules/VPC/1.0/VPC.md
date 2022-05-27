---
layout: comx
title: VPC
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/vpc/index.html
---
# VPC
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# VPC
> Amazon Virtual Private Cloud (Amazon VPC) enables you to launch AWS resources into a virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
    "NAME": "str",
    "VPC_CIDR": "str",
    "AZS_COUNT": "int",
    "PUBLIC_SUBNETS": "list",
    "PRIVATE_SUBNETS": "list",
    "PRIVATE_SUBNETS_WITHOUT_NG": "list",
    "TAGS": "str",
    "ENABLE_DNS_SUPPORT": "bool",
    "ENABLE_DNS_HOSTNAMES": "bool",
    "INSTANCE_TENANCY": "str",
    "MAP_PUBLIC_IP_ON_LAUNCH": "bool"
    "TAGS": "JSON"
}
```
## Properties
---
### Name
The name of the vpc which is going to be provisioned
 - **Required** : Yes
 - **Type** : String

### VPC_CIDR
The primary IPv4 CIDR block for the VPC.
- **Required** : Yes
- **Type** : String

### AZS_COUNT
Number of availability zones in which you want to span your subnets
- **Required** : No
- **Type** : Integer
- **Default** : 3

### PUBLIC_SUBNETS
List of IPv4 CIDR block for each subnet that's associated with a route table that has a route to an internet gateway.
- **Required** : No
- **Type**: List of Strings
- **Default** : []

### PRIVATE_SUBNETS
List of IPv4 CIDR block for each subnet that's associated with a route table that has no route to an internet gateway and a nat gateway associated.
- **Required** : No
- **Type**: List of Strings
- **Default** : []

### PRIVATE_SUBNETS_WITHOUT_NG
List of IPv4 CIDR block for each subnet that's associated with a route table that has no route to an internet gateway and without a nat gateway association.
- **Required** : Conditional (Required if No Public Subnets are created otherwise optional)
- **Type**: List of Strings
- **Default** : []

### ENABLE_DNS_SUPPORT
A boolean flag to enable/disable DNS support in the VPC
- **Required** : No
- **Type** : Boolean
- **Default** :  True

### ENABLE_DNS_HOSTNAMES
A boolean flag to enable/disable DNS hostnames in the VPC
- **Required** : No
- **Type** : Boolean
- **Default** :  True

### INSTANCE_TENANCY
The allowed tenancy of instances launched into the VPC.
- **Required**: No
- **Type** : String
- **Default**: Default
- **Allowed Values** : 
    - "default": An instance launched into the VPC runs on shared hardware by default, unless you explicitly specify a different tenancy during instance launch.

    - "dedicated": An instance launched into the VPC is a Dedicated Instance by default, unless you explicitly specify a tenancy of host during instance launch. You cannot specify a tenancy of default during instance launch.

### MAP_PUBLIC_IP_ON_LAUNCH
A boolean flag to enable/disable assigning of public ip address to an instance on launch
- **Required** : No
- **Type** : Boolean
- **Default** :  True

### TAGS
The tags for the VPC.
- **Required**: No
- **Type**: JSON

---

##  Resource Referencing Variables
Resource referencing variables avaialbe for VPC which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### VPC_ID
VPC ID of the created VPC.
- **Type** : String
- **Usage** :
    - Same Request
        - ${VPC[index].VPC_ID}
    - Previous Request
        - import ${\<reference name \>.VPC[index].VPC_ID}

### VPC_CIDR
Primary VPC CIDR of the created VPC.
- **Type** : String
- **Usage** :
    - Same Request
        - ${VPC[index].VPC_CIDR}
    - Previous Request
        - import ${\<reference name \>.VPC[index].VPC_CIDR}

### PUBLIC_SUBNET_IDS
IDs of the public subnets created.
- **Type** : LIST
- **Usage** :
    - Same Request
        - Referring all public subnets ids
            - ${VPC[index].PUBLIC_SUBNET_IDS}
        - Referring one public subnet id
            - ${VPC[index].PUBLIC_SUBNET_IDS[index]}
        
    - Previous Request
        - Referring all public subnets ids
            - import  ${\<reference name \>.VPC[index].PUBLIC_SUBNET_IDS}
        - Referring one public subnet id
            - import ${\<reference name \>.VPC[index].PUBLIC_SUBNET_IDS[index]}

### PUBLIC_SUBNETS
All  the public subnets created.
- **Type** : LIST of Public Subnets
- **Usage** :
    - Same Request
        - Referring all public subnets
            - ${VPC[index].PUBLIC_SUBNETS}
        - Referring one public subnet id
            - ${VPC[index].PUBLIC_SUBNETS[index]}
        
    - Previous Request
        - Referring all public subnets
            - import  ${\<reference name \>.VPC[index].PUBLIC_SUBNETS}
        - Referring one public subnet id
            - import ${\<reference name \>.VPC[index].PUBLIC_SUBNETS[index]}

### PUBLIC_SUBNET_CIDRS
List of CIDRS of all the public subnets created.
- **Type** : LIST
- **Usage** :
    - Same Request
        - Referring all public subnets cidrs
            - ${VPC[index].PUBLIC_SUBNET_CIDRS}
        - Referring one public subnet cidr
            - ${VPC[index].PUBLIC_SUBNET_CIDRS[index]}
        
    - Previous Request
        - Referring all public subnets cidrs
            - import  ${\<reference name \>.VPC[index].PUBLIC_SUBNET_CIDRS}
        - Referring one public subnet cidr
            - import ${\<reference name \>.VPC[index].PUBLIC_SUBNET_CIDRS[index]}

### PRIVATE_SUBNET_IDS
IDs of the private subnets created.
- **Type** : LIST
- **Usage** :
    - Same Request
        - Referring all private subnets ids
            - ${VPC[index].PRIVATE_SUBNET_IDS}
        - Referring one private subnet id
            - ${VPC[index].PRIVATE_SUBNET_IDS[index]}
        
    - Previous Request
        - Referring all private subnets ids
            - import  ${\<reference name \>.VPC[index].PRIVATE_SUBNET_IDS}
        - Referring one public subnet id
            - import ${\<reference name \>.VPC[index].PRIVATE_SUBNET_IDS[index]}

### PRIVATE_SUBNETS
All the private subnets created.
- **Type** : LIST of private Subnets
- **Usage** :
    - Same Request
        - Referring all private subnets
            - ${VPC[index].PRIVATE_SUBNETS}
        - Referring one public subnet id
            - ${VPC[index].PRIVATE_SUBNETS[index]}
        
    - Previous Request
        - Referring all private subnets
            - import  ${\<reference name \>.VPC[index].PRIVATE_SUBNETS}
        - Referring one private subnet
            - import ${\<reference name \>.VPC[index].PRIVATE_SUBNETS[index]}

### PRIVATE_SUBNETS_CIDR
List of CIDRS of all the private subnets created.
- **Type** : LIST
- **Usage** :
    - Same Request
        - Referring all private subnet cidrs
            - ${VPC[index].PRIVATE_SUBNETS_CIDR}
        - Referring one private subnet cidr
            - ${VPC[index].PRIVATE_SUBNETS_CIDR[index]}
        
    - Previous Request
        - Referring all private subnet cidrs
            - import  ${\<reference name \>.VPC[index].PRIVATE_SUBNETS_CIDR}
        - Referring one private subnet cidr
            - import ${\<reference name \>.VPC[index].PRIVATE_SUBNETS_CIDR[index]}

### PRIVATE_SUBNET_WITHOUT_NG_IDS
IDs of the private subnets created without nat gateway.
- **Type** : LIST
- **Usage** :
    - Same Request
        - Referring all private subnets without nat gateway ids
            - ${VPC[index].PRIVATE_SUBNET_WITHOUT_NG_IDS}
        - Referring one private subnet without nat gateway id
            - ${VPC[index].PRIVATE_SUBNET_WITHOUT_NG_IDS[index]}
        
    - Previous Request
        - Referring all private subnets without nat gateway ids
            - import  ${\<reference name \>.VPC[index].PRIVATE_SUBNET_WITHOUT_NG_IDS}
        - Referring one public subnet without nat gateway id
            - import ${\<reference name \>.VPC[index].PRIVATE_SUBNET_WITHOUT_NG_IDS[index]}

### PRIVATE_SUBNETS_WITHOUT_NG
All the private subnets without natgateway created.
- **Type** : LIST of Private Subnets Without NG
- **Usage** :
    - Same Request
        - Referring all private subnets without nat gateway
            - ${VPC[index].PRIVATE_SUBNETS_WITHOUT_NG}
        - Referring one public subnet without nat gateway
            - ${VPC[index].PRIVATE_SUBNETS_WITHOUT_NG[index]}
        
    - Previous Request
        - Referring all private subnets
            - import  ${\<reference name \>.VPC[index].PRIVATE_SUBNETS_WITHOUT_NG}
        - Referring one private subnet id
            - import ${\<reference name \>.VPC[index].PRIVATE_SUBNETS_WITHOUT_NG[index]}

### PRIVATE_SUBNETS_WITHOUT_NG_CIDR
List of CIDRS of all the private subnets created without nat gateway.
- **Type** : LIST
- **Usage** :
    - Same Request
        - Referring all private subnet without nat gateway cidrs
            - ${VPC[index].PRIVATE_SUBNETS_WITHOUT_NG_CIDR}
        - Referring one private subnet without nat gateway cidr
            - ${VPC[index].PRIVATE_SUBNETS_WITHOUT_NG_CIDR[index]}
        
    - Previous Request
        - Referring all private subnet without nat gateway cidrs
            - import  ${\<reference name \>.VPC[index].PRIVATE_SUBNETS_WITHOUT_NG_CIDR}
        - Referring one private subnet without nat gateway cidr
            - import ${\<reference name \>.VPC[index].PRIVATE_SUBNETS_WITHOUT_NG_CIDR[index]}



