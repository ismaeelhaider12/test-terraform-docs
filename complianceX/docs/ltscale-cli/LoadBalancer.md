---
layout: comx
title: Load Balancer
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/load-balancers/index.html
---
# Load Balancer
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---


# Load Balancer
> Elastic Load Balancing (ELB) automatically distributes incoming application traffic across multiple targets and virtual appliances in one or more Availability Zones (AZs). 

To create this entity in your **Litmus Scale** template, use the following data:
```
{
    "CREATE_ALB": "bool",
    "ALB_INTERNAL": "bool",
    "ALB_SUBNET_IDS": "list",
    "ALB_SECURITY_GROUP_IDS": "list",
    "ALB_ACCESS_LOGS": {
    "bucket": "str",
    "prefix": "str"
    },
    "ALB_NAME": "str",
    "ALB_TARGET_GROUPS": [
    {
        "backend_protocol": "str",
        "name": "str",
        "backend_port": "int",
        "target_type": "str",
        "health_check": {
        "enabled": "str",
        "interval": "str",
        "path": "str",
        "healthy_threshold": "str",
        "unhealthy_threshold": "str"
        }
    }
    ],
    "ALB_VPC_ID": "str",
    "ALB_HTTP_TCP_LISTENERS": [
    {
        "port": "int",
        "protocol": "str",
        "target_group_index": "int"
    }
    ],
    "ALB_HTTPS_LISTENERS": [
    {
        "port": "int",
        "protocol": "str",
        "certificate_arn": "str",
        "target_group_index": "int"
    }
    ],
    "ALB_ENABLE_CROSS_ZONE_LOAD_BALANCING": "bool",
    "ALB_ENABLE_DELETION_PROTECTION": "bool",
    "ALB_ENABLE_HTTP2": "bool",
    "ALB_IP_ADDRESS_TYPE": "str",
    "CREATE_ELB": "bool",
    "ELB_ACCESS_LOGS": {
    "bucket": "str",
    "bucket_prefix": "str"
    },
    "ELB_INTERNAL": "bool",
    "ELB_NAME": "str",
    "ELB_SUBNET_IDS": "list",
    "ELB_SECURITY_GROUPS": "list",
    "ELB_LISTENER": [
    {
        "instance_port": "int",
        "instance_protocol": "str",
        "lb_port": "int",
        "lb_protocol": "str",
        "ssl_certificate_id": "str"
    }
    ],
    "ELB_HEALTH_CHECK": {
    "target": "str",
    "interval": "int",
    "healthy_threshold": "int",
    "unhealthy_threshold": "int",
    "timeout": "int"
    },
    "ELB_CROSS_ZONE_LOAD_BALANCING": "bool",
    "ELB_CONNECTION_DRAINING": "bool",
    "ELB_CONNECTION_DRAINING_TIMEOUT": "int",
    "CREATE_NLB": "bool",
    "NLB_INTERNAL": "bool",
    "NLB_SUBNET_IDS": "list",
    "NLB_NAME": "str",
    "NLB_VPC_ID": "str",
    "NLB_ACCESS_LOGS": {
    "bucket": "str",
    "prefix": "str"
    },
    "NLB_TARGET_GROUPS": [
    {
        "backend_protocol": "str",
        "name": "str",
        "backend_port": "int",
        "health_check": {
        "enabled": "str",
        "interval": "str",
        "path": "str",
        "healthy_threshold": "str",
        "unhealthy_threshold": "str"
        }
    }
    ],
    "NLB_HTTP_TCP_LISTENERS": [
    {
        "port": "int",
        "protocol": "str",
        "target_group_index": "int"
    }
    ],
    "NLB_HTTPS_LISTENERS": [
    {
        "port": "int",
        "protocol": "str",
        "certificate_arn": "str",
        "target_group_index": "int"
    }
    ],
    "NLB_ENABLE_CROSS_ZONE_LOAD_BALANCING": "bool",
    "NLB_ENABLE_DELETION_PROTECTION": "bool",
    "NLB_ENABLE_HTTP2": "bool",
    "NLB_IP_ADDRESS_TYPE": "str",
    "TAGS": "JSON",
    
}

```
## Properties

---

### CREATE_ALB
A boolean flag to create or don't create an application load balancer.
 - **Required** : No
 - **Type** : Boolean
 - **Default** : False

