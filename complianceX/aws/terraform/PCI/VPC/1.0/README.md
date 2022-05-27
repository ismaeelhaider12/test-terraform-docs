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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_CREATE_VPC_FLOW_LOGS"></a> [CREATE\_VPC\_FLOW\_LOGS](#input\_CREATE\_VPC\_FLOW\_LOGS) | provide true/false for option to anable vpc flow logs | `bool` | n/a | yes |
| <a name="input_AZS_COUNT"></a> [AZS\_COUNT](#input\_AZS\_COUNT) | n/a | `number` | `3` | no |
| <a name="input_ENABLE_DNS_HOSTNAMES"></a> [ENABLE\_DNS\_HOSTNAMES](#input\_ENABLE\_DNS\_HOSTNAMES) | True or false ? for Enabling DNS Host Names in VPC | `bool` | `true` | no |
| <a name="input_ENABLE_DNS_SUPPORT"></a> [ENABLE\_DNS\_SUPPORT](#input\_ENABLE\_DNS\_SUPPORT) | True or false ? for Enabling DNS Suport for VPC | `bool` | `true` | no |
| <a name="input_FLOW_LOGS_DESTINATION"></a> [FLOW\_LOGS\_DESTINATION](#input\_FLOW\_LOGS\_DESTINATION) | n/a | `string` | `"arn:aws:s3:::central-managed-flowlogs"` | no |
| <a name="input_INSTANCE_TENANCY"></a> [INSTANCE\_TENANCY](#input\_INSTANCE\_TENANCY) | default , dedicated or host ? for instance tenancy value | `string` | `"default"` | no |
| <a name="input_MAP_PUBLIC_IP_ON_LAUNCH"></a> [MAP\_PUBLIC\_IP\_ON\_LAUNCH](#input\_MAP\_PUBLIC\_IP\_ON\_LAUNCH) | True or false ? for Enabling DNS Host Names in VPC | `bool` | `true` | no |
| <a name="input_NAME"></a> [NAME](#input\_NAME) | n/a | `string` | `"ismaeel"` | no |
| <a name="input_PRIVATE_SUBNETS"></a> [PRIVATE\_SUBNETS](#input\_PRIVATE\_SUBNETS) | n/a | `list(string)` | `[]` | no |
| <a name="input_PRIVATE_SUBNETS_WITHOUT_NG"></a> [PRIVATE\_SUBNETS\_WITHOUT\_NG](#input\_PRIVATE\_SUBNETS\_WITHOUT\_NG) | n/a | `list(string)` | `[]` | no |
| <a name="input_PUBLIC_SUBNETS"></a> [PUBLIC\_SUBNETS](#input\_PUBLIC\_SUBNETS) | n/a | `list(string)` | `[]` | no |
| <a name="input_REGION"></a> [REGION](#input\_REGION) | n/a | `string` | `""` | no |
| <a name="input_TAGS"></a> [TAGS](#input\_TAGS) | n/a | `map` | <pre>{<br>  "TagKey": "TagValue"<br>}</pre> | no |
| <a name="input_VPC_CIDR"></a> [VPC\_CIDR](#input\_VPC\_CIDR) | n/a | `string` | `""` | no |
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