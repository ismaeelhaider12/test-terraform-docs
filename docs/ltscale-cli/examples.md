---
layout: comx
title: Examples
parent: Litmus Scale Cli Tool
permalink: /ltscale-cli/examples/index.html

---
# Litmus Scale CLI Tool
{: .no_toc }


# Examples:
## Deploy an application with EKS
- Create a VPC, KMS and S3:
    Using the following command:
    ```
    ltscale provision –data file://{PATH to FILE}
    ```
    The file would contain the following data:
    ```
    {
        "REFERENCE_NAME": "<reference name >",
        "REGION": "us-east-1",
        "KMS": [
        {
            "TAGS": {},
            "DELETION_WINDOW_IN_DAYS": 7,
            "DESCRIPTION": "KMS for encrypting artifacts of pipeline in S3 bucket",
            "ALIAS": "ltscale-kms",
            "KMS_POLICY_JSON": "{\n    \"Version\": \"2012-10-17\",\n    \"Id\": \"Key policy created by CloudTrail\",\n    \"Statement\": [\n        {\n            \"Sid\": \"Enable IAM User Permissions\",\n            \"Effect\": \"Allow\",\n            \"Principal\": \"*\",\n            \"Action\": \"kms:*\",\n            \"Resource\": \"*\"\n        },\n        {\n            \"Sid\": \"Allow CloudTrail to encrypt logs\",\n            \"Effect\": \"Allow\",\n            \"Principal\": {\n                \"Service\": \"cloudtrail.amazonaws.com\"\n            },\n            \"Action\": \"kms:GenerateDataKey*\",\n            \"Resource\": \"*\",\n            \"Condition\": {\n                \"StringLike\": {\n                    \"kms:EncryptionContext:aws:cloudtrail:arn\": \"arn:aws:cloudtrail:*:*:trail/*\"\n                }\n            }\n        },\n        {\n            \"Sid\": \"Allow CloudTrail to describe key\",\n            \"Effect\": \"Allow\",\n            \"Principal\": {\n                \"Service\": \"cloudtrail.amazonaws.com\"\n            },\n            \"Action\": \"kms:DescribeKey\",\n            \"Resource\": \"*\"\n        },\n        {\n            \"Sid\": \"Allow principals in the account to decrypt log files\",\n            \"Effect\": \"Allow\",\n            \"Principal\": {\n                \"AWS\": \"*\"\n            },\n            \"Action\": [\n                \"kms:Decrypt\",\n                \"kms:ReEncryptFrom\"\n            ],\n            \"Resource\": \"*\",\n            \"Condition\": {\n                \"StringEquals\": {\n                    \"kms:CallerAccount\": \"*\"\n                },\n                \"StringLike\": {\n                    \"kms:EncryptionContext:aws:cloudtrail:arn\": \"arn:aws:cloudtrail:*:*:trail/*\"\n                }\n            }\n        },\n        {\n            \"Sid\": \"Allow alias creation during setup\",\n            \"Effect\": \"Allow\",\n            \"Principal\": {\n                \"AWS\": \"*\"\n            },\n            \"Action\": \"kms:CreateAlias\",\n            \"Resource\": \"*\",\n            \"Condition\": {\n                \"StringEquals\": {\n                    \"kms:ViaService\": \"ec2.us-east-1.amazonaws.com\",\n                    \"kms:CallerAccount\": \"*\"\n                }\n            }\n        },\n        {\n            \"Sid\": \"Enable cross account log decryption\",\n            \"Effect\": \"Allow\",\n            \"Principal\": {\n                \"AWS\": \"*\"\n            },\n            \"Action\": [\n                \"kms:Decrypt\",\n                \"kms:ReEncryptFrom\"\n            ],\n            \"Resource\": \"*\",\n            \"Condition\": {\n                \"StringEquals\": {\n                    \"kms:CallerAccount\": \"*\"\n                },\n                \"StringLike\": {\n                    \"kms:EncryptionContext:aws:cloudtrail:arn\": \"arn:aws:cloudtrail:*:*:trail/*\"\n                }\n            }\n        }\n    ]\n}",
            "ENABLE_KEY_ROTATION": true,
            "KEY_USAGE": "",
            "CUSTOMER_MASTER_KEY_SPEC": ""
        }
        ],
        "S3": [
        {
            "TAGS": "",
            "BUCKET_NAME": "ltscale-test-bucket",
            "BUCKET_POLICY": "{\n    \"Version\": \"2012-10-17\",\n    \"Statement\": [\n        {\n            \"Effect\": \"Deny\",\n            \"Principal\": \"*\",\n            \"Action\": \"s3:*\",\n            \"Resource\": \"arn:aws:s3:::ltscale-test-bucket\",\n            \"Condition\": {\n                \"Bool\": {\n                    \"aws:SecureTransport\": \"false\"\n                }\n            }\n        }\n    ]\n}",
            "KMS_KEY_ARN": "${KMS[0].KMS_KEY_ARN}",
            "LIFECYCLE_RULE": [],
            "ACL": "private",
            "SSE_ALGORITHM": "aws:kms"
        }
        ], 
        "VPC": [
        {
            "NAME": "Ltscale-vpc",
            "VPC_CIDR": "10.0.0.0/16",
            "AZS_COUNT": 2,
            "PUBLIC_SUBNETS": ["10.0.5.0/24","10.0.6.0/24"],
            "PRIVATE_SUBNETS": ["10.0.3.0/24","10.0.4.0/24"],
            "PRIVATE_SUBNETS_WITHOUT_NG": [],
            "TAGS": {},
            "ENABLE_DNS_SUPPORT": true,
            "ENABLE_DNS_HOSTNAMES": true,
            "INSTANCE_TENANCY": "default",
            "MAP_PUBLIC_IP_ON_LAUNCH": true
        }
        ]
    }
    ```
        
    If VPC, KMS and S3 are created successfully then move on to step two. 
    >Note: We will be referring  these resources in our next request