### ALB_INTERNAL
If true, the LB will be internal.
- **Required** : No
- **Type** : Boolean
- **Default** : False

### ALB_SUBNET_IDS
A list of subnet IDs to attach to the LB
- **Required** : Yes
- **Type** : List of Strings

### ALB_SECURITY_GROUP_IDS
A list of security group IDs to assign to the LB
- **Required** : Yes
- **Type** : List of Strings

### ALB_ACCESS_LOGS
An Access Logs block.
- **Required** : No
- **Type** : Object of Access Log 
- **Access Log Body**:
    - **bucket**:
        - *TThe S3 bucket name to store the logs in.*
            - **Required** : Yes
            - **Type** : String
    - **prefix**:
        - *The S3 bucket prefix.*
            - **Required** : Yes
            - **Type** : String
    
### ALB_NAME
The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen.
- **Required** : Yes
- **Type**: String

### ALB_TARGET_GROUPS
Provides a Target Group resource for use with Load Balancer resources.
- **Required** : Yes
- **Type** : List of Target Group
- **Target Group Body**:
    - **backend_protocol**:
        - *Protocol to use for routing traffic to the targets.*
            - **Required** : Yes
            - **Type** : String
    - **name**:
        - *Name of the target group*
            - **Required** : Yes
            - **Type** : String
    - **backend_port**:
        - *Port on which targets receive traffic, unless overridden when registering a specific target*
            - **Required** : Yes
            - **Type** : Integer
    - **target_type**:
        - *Type of target that you must specify when registering targets with this target group*
            - **Required** : Yes
            - **Type** : String
    - **health_check**:
        - *Health Check configuration block*
            - **Required** : No
            - **Type** : Object of Health Check
            - **Health Check Body**:
                - **enabled**:
                    - *Whether health checks are enabled*
                        - **Required** : Yes
                        - **Type** : Boolean
                - **interval**:
                    - *Approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds.*
                        - **Required** : Yes
                        - **Type** : String
                - **path**:
                    - *Destination for the health check request*
                        - **Required** : Yes
                        - **Type** : String
                - **healthy_threshold**:
                    - *Number of consecutive health checks successes required before considering an unhealthy target healthy.*
                        - **Required** : Yes
                        - **Type** : String
                - **unhealthy_threshold**:
                    - *Number of consecutive health check failures required before considering the target unhealthy.*
                        - **Required** : Yes
                        - **Type** : String
### ALB_VPC_ID
The VPC ID in which you want to launch the load balancer
- **Required** : Yes
- **Type** : String

### ALB_HTTP_TCP_LISTENERS
Provides a Load Balancer Listener resource.
- **Required** : No
- **Type** : List of HTTP Listeners
- **HTTP Listener Body**:
    - **port**:
        - *Port on which the load balancer is listening*
            - **Required** : Yes
            - **Type** : Integer
    - **protocol**:
        - *Protocol for connections from clients to the load balancer.*
            - **Required** : Yes
            - **Type** : String
    - **target_group_index**:
        - *Index of the target group you want to attach*
            - **Required** : Yes
            - **Type** : Integer

### ALB_HTTPS_LISTENERS
Provides a Load Balancer Listener resource.
- **Required** : No
- **Type** : List of HTTPS Listeners
- **HTTPS Listener Body**:
    - **port**:
        - *Port on which the load balancer is listening*
            - **Required** : Yes
            - **Type** : Integer
    - **protocol**:
        - *Protocol for connections from clients to the load balancer.*
            - **Required** : Yes
            - **Type** : String
    - **certificate_arn**:
        - *ARN of the default SSL server certificate. Exactly one certificate is required.*
            - **Required** : Yes
            - **Type** : String
    - **target_group_index**:
        - *Index of the target group you want to attach*
            - **Required** : Yes
            - **Type** : Integer
### ALB_ENABLE_CROSS_ZONE_LOAD_BALANCING
If true, cross-zone load balancing of the load balancer will be enabled
- **Required** : No
- **Type** : Boolean
- **Default** : False
### ALB_ENABLE_DELETION_PROTECTION
If true, deletion of the load balancer will be disabled via the AWS API.
- **Required** : No
- **Type** : Boolean
- **Default** : False
### ALB_ENABLE_HTTP2
Indicates whether HTTP/2 is enabled in application load balancers.
- **Required** : No
- **Type** : Boolean
- **Default** : False

