# terraform { 
#   backend "s3" { 
#     encrypt        = true 
#     bucket         = "{BUCKET-NAME}" 
#     dynamodb_table = "{LOCKING-TABLE-NAME}"
#     region         = "{REGION}" 
#     key            = "{PATH}/VPC/terraform.tfstate" 
#     kms_key_id     = "{KMS_KEY_ARN}"
#   }
#   required_version = "~> 1.0"
# }

terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
}