- Create an IAM Policy , IAM ROLE ,Security Group, and EKS Node Group
    Using the following command:
    ```
    ltscale provision –data file://{PATH to FILE}
    ```
    In this request the vpc , kms ,subnets created in the previous request are referred using the reference name of the previous request.

    The file would contain the following data:
    ```
    {
        "REFERENCE_NAME": "<reference name>",
        "REGION": "us-east-1",
        "IAM_Policy": [
        {
            "NAME": "EKS-node-Access",
            "DESCRIPTION": "policy to access eks",
            "POLICY_JSON": false,
            "POLICY": "policy-for-kms-access",
            "STATEMENTS": [
            {
                "effect": "Allow",
                "actions": ["kms:*","ecr:*","waf-regional:*","elasticloadbalancing:*","cloudformation:*","acm:*","cognito-idp:DescribeUserPoolClient","tag:*"],
                "resources": ["*"],
                "condition": []
            },
            {
                "effect": "Allow",
                "actions": ["iam:TagOpenIDConnectProvider","iam:CreatePolicy","iam:CreateServiceLinkedRole","iam:GetServerCertificate","iam:ListServerCertificates","iam:GetOpenIDConnectProvider","waf-regional:GetWebACLForResource","waf-regional:GetWebACL","waf-regional:AssociateWebACL","waf-regional:DisassociateWebACL","waf:GetWebACL","iam:CreateOpenIDConnectProvider"],
                "resources": ["*"],
                "condition": []
            }
            ]
        },
        {
            "NAME": "ALBIngressControllerIAMPolicy",
            "DESCRIPTION": "policy for alb ingress controller",
            "POLICY_JSON": false,
            "POLICY": "ALBIngressControllerIAMPolicy",
            "STATEMENTS": [
            {
                "effect": "Allow",
                "actions": ["acm:DescribeCertificate","acm:ListCertificates","acm:GetCertificate","ec2:*","elasticloadbalancing:*","iam:CreateServiceLinkedRole","iam:GetServerCertificate","iam:ListServerCertificates","cognito-idp:DescribeUserPoolClient","waf-regional:*","tag:*","waf:GetWebACL"],
                "resources": ["*"],
                "condition": []
            }
            ]
        }
        ],
    "IAM_Role": [
    {
    "TAGS": "",
    "NAME": "EKS-NodeGroup-Cluster-Role",
    "CREATE_INSTANCE_PROFILE": true ,
    "POLICIES_ARN": ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy","arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy","arn:aws:iam::aws:policy/AmazonSSMFullAccess","arn:aws:iam::aws:policy/AmazonECS_FullAccess","arn:aws:iam::aws:policy/CloudWatchFullAccess","arn:aws:iam::aws:policy/AWSCodePipelineFullAccess","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess","arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess","arn:aws:iam::aws:policy/AmazonEC2FullAccess"],
    "STATEMENTS": [
        {
        "effect": "Allow",
        "actions": ["sts:AssumeRole"],
        "principals": {
            "type": "Service",
            "identifiers": ["ec2.amazonaws.com","eks.amazonaws.com"]
        }
        }
    ],
    "PATH": "/"
    },
    {
        "TAGS": "",
        "NAME": "EKS-NodeGroup-Role",
        "CREATE_INSTANCE_PROFILE": true ,
        "POLICIES_ARN": ["${IAM_Policy[0].IAM_POLICY_ARN}","arn:aws:iam::aws:policy/AmazonEC2FullAccess","arn:aws:iam::aws:policy/AmazonEKSClusterPolicy","arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy","arn:aws:iam::aws:policy/AmazonEKSServicePolicy","arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly","arn:aws:iam::aws:policy/AmazonSSMFullAccess"],
        "STATEMENTS": [
        {
            "effect": "Allow",
            "actions": ["sts:AssumeRole"],
            "principals": {
            "type": "Service",
            "identifiers": ["ec2.amazonaws.com","eks-fargate-pods.amazonaws.com"]
            }
        }
        ],
        "PATH": "/"
    }
    ],
    "SecurityGroup": [
    {
        "SG_NAME": "eks-SecurityGroupass",
        "SG_DESCRIPTION": "Security Group Attached to EKS NodeGroup Cluster",
        "VPC_ID":"import ${<vpc reference name >.VPC[0].VPC_ID}",
        "SG_INGRESS": [
            {
                "sg_ingress_from_port": 443,
                "sg_ingress_to_port": 443,
                "sg_ingress_protocol": "tcp",
                "sg_ingress_description": "https",
                "sg_ingress_cidr_blocks": [
                    "0.0.0.0/0"
                ],
                "sg_ingress_security_groups": [],
                "sg_ingress_self": false
            },
            {
                "sg_ingress_from_port": 80,
                "sg_ingress_to_port": 80,
                "sg_ingress_protocol": "tcp",
                "sg_ingress_description": "http",
                "sg_ingress_cidr_blocks": [
                    "0.0.0.0/0"
                ],
                "sg_ingress_security_groups": [],
                "sg_ingress_self": false
            },
            {
                "sg_ingress_from_port": 10250,
                "sg_ingress_to_port": 10250,
                "sg_ingress_protocol": "tcp",
                "sg_ingress_description": "http",
                "sg_ingress_cidr_blocks": [
                    "0.0.0.0/0"
                ],
                "sg_ingress_security_groups": [],
                "sg_ingress_self": false
            },
            {
                "sg_ingress_from_port": 30000,
                "sg_ingress_to_port": 35000,
                "sg_ingress_protocol": "tcp",
                "sg_ingress_description": "http",
                "sg_ingress_cidr_blocks": [
                    "0.0.0.0/0"
                ],
                "sg_ingress_security_groups": [],
                "sg_ingress_self": false
            }
        ],
        "TAGS": {},
        "REGION": "us-east-1"
    }
    ],
    "EKS_NODE_GROUP": [
    {
        "IMAGE_ID": "ami-0174a6075c55569a1",
        "TEMPLATE_NAME": "EKS-NodeGroup-Template",
        "KEY_NAME": "ekss",
        "ASSOCIATE_PUBLIC_IP_ADDRESS": true,
        "USER_DATA": "yum update -y",
        "EBS_BLOCK_DEVICE": [
        {
            "device_name": "/dev/xvda",
            "ebs": {
            "delete_on_termination": true,
            "volume_type": "gp2",
            "kms_key_id": "import ${<vpc reference name >.KMS[0].KMS_KEY_ARN}",
            "volume_size": 40
            }
        }
        ],
        "LOGS_RETENTION_IN_DAYS": 7,
        "CREATE_CLUSTER": true,
        "CLUSTER_ROLE_ARN": "${IAM_Role[0].IAM_ROLE_ARN}",
        "KMS_ARN": "import ${<vpc reference name >.KMS[0].KMS_KEY_ARN}",
        "SECURITY_GROUP_IDS": ["${u[0].SECURITY_GROUP_ID}"],
        "CLUSTER_SUBNET_IDS": ["import ${<vpc reference name >.VPC[0].PUBLIC_SUBNET_IDS[0]}","import ${<vpc reference name >.VPC[0].PUBLIC_SUBNET_IDS[1]}"],
        "ENDPOINT_PUBLIC_ACCESS": true,
        "PUBLIC_ACCESS_CIDRS": [],
        "ENDPOINT_PRIVATE_ACCESS": null,
        "CLUSTER_NAME": "EKS-Cluster",
        "KUBERNETES_VERSION": "1.21",
        "LOGGING_TYPE": ["api","audit","scheduler","authenticator"],
        "NODE_ROLE_ARN": "${IAM_Role[1].IAM_ROLE_ARN}",
        "DESIRED_CAPACITY": 1,
        "MAX_SIZE": 1,
        "MIN_SIZE": 1,
        "NODE_INSTANCE_TYPE": "t3.medium",
        "NODE_GROUP_SUBNET_IDS": ["import ${<vpc reference name >.VPC[0].PUBLIC_SUBNET_IDS[0]}","import ${<vpc reference name >.VPC[0].PUBLIC_SUBNET_IDS[1]}"],
        "AMI_TYPE": "CUSTOM",
        "CAPACITY_TYPE": "ON_DEMAND",
        "TAGS": "",
        "INSTANCE_TAGS": {
        "Name": "EKS-CLuster-Nodes"
    },
        "CODEBUILD_ROLE_NAME": "CodeBuild-Role-EKS-NodeGroup",
        "ALB_INGRESS_POLICY_ARN": "${IAM_Policy[1].IAM_POLICY_ARN}"
    }
    ]
    }
    ```

