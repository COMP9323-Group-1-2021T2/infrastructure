terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    bucket         = "comp9323-terraform-up-and-running-state"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-southeast-2"
    profile        = "comp9323"
    dynamodb_table = "comp9323-terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
