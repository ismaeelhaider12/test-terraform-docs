---
layout: comx
title: Security Group
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/sg/index.html
---
# Security Group
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Security Group
>A security group acts as a virtual firewall, controlling the traffic that is allowed to reach and leave the resources that it is associated with. For example, after you associate a security group with an EC2 instance, it controls the inbound and outbound traffic for the instance.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
      "SG_NAME": "str",
      "SG_DESCRIPTION": "str",
      "VPC_ID": "str",
      "SG_INGRESS": [
        {
          "sg_ingress_from_port": "int",
          "sg_ingress_to_port": "int",
          "sg_ingress_protocol": "str",
          "sg_ingress_description": "str",
          "sg_ingress_cidr_blocks": "list",
          "sg_ingress_security_groups": "list",
          "sg_ingress_self": "bool"
        }
      ],
      "TAGS": "JSON"
    }
```
## Properties

---

### SG_NAME
The name of the security group which is going to be provisioned
- **Required** : Yes
- **Type** : String

### SG_DESCRIPTION
Description about the security group.
- **Required** : Yes
- **Type** : String

### VPC_ID
A unique ID of the VPC.
- **Required** : Yes
- **Type** : String

### TAGS
Map of tags to assign to the resource. 
- **Required** : No
- **Type** : String

### SG_INGRESS
An inbound rules that permits instances to receive traffic from the specified IPv4 or IPv6 CIDR address range, or from the instances associated with the specified security group.
- **Required** : No
- **Type** : List of Ingress
- **Ingress Body** :
    - **sg_ingress_from_port**: 
      - *The start of port range for the TCP and UDP protocols, or an ICMP/ICMPv6 type number. A value of -1 indicates all ICMP/ICMPv6 types. If you specify all ICMP/ICMPv6 types, you must specify all codes.*
        - **Required**: True
        - **Type**: Integer
    - **sg_ingress_to_port**: 
      - *The end of port range for the TCP and UDP protocols, or an ICMP/ICMPv6 code. A value of -1 indicates all ICMP/ICMPv6 codes for the specified ICMP*
        - **Required**: True
        - **Type**: Integer
    - **sg_ingress_protocol**: 
      - *The IP protocol name (tcp, udp, icmp, icmpv6) or number.*
        - **Required**: True
        - **Type**: Integer
    - **sg_ingress_description**: 
      - *Updates the description of an ingress (inbound) security group rule. You can replace an existing description, or add a description to a rule that did not have one previously.*
        - **Required**: True
        - **Type**: Integer
    - **sg_ingress_cidr_blocks**: 
      - *List of CIDR blocks.*
        - **Required**: True
        - **Type**: LIST
    - **sg_ingress_security_groups**: 
      - *List of security group IDs if using a VPC.*
        - **Required**: True
        - **Type**: LIST
    - **sg_ingress_self**: 
      - *Whether the security group itself will be added as a source to this ingress rule.*
        - **Required**: False
        - **Type**: Boolean
        
---
##  Resource Referencing Variables
Resource referencing variables available for security groups which can be used for cross resource referencing

### SECURITY_GROUP
Security group
- **Type** : String
- **Usage** :
    - Same Request
        - ${SECURITY_GROUP[index].SECURITY_GROUP}
    - Previous Request
        - import ${\<reference name \>.SECURITY_GROUP[index].SECURITY_GROUP}

### SECURITY_GROUP_ID
Security group ID.
- **Type** : String
- **Usage** :
    - Same Request
        - ${SECURITY_GROUP[index].SECURITY_GROUP_ID}
    - Previous Request
        - import ${\<reference name \>.SECURITY_GROUP[index].SECURITY_GROUP_ID}

### SECURITY_GROUP_NAME
Security group Name.
- **Type** : String
- **Usage** :
    - Same Request
        - ${SECURITY_GROUP[index].SECURITY_GROUP_NAME}
    - Previous Request
        - import ${\<reference name \>.SECURITY_GROUP_NAME[index].SECURITY_GROUP_NAME}