- Create an IAM Policy, IAM Role and Codepipeline
    Using the following command:
    ```
    ltscale provision –data file://{PATH to FILE}
    ```
    The file would contain the following data:

    ```
    {
        "REFERENCE_NAME": "<reference_name>",
        "REGION": "us-east-1",
        "IAM_Policy": [
        {
            "NAME": "EKS-test-cluster-Access-for-pipeline",
            "DESCRIPTION": "policy to access eks",
            "POLICY_JSON": false,
            "POLICY": "eks-test-access",
            "STATEMENTS": [
            {
                "effect": "Allow",
                "actions": ["eks:*","kms:*","ecr:*","waf-regional:*","elasticloadbalancing:*","acm:*","cloudformation:*","cognito-idp:DescribeUserPoolClient","tag:*"],
                "resources": ["*"],
                "condition": []
            },
            {
                "effect": "Allow",
                "actions": ["iam:TagOpenIDConnectProvider","iam:CreatePolicy","iam:CreateServiceLinkedRole","iam:GetServerCertificate","iam:ListServerCertificates","iam:GetOpenIDConnectProvider","waf-regional:GetWebACLForResource","waf-regional:GetWebACL","waf-regional:AssociateWebACL","waf-regional:DisassociateWebACL","waf:GetWebACL","iam:CreateOpenIDConnectProvider"],
                "resources": ["*"],
                "condition": []
            }
            ]
        }
        ],
        "IAM_Role": [
        {
            "TAGS": "",
            "NAME": "CodePipeline-Role-EKS-test-NodeGroup",
            "CREATE_INSTANCE_PROFILE": true ,
            "POLICIES_ARN": ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy","arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/AmazonECS_FullAccess","arn:aws:iam::aws:policy/CloudWatchFullAccess","arn:aws:iam::aws:policy/AWSCodePipelineFullAccess","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess","arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"],
            "STATEMENTS": [
            {
                "effect": "Allow",
                "actions": ["sts:AssumeRole"],
                "principals": {
                "type": "Service",
                "identifiers": ["ec2.amazonaws.com","codepipeline.amazonaws.com"]
                }
            }
            ],
            "PATH": "/"
        },
        {
            "TAGS": "",
            "NAME": "CodeBuild-Role-EKS-test-NodeGroup",
            "CREATE_INSTANCE_PROFILE": true,
            "POLICIES_ARN": ["${IAM_Policy[0].IAM_POLICY_ARN}","arn:aws:iam::aws:policy/AmazonEKSClusterPolicy","arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/AmazonECS_FullAccess","arn:aws:iam::aws:policy/CloudWatchFullAccess","arn:aws:iam::aws:policy/AWSCodePipelineFullAccess","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess","arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"],
            "STATEMENTS": [
            {
                "effect": "Allow",
                "actions": ["sts:AssumeRole"],
                "principals": {
                "type": "Service",
                "identifiers": ["ec2.amazonaws.com","codebuild.amazonaws.com"]
                }
            }
            ],
            "PATH": "/"
        }
        ],
        "CodePipeline": [
        {
            "RESOURCE": "EKS",
            "CODE_PIPELINE_NAME": "EKS-test-Deployment-Pipeline",
            "CODE_PIPELINE_ROLE": "${IAM_Role[0].IAM_ROLE_ARN}",
            "ARTIFECT_BUCKET_NAME": "import ${<vpc reference name >.S3[0].S3_BUCKET_NAME}",
            "KMS_ARN": "import ${<vpc reference name >.KMS[0].KMS_KEY_ARN}",
            "SOURCE_ACTION": [
            {
                "name": "Source",
                "category": "Source",
                "owner": "ThirdParty",
                "provider": "GitHub",
                "version": 1,
                "output_artifacts": [ "SourceArtifact" ],
                "run_order": 1,
                "configuration": {
                "ConnectionArn": null,
                "FullRepositoryId": null,
                "RepositoryName": null,
                "BranchName": null,
                "S3Bucket": null,
                "S3ObjectKey": null,
                "Owner": "<ower>",
                "Repo": "apache",
                "PollForSourceChanges": true,
                "Branch": "main",
                "OAuthToken": "<Token>"
                }
            }
            ],
            "BUILD_PROJECT": [
            {
                "name": "image-build-test-vulnerability-check",
                "description": "this build Project is for creating images",
                "build_timeout": 60,
                "service_role": "${IAM_Role[1].IAM_ROLE_ARN}",
                "artifacts": [
                {
                    "type": "CODEPIPELINE"
                }
                ],
                "cache": [],
                "environment": 
                {
                    "compute_type": "BUILD_GENERAL1_SMALL",
                    "image": "aws/codebuild/amazonlinux2-x86_64-standard:2.0",
                    "type": "LINUX_CONTAINER",
                    "image_pull_credentials_type": "CODEBUILD",
                    "privileged_mode": true,
                    "environment_variable": [
                    {
                        "name": "REPOSITORY_URI",
                        "value": "233317620877.dkr.ecr.us-east-1.amazonaws.com/nginx",
                        "type": "PLAINTEXT"
                    }
                    ]
                },
                "source": [
                {
                    "buildspec": "data.template_file.buildspeceks.rendered"
                }
                ],
                "vpc_config": []
            },
            {
                "name": "image-scan-test-vulnerability-check",
                "description": "this build Project is for scaning image and deploying on EKS Cluster",
                "build_timeout": 60,
                "service_role": "${IAM_Role[1].IAM_ROLE_ARN}",
                "artifacts": [
                {
                    "type": "CODEPIPELINE"
                }
                ],
                "cache": [],
                "environment": 
                {
                    "compute_type": "BUILD_GENERAL1_SMALL",
                    "image": "059516066038.dkr.ecr.us-east-1.amazonaws.com/amazonlinux:latest",
                    "type": "LINUX_CONTAINER",
                    "image_pull_credentials_type": "SERVICE_ROLE",
                    "privileged_mode": true,
                    "environment_variable": [
                    {
                        "name": "CLUSTER_NAME",
                        "value": "EKS-Cluster",
                        "type": "PLAINTEXT"
                    },
                    {
                        "name": "AWS_REGION",
                        "value": "us-east-1",
                        "type": "PLAINTEXT"
                    }
                    ]
                },
                "source": [
                {
                    "buildspec": "data.template_file.buildspeceksscan.rendered"
                }
                ],
                "vpc_config": []
            }
        ],
            "BUILD_APPROVAL": {},
            "BUILD_ACTION": [
            {
                "name": "Build",
                "action": {
                "name": "Build",
                "category": "Build",
                "owner": "AWS",
                "provider": "CodeBuild",
                "run_order": 1,
                "version": 1,
                "input_artifacts": [ "SourceArtifact" ],
                "output_artifacts": [ "BuildArtifact" ],
                "configuration": {
                    "ProjectName": "image-build-test-vulnerability-check"
                }
                }
            },
            {
                "name": "Deploy",
                "action": {
                "name": "Deploy",
                "category": "Build",
                "owner": "AWS",
                "provider": "CodeBuild",
                "run_order": 2,
                "version": 1,
                "input_artifacts": [ "BuildArtifact" ],
                "output_artifacts": [ "ScanArtifact" ],
                "configuration": {
                    "ProjectName": "image-scan-test-vulnerability-check"
                }
                }
            }
        ],
            "CODEDEPLOY_APPLICATION": [],
            "DEPLOYMENT_CONFIG": [],
            "DEPLOYMENT_GROUP": [],
            "DEPLOY_APPROVAL": [],
            "DEPLOY_ACTION": [],
            "TAGS": {
            "Creator": "ltscale-Tool-EKS-Deployment"
        }
        }
        ]
    }
    ```




