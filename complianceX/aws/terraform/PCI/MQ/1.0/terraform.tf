 
 terraform { 
    backend "s3" { 
     encrypt        = true 
     bucket         = "{BUCKET-NAME}" 
     dynamodb_table = "{LOCKING-TABLE-NAME}"
     region         = "{REGION}" 
     key            = "{PATH}/PIPE_LINE/terraform.tfstate" 
     kms_key_id     = "{KMS_KEY_ARN}"
   }
   required_version = "~> 0.14" 
   }

terraform {
  required_providers {
    aws = {
      version = "~> {AWS_PROVIDER}"
    }
  }
}