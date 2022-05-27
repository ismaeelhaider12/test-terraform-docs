---
layout: comx
title: Auto Scaling
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/auto-scaling/index.html
---
# Auto Scaling
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Auto Scaling
> AWS Auto Scaling monitors your applications and automatically adjusts capacity to maintain steady, predictable performance at the lowest possible cost. Using AWS Auto Scaling, it’s easy to setup application scaling for multiple resources across multiple services in minutes. 

To create this entity in your **Litmus Scale** template, use the following data:
```
{
      "TAGS": "str",
      "IMAGE_ID": "str",
      "TEMPLATE_NAME": "str",
      "INSTANCE_TYPE": "str",
      "ASG_IAM_INSTANCE_PROFILE_NAME": "str",
      "KEY_NAME": "str",
      "ASG_SECURITY_GROUP_IDS": "list",
      "ASSOCIATE_PUBLIC_IP_ADDRESS": "bool",
      "ASG_USER_DATA": "str",
      "ASG_LOAD_BALANCERS": "list",
      "ASG_TARGET_GROUP_ARNS": "list",
      "ASG_EBS_BLOCK_DEVICE": [
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
      "ASG_NAME": "str",
      "ASG_SUBNET_IDS": "list",
      "ASG_MAX_SIZE": "int",
      "ASG_MIN_SIZE": "int",
      "ASG_DESIRED_CAPACITY": "int",
      "ASG_SCALING_POLICIES": [
        {
          "name": "str",
          "metric_type": "str",
          "target_value": "int",
          "estimated_warmup": "int"
        }
      ],
      "ASG_SCHEDULE_SCALING": [
        {
          "scheduled_action_name": "str",
          "min_size": "int",
          "max_size": "int",
          "desired_capacity": "int",
          "recurrence": "str",
          "start_time": "str",
          "end_time": "str"
        }
      ],
      "ASG_ACTIVITY_NOTIFICATIONS": [
        {
          "topic_arn": "str",
          "notifications": "list"
        }
      ],
      "INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR": "str",
      "EBS_OPTIMIZED": "bool",
      "ENABLE_MONITORING": "bool",
      "DISABLE_API_TERMINATION": "bool",
      "HEALTH_CHECK_GRACE_PERIOD": "int",
      "HEALTH_CHECK_TYPE": "str",
      "DEFAULT_COOLDOWN": "int",
      "FORCE_DELETE": "bool",
      "TERMINATION_POLICIES": "list",
      "SUSPENDED_PROCESSES": "list",
      "PLACEMENT_GROUP": "str",
      "ENABLED_METRICS": "list",
      "SERVICE_LINKED_ROLE_ARN": "str",
      "MAX_INSTANCE_LIFETIME": "int",
      "INSTANCE_TAGS": "str"
    }
```
## Properties
---


### IMAGE_ID
The EC2 image ID to launch.
 - **Required** : Yes
 - **Type** : String

### TEMPLATE_NAME
The name of the launch template.
- **Required** : Yes
- **Type** : String

### INSTANCE_TYPE
The size of instance to launch.
- **Required** : Yes
- **Type** : String

### ASG_IAM_INSTANCE_PROFILE_NAME
Name of the instance profile.
- **Required** : Yes
- **Type** : String
- 
### KEY_NAME
The key name that should be used for the instance.
- **Required** : No
- **Type** : String

### ASG_SECURITY_GROUP_IDS
A list of  security group IDS to be associated.
- **Required** : Yes
- **Type**: List of Strings

### ASSOCIATE_PUBLIC_IP_ADDRESS
Whether a Public IP address is associated with the instance.
- **Required** : No
- **Type** : Boolean

### ASG_USER_DATA
The base64-encoded user data to provide when launching the instance.
- **Required** : No
- **Type** : String

### ASG_LOAD_BALANCERS
A list of elastic load balancer names to add to the autoscaling group names. 
- **Required** : No
- **Type** : List of Strings

### ASG_TARGET_GROUP_ARNS
A set of aws_alb_target_group ARNs, for use with Application or Network Load Balancing.
- **Required** : No
- **Type** : List of Strings


### ASG_EBS_BLOCK_DEVICE
Additional EBS block devices to attach to the instance.
- **device_name**:
  - *The name of the device to mount.*
    - **Required**: True
    - **Type**: String
- **ebs**:
  - **delete_on_termination**:
    - *Whether the volume should be destroyed on instance termination.*
      - **Required**: True
      - **Type**: Boolean
  - **volume_type**:
    - *The type of volume.*
      - **Required**: True
      - **Type**: String
  - **kms_key_id**:
    - *KMS key arn to encrypt the volumes*
      - **Required**: True
      - **Type**: String
  - **volume_size**:
    - *The size of the volume in gigabytes.*
      - **Required**: True
      - **Type**: Integer

### ASG_NAME
Name of auto scaling group.
- **Required** : Yes
- **Type**: Strings
 
### ASG_SUBNET_IDS
Specifies whether detailed monitoring is enabled for the instance.
- **Required**: Yes
- **Type**: List of Strings

##  ASG_MAX_SIZE
The maximum size of the Auto Scaling Group.
- **Required**: Yes
- **Type**: Integer

### ASG_MIN_SIZE
The minimum size of the Auto Scaling Group.
 - **Required** : Yes
 - **Type** : Integer

### ASG_DESIRED_CAPACITY
The number of Amazon EC2 instances that should be running in the group.
 - **Required** : Yes
 - **Type** : Integer
 
### ASG_SCALING_POLICIES
Number of policies to create for autoscaling.
- **name**: 
  - *The name of the policy.*
    - **Required**: True
    - **Type**: String
- **metric_type**: 
  - *The metric type.*
    - **Required**: True
    - **Type**: String
