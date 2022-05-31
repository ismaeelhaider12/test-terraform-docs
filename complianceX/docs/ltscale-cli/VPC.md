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
```
{
    "CREATE_VPC_FLOW_LOGS": "bool"
    "ENABLE_DNS_HOSTNAMES": "bool"
    "ENABLE_DNS_SUPPORT": "bool"
    "MAP_PUBLIC_IP_ON_LAUNCH": "bool"
    "PRIVATE_SUBNETS": "list(string)"
    "PRIVATE_SUBNETS_WITHOUT_NG": "list(string)"
    "PUBLIC_SUBNETS": "list(string)"
    "TAGS": "map"
    "AZS_COUNT": "number"
    "FLOW_LOGS_DESTINATION": "string"
    "INSTANCE_TENANCY": "string"
    "NAME": "string"
    "REGION": "string"
    "VPC_CIDR": "string"
} 
```
## Properties
---


### CREATE\_VPC\_FLOW\_LOGS

- **Type** : bool
- **Default** : 
- **Required**: Yes


### ENABLE\_DNS\_HOSTNAMES

- **Type** : bool
- **Default** : true
-   **Required**: No

  A boolean flag to enable/disable DNS hostnames in the VPC



### ENABLE\_DNS\_SUPPORT

- **Type** : bool
- **Default** : true
-   **Required**: No
  
  A boolean flag to enable/disable DNS support in the VPC



### MAP\_PUBLIC\_IP\_ON\_LAUNCH

- **Type** : bool
- **Default** : true
-   **Required**: No

  A boolean flag to enable/disable assigning of public ip address to an instance on launch.



### PRIVATE\_SUBNETS

- **Type** : list(string)
- **Default** : null
-   **Required**: No
  
  List of IPv4 CIDR block for each subnet that's associated with a route table that has no route to an internet gateway and a nat gateway associated.



### PRIVATE\_SUBNETS\_WITHOUT\_NG

- **Type** : list(string)
- **Default** : null
-   **Required**: Conditional (Required if No Public Subnets are created otherwise optional)
  
  List of IPv4 CIDR block for each subnet that's associated with a route table that has no route to an internet gateway and without a nat gateway association.



### PUBLIC\_SUBNETS

- **Type** : list(string)
- **Default** : null
-   **Required**: No
  
  List of IPv4 CIDR block for each subnet that's associated with a route table that has no route to an internet gateway and a nat gateway associated.



### TAGS

- **Type** : map
- **Default** : {
  "TagKey": "TagValue"
}
-   **Required**: No



### AZS\_COUNT

- **Type** : number
- **Default** : 3
-   **Required**: No
  
  Number of availability zones in which you want to span your subnets.



### FLOW\_LOGS\_DESTINATION

- **Type** : string
- **Default** : "arn:aws:s3:::central-managed-flowlogs"
- **Required**: No


### INSTANCE\_TENANCY

- **Type** : string
- **Default** : "default"
-   **Required**: No

  The allowed tenancy of instances launched into the VPC.
  - **Allowed Values** : 
    - "default": An instance launched into the VPC runs on shared hardware by default, unless you explicitly specify a different tenancy during instance launch.

    - "dedicated": An instance launched into the VPC is a Dedicated Instance by default, unless you explicitly specify a tenancy of host during instance launch. You cannot specify a tenancy of default during instance launch.



### NAME

- **Type** : string
- **Default** : 
-   **Required**: Yes
  
  The name of the vpc which is going to be provisioned



### REGION

- **Type** : string
- **Default** : ""
- 


### VPC\_CIDR

- **Type** : string
- **Default** : 
-   **Required**: Yes
  
  The primary IPv4 CIDR block for the VPC.


---

## Custome Resource Referencing Variables
Resource referencing variables avaialbe for RDS which can be used for cross resource referencing
> Note : Replace index and reference with your desired value

---


### PRIVATE\_SUBNETS
  All the private subnets created.
  - **Type** : LIST of private Subnets
  - **Usage** :
      - Same Request
          - Referring all private subnets
              - \$\{VPC[index].PRIVATE_SUBNETS}
          - Referring one public subnet id
              - \$\{VPC[index].PRIVATE_SUBNETS[index]}
          
      - Previous Request
          - Referring all private subnets
              - import  \$\{<reference name \>.VPC[index].PRIVATE_SUBNETS}
          - Referring one private subnet
              - import \$\{<reference name \>.VPC[index].PRIVATE_SUBNETS[index]}



### PRIVATE\_SUBNETS\_IDS
ismaeel


### PUBLIC\_SUBNETS
  All  the public subnets created.
  - **Type** : LIST of Public Subnets
  - **Usage** :
      - Same Request
          - Referring all public subnets
              - \$\{VPC[index].PUBLIC_SUBNETS}
          - Referring one public subnet id
              - \$\{VPC[index].PUBLIC_SUBNETS[index]}
          
      - Previous Request
          - Referring all public subnets
              - import  \$\{<reference name \>.VPC[index].PUBLIC_SUBNETS}
          - Referring one public subnet id
              - import \$\{<reference name \>.VPC[index].PUBLIC_SUBNETS[index]} 



### PUBLIC\_SUBNETS\_CIDR
  List of CIDRS of all the public subnets created.
  - **Type** : LIST
  - **Usage** :
      - Same Request
          - Referring all public subnets cidrs
              - \$\{VPC[index].PUBLIC_SUBNET_CIDRS}
          - Referring one public subnet cidr
              - \$\{VPC[index].PUBLIC_SUBNET_CIDRS[index]}
          
      - Previous Request
          - Referring all public subnets cidrs
              - import  \$\{<reference name \>.VPC[index].PUBLIC_SUBNET_CIDRS}
          - Referring one public subnet cidr
              - import \$\{<reference name \>.VPC[index].PUBLIC_SUBNET_CIDRS[index]}



### PUBLIC\_SUBNET\_IDS
  IDs of the public subnets created.
  - **Type** : LIST
  - **Usage** :
      - Same Request
          - Referring all public subnets ids
              - \$\{VPC[index].PUBLIC_SUBNET_IDS}
          - Referring one public subnet id
              - \$\{VPC[index].PUBLIC_SUBNET_IDS[index]}
          
      - Previous Request
          - Referring all public subnets ids
              - import  \$\{<reference name \>.VPC[index].PUBLIC_SUBNET_IDS}
          - Referring one public subnet id
              - import \$\{<reference name \>.VPC[index].PUBLIC_SUBNET_IDS[index]}



### VPC\_CIDR
  Primary VPC CIDR of the created VPC.
  - **Type** : String
  - **Usage** :
      - Same Request
          - \$\{VPC[index].VPC_CIDR}
      - Previous Request
          - import \$\{<reference name \>.VPC[index].VPC_CIDR} 



### VPC\_ID
  VPC ID of the created VPC. 
  - **Type** : String
  - **Usage** :
      - Same Request
          - \$\{VPC[index].VPC_ID}
      - Previous Request
          - import \$\{<reference name \>.VPC[index].VPC_CIDR}  



<!-- END_TF_DOCS -->