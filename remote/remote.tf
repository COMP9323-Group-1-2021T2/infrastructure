# This is the provider version we're using for this deployment
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

# This is the aws profile and aws region we're using for this deployment
provider "aws" {
  profile = "comp9323"
  region  = "ap-southeast-2"
}

# This is where we store our shared terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "comp9323-terraform-up-and-running-state"
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# This is where we store our shared terraform lock
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "comp9323-terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
