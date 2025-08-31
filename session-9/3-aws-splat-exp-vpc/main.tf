terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
  backend "s3" {
    bucket  = "hilton-tf-state"
    key     = "terraform/session-9/3-aws-splat-exp-vpc/terraform.tfstate"
    region  = "us-east-1"
    profile = "curso-terraform"
  }
}

provider "aws" {
  region  = var.region_aws
  profile = "curso-terraform"
  default_tags {
    tags = {
      curso      = "Terraform - Basico ao Avançado"
      managed-by = "Terraform"
    }
  }
}