## Deploy an application with ECS
- Create a VPC, KMS and S3:
    You can see the example of EKS deployment for VPC ,KMS and S3 creation

- Create an IAM Role ,Security Group, and ECS EC2 Type
    Using the following command:
    ```
    ltscale provision –data file://{PATH to FILE}
    ```
    In this request the vpc , kms ,subnets created in the previous request are referred using the reference name of the previous request.

    The file would contain the following data:
    ```
    {
  "REFERENCE_NAME": "<reference name>",
  "REGION": "us-east-1",
  "IAM_Role": [
    {
      "TAGS": "",
      "NAME": "complianceX-ecs-ec2-role",
      "CREATE_INSTANCE_PROFILE": true,
      "POLICIES_ARN": [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
        "arn:aws:iam::aws:policy/AmazonECS_FullAccess",
        "arn:aws:iam::aws:policy/CloudWatchFullAccess",
        "arn:aws:iam::aws:policy/AWSCodePipelineFullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
        "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
      ],
      "STATEMENTS": [
        {
          "effect": "Allow",
          "actions": [
            "sts:AssumeRole"
          ],
          "principals": {
            "type": "Service",
            "identifiers": [
              "ec2.amazonaws.com"
            ]
          }
        }
      ],
      "PATH": "/"
    },
    {
      "TAGS": "",
      "NAME": "complianceX-ECS-TaskExecution-role",
      "CREATE_INSTANCE_PROFILE": false,
      "POLICIES_ARN": [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonECS_FullAccess",
        "arn:aws:iam::aws:policy/CloudWatchFullAccess",
        "arn:aws:iam::aws:policy/AWSCodePipelineFullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
        "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
      ],
      "STATEMENTS": [
        {
          "effect": "Allow",
          "actions": [
            "sts:AssumeRole"
          ],
          "principals": {
            "type": "Service",
            "identifiers": [
              "ecs-tasks.amazonaws.com"
            ]
          }
        }
      ],
      "PATH": "/"
    },
    {
      "TAGS": "",
      "NAME": "complianceX-ECS-Executions-role",
      "CREATE_INSTANCE_PROFILE": false,
      "POLICIES_ARN": [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/AmazonECS_FullAccess",
        "arn:aws:iam::aws:policy/CloudWatchFullAccess",
        "arn:aws:iam::aws:policy/AWSCodePipelineFullAccess",
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
        "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess",
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
      ],
      "STATEMENTS": [
        {
          "effect": "Allow",
          "actions": [
            "sts:AssumeRole"
          ],
          "principals": {
            "type": "Service",
            "identifiers": [
              "ecs-tasks.amazonaws.com"
            ]
          }
        }
      ],
      "PATH": "/"
    }
  ],
  "SecurityGroup": [
    {
      "SG_NAME": "SecurityGroup-for-ECS-Cluster",
      "SG_DESCRIPTION": "Security Group Attached to ECS EC2 Cluster",
      "VPC_ID": "import ${<reference_name>.VPC[0].VPC_ID}",
      "SG_INGRESS": [
        {
          "sg_ingress_from_port": 443,
          "sg_ingress_to_port": 443,
          "sg_ingress_protocol": "tcp",
          "sg_ingress_description": "https",
          "sg_ingress_cidr_blocks": [
            "0.0.0.0/0"
          ],
          "sg_ingress_security_groups": [],
          "sg_ingress_self": false
        },
        {
          "sg_ingress_from_port": 80,
          "sg_ingress_to_port": 80,
          "sg_ingress_protocol": "tcp",
          "sg_ingress_description": "http",
          "sg_ingress_cidr_blocks": [
            "0.0.0.0/0"
          ],
          "sg_ingress_security_groups": [],
          "sg_ingress_self": false
        },
        {
          "sg_ingress_from_port": 0,
          "sg_ingress_to_port": 65535,
          "sg_ingress_protocol": "tcp",
          "sg_ingress_description": "all tcp",
          "sg_ingress_cidr_blocks": [
            "10.0.0.0/16"
          ],
          "sg_ingress_security_groups": [],
          "sg_ingress_self": false
        }
      ],
      "TAGS": {},
      "REGION": "us-east-1"
    }
  ],
  "ECS_EC2_TYPE": [
    {
      "CLUSTER_NAME": "ECS-EC2-CLUSTER",
      "LOG_GROUP_NAME": "ecs-ec2type-loggroup",
      "KMS_KEY_ID": "import ${<reference_name>.KMS[0].KMS_KEY_ARN}",
      "LAUNCH_TEMPLATE_NAME": "ecs-ec2-launchtemplate",
      "IPC_MODE": "host",
      "NETWORK_MODE": "awsvpc",
      "PID_MODE": "host",
      "DESIRED_COUNT": 1,
      "SUBNETS": [
        "import ${<reference_name>.VPC[0].PUBLIC_SUBNET_IDS[0]}",
        "import ${<reference_name>.VPC[0].PUBLIC_SUBNET_IDS[1]}"
      ],
      "SECURITY_GROUPS": [
        "${SecurityGroup[0].SECURITY_GROUP_ID}"
      ],
      "ASSIGN_PUBLIC_IP": true,
      "DELETE_ON_TERMINATION": true,
      "INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR": "",
      "EBS_OPTIMIZED": null,
      "DISABLE_API_TERMINATION": null,
      "RETENTION_DAYS": 7,
      "INSTANCE_PROFILE_NAME": "${IAM_Role[0].IAM_INSTANCE_PROFILE_NAME[0]}",
      "TASK_ROLE_ARN": "${IAM_Role[1].IAM_ROLE_ARN}",
      "EXECUTION_ROLE_ARN": "${IAM_Role[2].IAM_ROLE_ARN}",
      "AUTOSCALING_NAME": "ECS-Nodes-Autoscaing",
      "MIN_SIZE": 1,
      "MAX_SIZE": 1,
      "DESIRED_CAPACITY": 1,
      "HEALTH_CHECK_GRACE_PERIOD": 200,
      "DEFAULT_COOLDOWN": null,
      "FORCE_DELETE": null,
      "TERMINATION_POLICIES": [
        "Default"
      ],
      "SUSPENDED_PROCESSES": [],
      "PLACEMENT_GROUP": "",
      "ENABLED_METRICS": [
        "GroupMinSize",
        "GroupMaxSize",
        "GroupDesiredCapacity",
        "GroupInServiceInstances",
        "GroupPendingInstances",
        "GroupStandbyInstances",
        "GroupTerminatingInstances",
        "GroupTotalInstances"
      ],
      "METRICS_GRANULARITY": "",
      "SERVICE_LINKED_ROLE_ARN": "",
      "MAX_INSTANCE_LIFETIME": 0,
      "SCHEDULING_STRATEGY": "",
      "AMI_ID": "ami-0610b19efc65cafaa",
      "INSTANCE_TYPE": "t2.medium",
      "SSH_KEY_NAME": "ekss",
      "EBS_BLOCK_DEVICE": [
        {
          "device_name": "/dev/xvda",
          "ebs": {
            "delete_on_termination": true,
            "volume_type": "gp2",
            "kms_key_id": "import ${<reference_name>.KMS[0].KMS_KEY_ARN}",
            "volume_size": 40
          }
        }
      ],
      "MONITORING": false,
      "DEPLOYMENT_MIN_HEALTH": 50,
      "DEPLOYMENT_MAX_HEALTH": 200,
      "ECS_TASKS": [
        {
          "family": "ecsec2task",
          "cpu": "256",
          "memory": "512",
          "container_port": "8080",
          "container_name": "apache",
          "volume": [],
          "container_definition": [
            {
              "name": "apache",
              "image": "351407336450.dkr.ecr.us-east-1.amazonaws.com/nginx:latest",
              "essential": true,
              "cpu": 256,
              "memory": 512,
              "mountPoints": [],
              "portMappings": [
                {
                  "containerPort": 8080,
                  "protocol": "tcp",
                  "hostPort": 8080
                }
              ],
              "environment": [],
              "secrets": [],
              "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                  "awslogs-group": "ecs-ec2type-loggroup",
                  "awslogs-stream-prefix": "ecs-ec2type-loggroup-stream",
                  "awslogs-region": "us-east-1"
                }
              }
            }
          ]
        }
      ],
      "SERVICE": [
        {
          "name": "ec2-service",
          "task_definition": "ecsec2task",
          "desired_count": 1,
          "load_balancer": [
            {
              "target_group_arn": "import ${<reference_name>.LoadBalancer[0].ALB_TARGET_GROUPS_ARN[0]}",
              "container_name": "apache",
              "container_port": 8080
            }
          ],
          "network_configuration": [
            {
              "security_groups": [
                "${SecurityGroup[0].SECURITY_GROUP_ID}"
              ],
              "subnets": [
                "import ${<reference_name>.VPC[0].PUBLIC_SUBNET_IDS[0]}",
                "import ${<reference_name>.VPC[0].PUBLIC_SUBNET_IDS[1]}"
              ],
              "assign_public_ip": false
            }
          ]
        }
      ],
      "TAGS": "str",
      "INSTANCE_TAGS": {
        "Name": "ECS-Nodes"
      }
    }
  ]
  }

```
- Create an IAM Role and Codepipeline
    Using the following command:
    ```
    ltscale provision –data file://{PATH to FILE}
    ```
    The file would contain the following data:
    ```
    
{
  "REFERENCE_NAME": "<reference_name>",
  "REGION": "us-east-1",
  "IAM_Role": [
    {
      "TAGS": "",
      "NAME": "ComplianceX-ECS-codePipeline-Role",
      "CREATE_INSTANCE_PROFILE": true ,
      "POLICIES_ARN": ["arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/AmazonECS_FullAccess","arn:aws:iam::aws:policy/CloudWatchFullAccess","arn:aws:iam::aws:policy/AWSCodePipelineFullAccess","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess","arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess","arn:aws:iam::aws:policy/AmazonEC2FullAccess"],
      "STATEMENTS": [
        {
          "effect": "Allow",
          "actions": ["sts:AssumeRole"],
          "principals": {
            "type": "Service",
            "identifiers": ["ec2.amazonaws.com","codepipeline.amazonaws.com"]
          }
        }
      ],
      "PATH": "/"
    },
    {
      "TAGS": "",
      "NAME": "ComplianceX-ECS-codebuild-Role",
      "CREATE_INSTANCE_PROFILE": true,
      "POLICIES_ARN": ["arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/AdministratorAccess","arn:aws:iam::aws:policy/AmazonECS_FullAccess","arn:aws:iam::aws:policy/CloudWatchFullAccess","arn:aws:iam::aws:policy/AWSCodePipelineFullAccess","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess","arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess","arn:aws:iam::aws:policy/AmazonEC2FullAccess"],
      "STATEMENTS": [
        {
          "effect": "Allow",
          "actions": ["sts:AssumeRole"],
          "principals": {
            "type": "Service",
            "identifiers": ["ec2.amazonaws.com","codebuild.amazonaws.com"]
          }
        }
      ],
      "PATH": "/"
    }
  ],
  "CodePipeline": [
    {
      "RESOURCE": "ECS",
      "CODE_PIPELINE_NAME": "ECS-Deployments-Pipeline",
      "CODE_PIPELINE_ROLE": "${IAM_Role[0].IAM_ROLE_ARN}",
      "ARTIFECT_BUCKET_NAME": "import ${<reference_name>.S3[0].S3_BUCKET_NAME}",
      "KMS_ARN": "import ${<reference_name>.KMS[0].KMS_KEY_ARN}",
      "SOURCE_ACTION": [
        {
          "name": "Source",
          "category": "Source",
          "owner": "ThirdParty",
          "provider": "GitHub",
          "version": 1,
          "output_artifacts": [ "SourceArtifact" ],
          "run_order": 1,
          "configuration": {
            "ConnectionArn": null,
            "FullRepositoryId": null,
            "RepositoryName": null,
            "BranchName": null,
            "S3Bucket": null,
            "S3ObjectKey": null,
            "Owner": "<owner name>",
            "Repo": "<repo name>",
            "PollForSourceChanges": true,
            "Branch": "main",
            "OAuthToken": "<github token>"
          }
        }
      ],
      "BUILD_PROJECT":  [
        {
            "name": "Building-Image",
            "description": "image building",
            "build_timeout": 60,
            "service_role": "${IAM_Role[1].IAM_ROLE_ARN}",
            "artifacts": [
              {
                "type": "CODEPIPELINE"
              }
            ],
            "cache": [],
            "environment":
              {
                "compute_type": "BUILD_GENERAL1_SMALL",
                "image": "aws/codebuild/amazonlinux2-x86_64-standard:2.0",
                "type": "LINUX_CONTAINER",
                "image_pull_credentials_type": "CODEBUILD",
                "privileged_mode": true,
                "environment_variable": []
              },
            "source": [
              {
                "buildspec": "buildspec.yaml"
              }
            ],
            "vpc_config": []
          },
          {
            "name": "vulnerability-check",
            "description": "image scaning project",
            "build_timeout": 60,
            "service_role": "${IAM_Role[1].IAM_ROLE_ARN}",
            "artifacts": [
              {
                "type": "CODEPIPELINE"
              }
            ],
            "cache": [],
            "environment":
              {
                "compute_type": "BUILD_GENERAL1_SMALL",
                "image": "aws/codebuild/amazonlinux2-x86_64-standard:2.0",
                "type": "LINUX_CONTAINER",
                "image_pull_credentials_type": "CODEBUILD",
                "privileged_mode": true,
                "environment_variable": []
              },
            "source": [
              {
                "buildspec": "data.template_file.buildspec.rendered"
              }
            ],
            "vpc_config": []
          }
        ],
      "BUILD_APPROVAL": [],
      "BUILD_ACTION": [
        {
          "name": "Build",
          "action": {
            "name": "Build",
            "category": "Build",
            "owner": "AWS",
            "provider": "CodeBuild",
            "run_order": 1,
            "version": 1,
            "input_artifacts": [ "SourceArtifact" ],
            "output_artifacts": [ "BuildOutputArtifact" ],
            "configuration": {
              "ProjectName": "Building-Image"
            }
          }
        },
        {
          "name": "vulnerability-check",
          "action": {
            "name": "vulnerability-check",
            "category": "Build",
            "owner": "AWS",
            "provider": "CodeBuild",
            "run_order": 2,
            "version": 1,
            "input_artifacts": [ "BuildOutputArtifact" ],
            "output_artifacts": [ "scanOutputArtifact" ],
            "configuration": {
              "ProjectName": "vulnerability-check"
            }
          }
        }
      ],
      "CODEDEPLOY_APPLICATION": [],
      "DEPLOYMENT_CONFIG": [],
      "DEPLOYMENT_GROUP": [],
      "DEPLOY_APPROVAL": [],
      "DEPLOY_ACTION": [
        {
          "name": "Deploy",
          "action": {
            "name": "Deploy",
            "category": "Deploy",
            "owner": "AWS",
            "provider": "ECS",
            "input_artifacts": [ "scanOutputArtifact" ],
            "version": 1,
            "region": "us-east-1",
            "configuration": {
              "ApplicationName": null,
              "DeploymentGroupName": null,
              "ClusterName": "ECS-EC2-CLUSTER",
              "ServiceName": "ec2-service",
              "FileName": "imagedefinition.json"
            }
          }
        }
      ],
      "TAGS": {
        "Creator": "Compliance-Tool-ECS-ec2"
    }
    }
  ]
}

```





