terraform {
  backend "s3" {
    bucket         = var.TFSTATE_BUCKET
    key            = "devSos/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = var.TFSTATE_LOCK_TABLE
  }
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  assume_role {
    role_arn    = var.TERRAFORM_ROLE
    external_id = var.EXTERNAL_ID
  }
  region = "us-east-2"
  default_tags {
    tags = {
      Terraform = "true"
    }
  }
}