- **target_value**: 
  - *The target value for the metric.*
    - **Required**: True
    - **Type**: Integer
- **estimated_warmup**: 
  - *The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics.*
    - **Required**: True
    - **Type**: Integer
  
### ASG_SCHEDULE_SCALING
Number of schedule scaling policies to create for autoscaling.
- **scheduled_action_name**: 
  - *The name of this scaling action.*
    - **Required**: True
    - **Type**: String
- **min_size**: 
  - *The minimum size for the Auto Scaling group*
    - **Required**: True
    - **Type**: Integer
- **max_size**: 
  - *The maximum size for the Auto Scaling group.*
    - **Required**: True
    - **Type**: Integer
- **desired_capacity**: 
  - *The number of EC2 instances that should be running in the group.*
    - **Required**: True
    - **Type**: Integer
- **recurrence**: 
  - *The time when recurring future actions will start.*
    - **Required**: True
    - **Type**: String
- **start_time**: 
  - *The time for this action to start.*
    - **Required**: True
    - **Type**: String
- **end_time**: 
  - *The time for this action to end*
    - **Required**: True
    - **Type**: String

### ASG_ACTIVITY_NOTIFICATIONS
Number of notifications  for autoscaling
- **topic_arn**: 
  - * The Topic ARN for notifications to be sent through*
    - **Required**: True
    - **Type**: String
- **notifications**: 
  - * A list of Notification Types that trigger notifications.*
    - **Required**: True
    - **Type**: List of String

### INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR
Shutdown behavior for the instance. 
- **Required** : No
- **Type**: Strings
 
### EBS_OPTIMIZED
If true, the launched EC2 instance will be EBS-optimized.
- **Required**: No
- **Type**: Boolean

##  ENABLE_MONITORING
Enables/disables detailed monitoring. This is enabled by default.
- **Required**: No
- **Type**: Boolean

### DISABLE_API_TERMINATION
If true, enables EC2 Instance Termination Protection.
 - **Required** : No
 - **Type** : Boolean

### HEALTH_CHECK_GRACE_PERIOD
Time (in seconds) after instance comes into service before checking health.
 - **Required** : No
 - **Type** : Integer

### HEALTH_CHECK_TYPE
EC2" or "ELB". Controls how health checking is done.
- **Required** : No
- **Type**: Strings
 
### DEFAULT_COOLDOWN
The amount of time, in seconds, after a scaling activity completes before another scaling activity can start.
- **Required**: No
- **Type**: Boolean

##  FORCE_DELETE
 Allows deleting the Auto Scaling Group without waiting for all instances in the pool to terminate. 
- **Required**: No
- **Type**: Boolean

### TERMINATION_POLICIES
A list of policies to decide how the instances in the Auto Scaling Group should be terminated.
 - **Required** : No
 - **Type** : List of String

### SUSPENDED_PROCESSES
A list of processes to suspend for the Auto Scaling Group.
 - **Required** : No
 - **Type** : List of String

### PLACEMENT_GROUP
The name of the placement group into which you'll launch your instances, if any.
- **Required** : No
- **Type**: Strings
 
### ENABLED_METRICS
A list of metrics to collect. The allowed values are defined by the underlying AWS API.
- **Required**: No
- **Type**: List of String

##  SERVICE_LINKED_ROLE_ARN
The ARN of the service-linked role that the ASG will use to call other AWS services.
- **Required**: No
- **Type**: String

### MAX_INSTANCE_LIFETIME
The maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 86400 and 31536000 seconds.
 - **Required** : Yes
 - **Type** : Integer

### INSTANCE_TAGS
Tags that will be attached with all the instances created.
 - **Required** : No
 - **Type** : ""

---
##  Resource Referencing Variables
Resource referencing variables available for AutoScaling which can be used for cross resource referencing
> Note : Replace index and reference with your desired value 

### LAUNCH_TEMPLATE
Nested argument with Launch template specification to use to launch instances.
- **Type** : Object
- **Usage** :
    - Same Request
        - ${AutoScaling[index].LAUNCH_TEMPLATE}
    - Previous Request
        - import ${ref.AutoScaling[index].LAUNCH_TEMPLATE}	

### LAUNCH_TEMPLATE_ARN
The ARN of the launch template.
- **Type** : String
- **Usage** :
    - Same Request
        - ${AutoScaling[index].LAUNCH_TEMPLATE_ARN}
    - Previous Request
        - import ${ref.AutoScaling[index].LAUNCH_TEMPLATE_ARN}	
      
### LAUNCH_TEMPLATE_ID
The ID of the launch template.
- **Type** : String
- **Usage** :
    - Same Request
        - ${AutoScaling[index].LAUNCH_TEMPLATE_ID}
    - Previous Request
        - import ${ref.AutoScaling[index].LAUNCH_TEMPLATE_ID}	

### AUTOSCALING_GROUP
Provides the Timeouts configuration options.
- **Type** : Object
- **Usage** :
    - Same Request
        - ${AutoScaling[index].AUTOSCALING_GROUP}
    - Previous Request
        - import ${ref.AutoScaling[index].AUTOSCALING_GR

### AUTOSCALING_GROUP_NAME
The name of the Autoscaling Group to apply the tag to.
- **Type** : String
- **Usage** :
    - Same Request
        - ${AutoScaling[index].AUTOSCALING_GROUP_NAME}
    - Previous Request
        - import ${ref.AutoScaling[index].AUTOSCALING_GROUP_NAME}	
      
### AUTOSCALING_GROUP_ARN
The arn of the Autoscaling Group.
- **Type** : String
- **Usage** :
    - Same Request
        - ${AutoScaling[index].AUTOSCALING_GROUP_ARN}
    - Previous Request
        - import ${ref.AutoScaling[index].AUTOSCALING_GROUP_ARN}	