## Deploy an application with EC2
- Create IAM ROLE ,Security Group, and AutoScaling Group
    Using the following command:

    ```
    ltscale provision –data file://{PATH to FILE}
    ```
    In this request the vpc , kms ,subnets created in the previous request are referred using the reference name of the previous request.

    The file would contain the following data:
    ```
    {
  "REFERENCE_NAME": "<reference_name>",
  "REGION": "us-east-1",
  "IAM_Role": [
      {
        "TAGS": "",
        "NAME": "complianceX-ec2-Role-test",
        "CREATE_INSTANCE_PROFILE": true,
        "POLICIES_ARN": ["arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole","arn:aws:iam::aws:policy/AWSCodeDeployFullAccess","arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/AmazonSSMFullAccess","arn:aws:iam::aws:policy/CloudWatchFullAccess","arn:aws:iam::aws:policy/AWSCodePipelineFullAccess","arn:aws:iam::aws:policy/AmazonEC2FullAccess"],
        "STATEMENTS": [
          {
            "effect": "Allow",
            "actions": ["sts:AssumeRole"],
            "principals": {
              "type": "Service",
              "identifiers": ["ec2.amazonaws.com","autoscaling.amazonaws.com"]
            }
          }
      
        ]
      }
  ],
        "SecurityGroup": [
          {
              "SG_NAME": "compliancX-EC2-SecurityGroup",
              "SG_DESCRIPTION": "Security Group Attached to ec2 instance",
              "VPC_ID": "import ${VPC_ReQuest.VPC[0].VPC_ID}",
              "SG_INGRESS": [
                  {
                      "sg_ingress_from_port": 443,
                      "sg_ingress_to_port": 443,
                      "sg_ingress_protocol": "tcp",
                      "sg_ingress_description": "https",
                      "sg_ingress_cidr_blocks": [
                          "0.0.0.0/0"
                      ],
                      "sg_ingress_security_groups": [],
                      "sg_ingress_self": false
                  },
                  {
                      "sg_ingress_from_port": 80,
                      "sg_ingress_to_port": 80,
                      "sg_ingress_protocol": "tcp",
                      "sg_ingress_description": "http",
                      "sg_ingress_cidr_blocks": [
                          "0.0.0.0/0"
                      ],
                      "sg_ingress_security_groups": [],
                      "sg_ingress_self": false
                  },
                  {
                    "sg_ingress_from_port": 0,
                    "sg_ingress_to_port": 65535,
                    "sg_ingress_protocol": "tcp",
                    "sg_ingress_description": "all tcp",
                    "sg_ingress_cidr_blocks": [
                        "10.0.0.0/16"
                    ],
                    "sg_ingress_security_groups": [],
                    "sg_ingress_self": false
                }
              ],
              "TAGS": {},
              "REGION": "us-east-1"
          }
        ],
  "AutoScaling": [
    {
      "TAGS": "",
      "IMAGE_ID": "ami-0e80b02cfa45bd200",
      "TEMPLATE_NAME": "ec2-instance-template-test",
      "INSTANCE_TYPE": "t2.micro",
      "ASG_IAM_INSTANCE_PROFILE_NAME": "${IAM_Role[0].IAM_INSTANCE_PROFILE_NAME[0]}",
      "KEY_NAME": null,
      "ASG_SECURITY_GROUP_IDS": ["${SecurityGroup[0].SECURITY_GROUP_ID}"],
      "ASSOCIATE_PUBLIC_IP_ADDRESS": true,
      "ASG_USER_DATA": "",
      "ASG_LOAD_BALANCERS": [],
      "ASG_TARGET_GROUP_ARNS": [],
      "ASG_EBS_BLOCK_DEVICE": [
        {
          "device_name": "/dev/xvda",
          "ebs": {
            "delete_on_termination": true,
            "volume_type": "gp2",
            "kms_key_id": "import ${VPC_ReQuest.KMS[0].KMS_KEY_ARN}",
            "volume_size": 8
          }
        },
        {
          "device_name": "/dev/sdf",
          "ebs": {
            "delete_on_termination": true,
            "volume_type": "gp2",
            "kms_key_id": "import ${VPC_ReQuest.KMS[0].KMS_KEY_ARN}",
            "volume_size": 25
          }
        }
      ],

      "ASG_NAME": "ec2-AutoScaling",
      "ASG_SUBNET_IDS": ["import ${VPC_ReQuest.VPC[0].PUBLIC_SUBNET_IDS[0]}","import ${VPC_ReQuest.VPC[0].PUBLIC_SUBNET_IDS[1]}"],
      "ASG_MAX_SIZE": 1,
      "ASG_MIN_SIZE": 1,
      "ASG_DESIRED_CAPACITY": 1,
      "ASG_SCALING_POLICIES": [],
      "ASG_SCHEDULE_SCALING": [],
      "ASG_ACTIVITY_NOTIFICATIONS": [],
      "INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR": "stop",
      "EBS_OPTIMIZED": false,
      "ENABLE_MONITORING": false,
      "DISABLE_API_TERMINATION": true,
      "HEALTH_CHECK_GRACE_PERIOD": 300,
      "HEALTH_CHECK_TYPE": "EC2",
      "DEFAULT_COOLDOWN": 300,
      "FORCE_DELETE": false,
      "TERMINATION_POLICIES": [],
      "SUSPENDED_PROCESSES": [],
      "PLACEMENT_GROUP": "",
      "ENABLED_METRICS": [],
      "SERVICE_LINKED_ROLE_ARN": null ,
      "MAX_INSTANCE_LIFETIME": 0,
      "INSTANCE_TAGS": {
        "Name": "ec2-template-Instance"
    }
    }
  ]
    }
    ```

