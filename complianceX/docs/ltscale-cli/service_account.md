---
layout: comx
title: Service Account
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/service-account/index.html
---
# RDS
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Service Account
>Service account is used to give access to pods.

To create this entity in your **Litmus Scale** template, use the following data:
```
{
      "TAGS": "str",
      "CLUSTER_NAME": "str",
      "serviceaccount": [
        {
          "name": "str",
          "namespace": "str",
          "policy_arn": "str"
        }
      ]
}
```
## Properties

---

### TAGS
Map of tags to assign to the resource. 
- **Required** : No
- **Type** : JSON

### CLUSTER_NAME
The name of the cluster
- **Required** : Yes
- **Type** : String

### serviceaccount
Description about the service account.
- **Required** : Yes
- **Type** : List
- **Body** : 
  - **name**:
    - The name of the service account
  - **namespace**:
    - The name of the environment
  - **policy_arn**:
    - The arn of the policy attached to it.

---
