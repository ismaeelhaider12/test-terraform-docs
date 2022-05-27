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


 
<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->

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