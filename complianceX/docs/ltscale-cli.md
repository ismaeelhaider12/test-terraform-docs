---
layout: comx
title: Litmus Scale Cli Tool
permalink: /ltscale-cli/index.html
has_children: true
---
# Litmus Scale CLI Tool
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}
---

# Litmus Scale CLI Tool
This tool is for provisioning compliant resources in AWS Cloud. Resources can be provisioned using the provision command. Some resources are interdependent to each other for example EC2 instance needs a subnet id where this instance will be provisioned so the EC2 resource is dependent on VPC. in this scenario we can use cross resource referencing to provide values from one resource to another.


# Installation
For installation of the Provisioning tool first, install **python 3.8 or greater**.
Clone repo to your machine and go to the **ComplianceCli** directory and install the tool using the flowing command.

```
pip install  .        
```
# Help
Help of each command and generic help can be viewed using the  --help or -h flag.
e.g
```
ltscale -h
```
# Login
Login to litmus scale cli tool using the following command
```
ltscale login 
```
After this you will be redirected to the login screen of litmus scale . Enter Username and password. After that enter MFA code and you will be logged into the ltscale cli tool.
After login into the ltscale cli tool, you will be asked to select the cloud account. And after that you will be asked to enter the region in which you want to provision the resources.


After all this, we are all set to provision resources in the account you just configured in the login process

# Provisioning Resources
Whenever a resource is being provisioned a reference name is provided for that request. The reference name is a unique name Per Account Per region. The reference name is assigned to the resource request so that after provisioning the request if we need to change something in that resource we can change it and can apply it through the reference name of that resource to make sure that changes are applied to the same resource. Reference name should be unique for every region in account hence we can’t use one reference name twice in a single region.

There are three ways in which we can provision resources:
- By passing the path to the file containing the json data required for provisioning. 
``` 
ltscale provision –data file://{PATH TO FILE} 
```
- By using the command line prompt.
```
ltscale provision 
```
- By passing the inline json data required for provisioning.
```
ltscale provision –data ‘{JSON DATA}’
```

 
To get the json data required for provisioning of a resource run the following command.
```
ltscale provision -v
```
This will prompt a list of Resources. Select the resources you want to create, the tool will return the JSON data required to provision that Resource.

# Resource Referencing
If resources are dependent on each other then we can use cross resource referencing to feed values of one resource into another. Here is the main use of REFERENCE name of request because through this REFERENCE name we can refer values in between different requests.

Resource referencing will be of two type
- Referring to a resource from the current request.
- Referring a previously provisioned resource
```
REFERENCE_NAME =  Request reference name added by the user during provisioning of resource
RESOURCE_NAME = Cloud resource name which can be created through complianceX . Available resources are enlisted below
RESOURCE_INDEX = Index at which the resource request was initiated
RESOURCE_VARIABLE = Variable which can be referenced for associating a particular information about the resource. Available Variables for each resource are enlisted below.
RESOURCE_VARIABLE_INDEX = If the RESOURCE_VARIABLE data type is list index can be used to refer to a single value from list. 
```

## Same Request Referencing
The format for referencing a resources from same request:
```
${RESOURCE_NAME[RESOURCE_INDEX].RESOURCE_VARIABLE}
E.g 
${VPC[0].VPC_ID}
${VPC[0].PUBLIC_SUBNET_IDS}

${RESOURCE_NAME[RESOURCE_INDEX].RESOURCE_VARIABLE[RESOURCE_VARIABLE_INDEX]]}
E.g
${VPC[0].PUBLIC_SUBNET_IDS[0]}
${VPC[0].PRIVATE_SUBNETS_WITHOUT_NG_IDS[0]}
```
Sample Request
```
{
   "VPC": [
       {
           "NAME": "dev",
           "VPC_CIDR": "10.0.0.0/16",
           "AZS_COUNT": 3,
           "PUBLIC_SUBNETS": [],
           "PRIVATE_SUBNETS": [],
           "PRIVATE_SUBNETS_WITHOUT_NG": [
               "10.0.1.0/24"
           ],
           "TAGS": {},
           "ENABLE_DNS_SUPPORT": false,
           "ENABLE_DNS_HOSTNAMES": false,
           "INSTANCE_TENANCY": "default",
           "MAP_PUBLIC_IP_ON_LAUNCH": true,
       }
   ],
   "SecurityGroup": [
       {
           "SG_NAME": "dev",
           "SG_DESCRIPTION": "dev",
           "VPC_ID": "${VPC[0].VPC_ID}",
           "SG_INGRESS": [
               {
                   "sg_ingress_from_port": 22,
                   "sg_ingress_to_port": 22,
                   "sg_ingress_protocol": "tcp",
                   "sg_ingress_description": "dev",
                   "sg_ingress_cidr_blocks": [
                       "192.168.10.10/32"
                   ],
                   "sg_ingress_security_groups": [],
                   "sg_ingress_self": false
               }
           ],
           "TAGS": {},
       }
   ],
   "REFERENCE_NAME": "sameRequestReference",
   "REGION": "us-east-1"
}
```
## Previous Request Referencing
The format for referencing a previous resources is:
```
import ${REFERENCE_NAME.RESOURCE_NAME[RESOURCE_INDEX].RESOURCE_VARIABLE}
e.g
import ${referenceABC.VPC[0].VPC_ID}
import ${referenceABC.VPC[0].PUBLIC_SUBNET_IDS}

import ${REFERENCE_NAME.RESOURCE_NAME[RESOURCE_INDEX].RESOURCE_VARIABLE[RESOURCE_VARIABLE_INDEX]]}
e.g 
import ${referenceABC.VPC[0].PUBLIC_SUBNET_IDS[0]}
import ${referenceABC.VPC[0].PRIVATE_SUBNETS_WITHOUT_NG_IDS[0]}
```

Sample Request

```
Previous request:
{
   "VPC": [
       {
           "NAME": "dev",
           "VPC_CIDR": "10.0.0.0/16",
           "AZS_COUNT": 3,
           "PUBLIC_SUBNETS": [],
           "PRIVATE_SUBNETS": [],
           "PRIVATE_SUBNETS_WITHOUT_NG": [
               "10.0.1.0/24"
           ],
           "TAGS": {},
           "ENABLE_DNS_SUPPORT": false,
           "ENABLE_DNS_HOSTNAMES": false,
           "INSTANCE_TENANCY": "default",
           "MAP_PUBLIC_IP_ON_LAUNCH": true
       }
   ],
  
   "REFERENCE_NAME": "referenceABC",
   "REGION": "us-east-1"
}
Current request:
{
   "SecurityGroup": [
       {
           "SG_NAME": "dev",
           "SG_DESCRIPTION": "dev",
           "VPC_ID": "import ${reference.VPC[0].VPC_ID}",
           "SG_INGRESS": [
               {
                   "sg_ingress_from_port": 22,
                   "sg_ingress_to_port": 22,
                   "sg_ingress_protocol": "tcp",
                   "sg_ingress_description": "dev",
                   "sg_ingress_cidr_blocks": [
                       "192.168.10.10/32"
                   ],
                   "sg_ingress_security_groups": [],
                   "sg_ingress_self": false
               }
           ],
           "TAGS": {}
       }
   ],
   "REFERENCE_NAME": "currentRequest",
   "REGION": "us-east-1"
}
```