### ALB_IP_ADDRESS_TYPE
The type of IP addresses used by the subnets for your load balancer.
- **Required** : No
- **Type** : String
- **Default** : "ipv4"



### CREATE_NLB
A boolean flag to create or don't create a network load balancer.
 - **Required** : No
 - **Type** : Boolean
 - **Default** : False

### NLB_INTERNAL
If true, the LB will be internal.
- **Required** : No
- **Type** : Boolean
- **Default** : False

### NLB_SUBNET_IDS
A list of subnet IDs to attach to the LB
- **Required** : Yes
- **Type** : List of Strings

### NLB_ACCESS_LOGS
An Access Logs block.
- **Required** : No
- **Type** : Object of Access Log 
- **Access Log Body**:
    - **bucket**:
        - *TThe S3 bucket name to store the logs in.*
            - **Required** : Yes
            - **Type** : String
    - **prefix**:
        - *The S3 bucket prefix.*
            - **Required** : Yes
            - **Type** : String
    
### NLB_NAME
The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen.
- **Required** : Yes
- **Type**: String

### NLB_TARGET_GROUPS
Provides a Target Group resource for use with Load Balancer resources.
- **Required** : Yes
- **Type** : List of Target Group
- **Target Group Body**:
    - **backend_protocol**:
        - *Protocol to use for routing traffic to the targets.*
            - **Required** : Yes
            - **Type** : String
    - **name**:
        - *Name of the target group*
            - **Required** : Yes
            - **Type** : String
    - **backend_port**:
        - *Port on which targets receive traffic, unless overridden when registering a specific target*
            - **Required** : Yes
            - **Type** : Integer
    - **target_type**:
        - *Type of target that you must specify when registering targets with this target group*
            - **Required** : Yes
            - **Type** : String
    - **health_check**:
        - *Health Check configuration block*
            - **Required** : No
            - **Type** : Object of Health Check
            - **Health Check Body**:
                - **enabled**:
                    - *Whether health checks are enabled*
                        - **Required** : Yes
                        - **Type** : Boolean
                - **interval**:
                    - *Approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds.*
                        - **Required** : Yes
                        - **Type** : String
                - **path**:
                    - *Destination for the health check request*
                        - **Required** : Yes
                        - **Type** : String
                - **healthy_threshold**:
                    - *Number of consecutive health checks successes required before considering an unhealthy target healthy.*
                        - **Required** : Yes
                        - **Type** : String
                - **unhealthy_threshold**:
                    - *Number of consecutive health check failures required before considering the target unhealthy.*
                        - **Required** : Yes
                        - **Type** : String
### NLB_VPC_ID
The VPC ID in which you want to launch the load balancer
- **Required** : Yes
- **Type** : String

### NLB_HTTP_TCP_LISTENERS
Provides a Load Balancer Listener resource.
- **Required** : No
- **Type** : List of HTTP Listeners
- **HTTP Listener Body**:
    - **port**:
        - *Port on which the load balancer is listening*
            - **Required** : Yes
            - **Type** : Integer
    - **protocol**:
        - *Protocol for connections from clients to the load balancer.*
            - **Required** : Yes
            - **Type** : String
    - **target_group_index**:
        - *Index of the target group you want to attach*
            - **Required** : Yes
            - **Type** : Integer

### NLB_HTTPS_LISTENERS
Provides a Load Balancer Listener resource.
- **Required** : No
- **Type** : List of HTTPS Listeners
- **HTTPS Listener Body**:
    - **port**:
        - *Port on which the load balancer is listening*
            - **Required** : Yes
            - **Type** : Integer
    - **protocol**:
        - *Protocol for connections from clients to the load balancer.*
            - **Required** : Yes
            - **Type** : String
    - **certificate_arn**:
        - *ARN of the default SSL server certificate. Exactly one certificate is required.*
            - **Required** : Yes
            - **Type** : String
    - **target_group_index**:
        - *Index of the target group you want to attach*
            - **Required** : Yes
            - **Type** : Integer
