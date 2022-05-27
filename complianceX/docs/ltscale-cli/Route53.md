---
layout: comx
title: Route 53
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/route-53/index.html
---
# RDS
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


# Route 53
> Amazon Route 53 is a highly available and scalable cloud Domain Name System (DNS) web service. It is designed to give developers and businesses an extremely reliable and cost effective way to route end users to Internet applications by translating names like www.example.com into the numeric IP addresses like 192.0.2.1 that computers use to connect to each other.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
    "CREATE_ZONE": "bool",
    "CREATE_RECORD": "bool",
    "DESCRIPTION": "str",
    "ZONE_NAME": "str",
    "VPCS": [
    {
        "vpc_id": "str",
        "vpc_region": "str"
    }
    ],
    "RECORDS": [
    {
        "name": "str",
        "type": "str",
        "ttl": "int",
        "records": "list",
        "alias": {
        "name": "str",
        "zone_id": "str"
        }
    }
    ],
    "TAGS": "JSON"
}

```
## Properties

---

### CREATE_ZONE
Boolean for creating a route53 Hosted Zone
 - **Required** : Yes
 - **Type** : Boolean
 - **Default** : True

### CREATE_RECORD
Boolean for creating a record.
- **Required** : No
- **Type** : Boolean
- **Default** : False

### DESCRIPTION
A description for the hosted zone
- **Required** : No
- **Type** : String


### ZONE_NAME
This is the name of the hosted zone.
- **Required** : Yes
- **Type** : String

### VPCS
Authorizes a VPC in a different account to be associated with a local Route53 Hosted Zone.
- **Required** : No
- **Type** : List of VPCS
- **VPCS Body**:
    - **vpc_id**:
        - *The VPC to authorize for association with the private hosted zone*
            - **Required** : Yes
            - **Type** : String
    - **vpc_region**:
        - *The VPC's region*
            - **Required** : No
            - **Type** : List of Strings
            
### Records
Provides a Route53 record resource
- **Required** : No
- **Type** : List of Records
- **Records Body**:
    - **name**:
        - *The name of the record*
            - **Required** : Yes
            - **Type** : String
    - **type**:
        - *The record type.*
            - **Required** : Yes
            - **Type** : String
    - **ttl**:
        - *The TTL of the record.*
            - **Required** : No
            - **Type** : Integer
    - **records**:
        - *A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM.*
            - **Required** : No
            - **Type** : List of Strings
    - **alias**:
        - *An alias block. Conflicts with ttl & records.*
            - **Required** : No
            - **Type** : Object of Alias
            - **Alias Body**:
                - **name**:
                    - *DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone.*
                        - **Required** : No
                        - **Type** : String
                - **zone_id**:
                    - *Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone.*
                        - **Required** : No
                        - **Type** : String
### TAGS
The tags for the Route 53 .
- **Required**: No
- **Type**: JSON
    
---

##  Resource Referencing Variables
Resource referencing variables avaialbe for Route53 which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### ROUTE53_ZONE
Route53 Zone created. 
- **Type** : String
- **Usage** :
    - Same Request
        - ${Route53[index].ROUTE53_ZONE}
    - Previous Request
        - import ${\<reference name \>.Route53[index].ROUTE53_ZONE}

### ROUTE53_RECORDS
Route53 Records created. 
- **Type** : List
- **Usage** :
    - Same Request
        - Referring route 53 records.
            - ${Route53[index].ROUTE53_RECORDS}
        - Referring one route 53 record.
            - ${Route53[index].ROUTE53_RECORDS[index]}
        
    - Previous Request
        - Referring all route 53 records.
            - import  ${\<reference name \>.Route53[index].ROUTE53_RECORDS}
        - Referring one proute 53 record.
            - import ${\<reference name \>.Route53[index].ROUTE53_RECORDS[index]}