- Create an IAM Role and Codepipeline
    Using the following command:
    ```
    ltscale provision –data file://{PATH to FILE}
    ```
    The file would contain the following data:
    
```
{
  "REFERENCE_NAME": "EC2_DEPloYMENT_Template2",
  "REGION": "us-east-1",
  "IAM_Role": [
    {
      "TAGS": "",
      "NAME": "ec2-codePipeline-role",
      "CREATE_INSTANCE_PROFILE": true ,
      "POLICIES_ARN": ["arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/AmazonECS_FullAccess","arn:aws:iam::aws:policy/CloudWatchFullAccess","arn:aws:iam::aws:policy/AWSCodePipelineFullAccess","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess","arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess","arn:aws:iam::aws:policy/AmazonEC2FullAccess"],
      "STATEMENTS": [
        {
          "effect": "Allow",
          "actions": ["sts:AssumeRole"],
          "principals": {
            "type": "Service",
            "identifiers": ["ec2.amazonaws.com","codepipeline.amazonaws.com"]
          }
        }
      ],
      "PATH": "/"
    },
    {
      "TAGS": "",
      "NAME": "ec2-codedeploy-role",
      "CREATE_INSTANCE_PROFILE": true,
      "POLICIES_ARN": ["arn:aws:iam::aws:policy/AmazonS3FullAccess","arn:aws:iam::aws:policy/AmazonECS_FullAccess","arn:aws:iam::aws:policy/CloudWatchFullAccess","arn:aws:iam::aws:policy/AWSCodePipelineFullAccess","arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess","arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess","arn:aws:iam::aws:policy/AmazonEC2FullAccess"],
      "STATEMENTS": [
        {
          "effect": "Allow",
          "actions": ["sts:AssumeRole"],
          "principals": {
            "type": "Service",
            "identifiers": ["ec2.amazonaws.com","codedeploy.amazonaws.com"]
          }
        }
      ],
      "PATH": "/"
    }
  ],
  "CodePipeline": [
    {
      "RESOURCE": "EC2",
      "CODE_PIPELINE_NAME": "EC2-Deployment-Pipeline",
      "CODE_PIPELINE_ROLE": "${IAM_Role[0].IAM_ROLE_ARN}",
      "ARTIFECT_BUCKET_NAME": "import ${VPC_ReQuest.S3[0].S3_BUCKET_NAME}",
      "KMS_ARN": "import ${VPC_ReQuest.KMS[0].KMS_KEY_ARN}",
      "SOURCE_ACTION": [
        {
          "name": "Source",
          "category": "Source",
          "owner": "ThirdParty",
          "provider": "GitHub",
          "version": 1,
          "output_artifacts": [ "SourceArtifact" ],
          "run_order": 1,
          "configuration": {
            "ConnectionArn": null,
            "FullRepositoryId": null,
            "RepositoryName": null,
            "BranchName": null,
            "S3Bucket": null,
            "S3ObjectKey": null,
            "Owner": "sikandarqaisarch",
            "Repo": "apache",
            "PollForSourceChanges": true,
            "Branch": "main",
            "OAuthToken": "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"
          }
        }
      ],
      "BUILD_PROJECT": [],
      "BUILD_APPROVAL": [],
      "BUILD_ACTION": [],
      "CODEDEPLOY_APPLICATION": [
        {
          "compute_platform": "Server",
          "name": "ec2Deploy"
        }
      ],
      "DEPLOYMENT_CONFIG": [
        {
          "deployment_config_name": "ec22Deploy",
          "minimum_healthy_hosts": [
            {
              "type": "HOST_COUNT",
              "value": 0
            }
          ]
        }       
      ],
      "DEPLOYMENT_GROUP": [
        {
          "app_name": "ec2Deploy",
          "deployment_group_name": "ec2Deploy",
          "service_role_arn": "${IAM_Role[1].IAM_ROLE_ARN}",
          "deployment_config_name": "ec22Deploy",
          "ec2_tag_filter": [
            {
              "key": "Name",
              "type": "KEY_AND_VALUE",
              "value": "ec2-template-Instance"
            }
          ],
          "auto_rollback_configuration": [
              {
                  "enabled": false,
                  "events": ["DEPLOYMENT_FAILURE"]
                }                    
          ],
          "alarm_configuration": []
        }   
      ],
      "DEPLOY_APPROVAL": [],
      "DEPLOY_ACTION": [
        {
          "name": "Deploy",
          "action": {
            "name": "Deploy",
            "category": "Deploy",
            "owner": "AWS",
            "provider": "CodeDeploy",
            "input_artifacts": [ "SourceArtifact" ],
            "version": 1,
            "region": "us-east-1",
            "configuration": {
              "ApplicationName": "ec2Deploy",
              "DeploymentGroupName": "ec2Deploy",
              "ClusterName": null,
              "ServiceName": null,
              "FileName": null
            }
          }
        }
      ],
      "TAGS": {
        "Creator": "ltscale-Tool-ec2"
    }
    }
  ]

}

```