### NLB_ENABLE_CROSS_ZONE_LOAD_BALANCING
If true, cross-zone load balancing of the load balancer will be enabled
- **Required** : No
- **Type** : Boolean
- **Default** : False
### NLB_ENABLE_DELETION_PROTECTION
If true, deletion of the load balancer will be disabled via the AWS API.
- **Required** : No
- **Type** : Boolean
- **Default** : False
### NLB_ENABLE_HTTP2
Indicates whether HTTP/2 is enabled in network load balancers.
- **Required** : No
- **Type** : Boolean
- **Default** : False

### NLB_IP_ADDRESS_TYPE
The type of IP addresses used by the subnets for your load balancer.
- **Required** : No
- **Type** : String
- **Default** : "ipv4"


### CREATE_ELB
A boolean flag to create or don't create a classic load balancer.
 - **Required** : No
 - **Type** : Boolean
 - **Default** : False

### ELB_INTERNAL
If true, the LB will be internal.
- **Required** : No
- **Type** : Boolean
- **Default** : False

### ELB_SUBNET_IDS
A list of subnet IDs to attach to the LB
- **Required** : Yes
- **Type** : List of Strings

### ELB_SECURITY_GROUP_IDS
A list of security group IDs to assign to the LB
- **Required** : Yes
- **Type** : List of Strings

### ELB_ACCESS_LOGS
An Access Logs block.
- **Required** : No
- **Type** : Object of Access Log 
- **Access Log Body**:
    - **bucket**:
        - *TThe S3 bucket name to store the logs in.*
            - **Required** : Yes
            - **Type** : String
    - **prefix**:
        - *The S3 bucket prefix.*
            - **Required** : Yes
            - **Type** : String
    
### ELB_NAME
The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen.
- **Required** : Yes
- **Type**: String



### ELB_LISTENER
Provides a Load Balancer Listener resource.
- **Required** : No
- **Type** : List of ELB Listeners
- **ELB Listener Body**:
    - **instance_port**:
        - *The port on the instance to route to.*
            - **Required** : Yes
            - **Type** : Integer
    - **instance_protocol**:
        - *The protocol to use to the instance.*
            - **Required** : Yes
            - **Type** : String
    - **lb_port**:
        - *The port to listen on for the load balancer*
            - **Required** : Yes
            - **Type** : Integer
    - **lb_protocol**:
        - *The protocol to listen on.*
            - **Required** : Yes
            - **Type** : String
    
    - **ssl_certificate_id**:
        - *The ARN of an SSL certificate you have uploaded to AWS IAM.*
            - **Required** : Yes
            - **Type** : String

### ELB_ENABLE_CROSS_ZONE_LOAD_BALANCING
If true, cross-zone load balancing of the load balancer will be enabled
- **Required** : No
- **Type** : Boolean
- **Default** : False
### ELB_CONNECTION_DRAINING
Boolean to enable connection draining.
- **Required** : No
- **Type** : Boolean
- **Default** : False
### ELB_CONNECTION_DRAINING_TIMEOUT
The time in seconds to allow for connections to drain.
- **Required** : No
- **Type** : Integer
- **Default** : 300

### TAGS
The tags for the Load Balancer.
- **Required**: No
- **Type**: JSON

---

##  Resource Referencing Variables
Resource referencing variables avaialbe for Load Balancer which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### APPLICATION_LOAD_BALANCER
The output of Application LoadBalancer created.
- **Type** : APPLICATION LOAD BALANCER object
- **Usage** :
    - Same Request
        - ${LoadBalancer[index].APPLICATION_LOAD_BALANCER}
    - Previous Request
        - import ${\<reference name \>.LoadBalancer[index].APPLICATION_LOAD_BALANCER}

### APPLICATION_LOAD_BALANCER_ARN
The ARN of Application LoadBalancer created.
- **Type** : APPLICATION LOAD BALANCER object
- **Usage** :
    - Same Request
        - ${LoadBalancer[index].APPLICATION_LOAD_BALANCER_ARN}
    - Previous Request
        - import ${\<reference name \>.LoadBalancer[index].APPLICATION_LOAD_BALANCER_ARN}


### ALB_TARGET_GROUPS
List of all the target groups created.
- **Type** : List of Target Groups
- **Usage** :
    - Same Request
        - Referring all target groups
            - ${LoadBalancer[index].ALB_TARGET_GROUPS}
        - Referring one target group
            - ${LoadBalancer[index].ALB_TARGET_GROUPS[index]}
        
    - Previous Request
        - Referring all target groups
            - import  ${\<reference name \>.LoadBalancer[index].ALB_TARGET_GROUPS}
        - Referring one target group
            - import ${\<reference name \>.LoadBalancer[index].ALB_TARGET_GROUPS[index]}

### ALB_TARGET_GROUPS
List of arns of all the target groups created.
- **Type** : List of Strings
- **Usage** :
    - Same Request
        - Referring all target groups arns
            - ${LoadBalancer[index].ALB_TARGET_GROUPS_ARN}
        - Referring one target group arns
            - ${LoadBalancer[index].ALB_TARGET_GROUPS_ARN[index]}
        
    - Previous Request
        - Referring all target groups arns
            - import  ${\<reference name \>.LoadBalancer[index].ALB_TARGET_GROUPS_ARN}
        - Referring one target group arns
            - import ${\<reference name \>.LoadBalancer[index].ALB_TARGET_GROUPS_ARN[index]}

### NETWORK_LOAD_BALANCER
The output of Network LoadBalancer created.
- **Type** : NETWORK LOAD BALANCER object
- **Usage** :
    - Same Request
        - ${LoadBalancer[index].NETWORK_LOAD_BALANCER}
    - Previous Request
        - import ${\<reference name \>.LoadBalancer[index].NETWORK_LOAD_BALANCER}

### NETWORK_LOAD_BALANCER_ARN
The ARN of NETWORK LoadBalancer created.
- **Type** : NETWORK LOAD BALANCER object
- **Usage** :
    - Same Request
        - ${LoadBalancer[index].NETWORK_LOAD_BALANCER_ARN}
    - Previous Request
        - import ${\<reference name \>.LoadBalancer[index].NETWORK_LOAD_BALANCER_ARN}

### NLB_TARGET_GROUPS
List of all the target groups created.
- **Type** : List of Target Groups
- **Usage** :
    - Same Request
        - Referring all target groups
            - ${LoadBalancer[index].NLB_TARGET_GROUPS}
        - Referring one target group
            - ${LoadBalancer[index].NLB_TARGET_GROUPS[index]}
        
    - Previous Request
        - Referring all target groups
            - import  ${\<reference name \>.LoadBalancer[index].NLB_TARGET_GROUPS}
        - Referring one target group
            - import ${\<reference name \>.LoadBalancer[index].NLB_TARGET_GROUPS[index]}

### NLB_TARGET_GROUPS_ARN
List of arns of all the target groups created.
- **Type** : List of Strings
- **Usage** :
    - Same Request
        - Referring all target groups arns
            - ${LoadBalancer[index].NLB_TARGET_GROUPS_ARN}
        - Referring one target group arns
            - ${LoadBalancer[index].NLB_TARGET_GROUPS_ARN[index]}
        
    - Previous Request
        - Referring all target groups arns
            - import  ${\<reference name \>.LoadBalancer[index].NLB_TARGET_GROUPS_ARN}
        - Referring one target group arns
            - import ${\<reference name \>.LoadBalancer[index].NLB_TARGET_GROUPS_ARN[index]}

### ELASTIC_LOAD_BALANCER
The output of ELASTIC LoadBalancer created.
- **Type** : ELASTIC LOAD BALANCER object
- **Usage** :
    - Same Request
        - ${LoadBalancer[index].ELASTIC_LOAD_BALANCER}
    - Previous Request
        - import ${\<reference name \>.LoadBalancer[index].ELASTIC_LOAD_BALANCER}

### ELASTIC_LOAD_BALANCER_ARN
The ARN of ELASTIC LoadBalancer created.
- **Type** : ELASTIC LOAD BALANCER object
- **Usage** :
    - Same Request
        - ${LoadBalancer[index].ELASTIC_LOAD_BALANCER_ARN}
    - Previous Request
        - import ${\<reference name \>.LoadBalancer[index].ELASTIC_LOAD_BALANCER_ARN}


### ELASTIC_LOAD_BALANCER_ID
The ID of ELASTIC LoadBalancer created.
- **Type** : ELASTIC LOAD BALANCER object
- **Usage** :
    - Same Request
        - ${LoadBalancer[index].ELASTIC_LOAD_BALANCER_ID}
    - Previous Request
        - import ${\<reference name \>.LoadBalancer[index].ELASTIC_LOAD_BALANCER_ID}
