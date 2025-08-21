terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
  backend "s3" {
    bucket                  = "hilton-tf-state"
    key                     = "terraform/session-6/3-aws-user-data/terraform.tfstate"
    region                  = "us-east-1"
    profile                 = "curso-terraform"
    shared_credentials_file = "./secrets/credentials"
  }
}

provider "aws" {
  region                   = var.region_aws
  shared_credentials_files = ["${path.module}/secrets/credentials"]
  profile                  = "curso-terraform"
  default_tags {
    tags = {
      curso      = "Terraform - Basico ao Avançado"
      managed-by = "Terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket                  = "hilton-tf-state"
    key                     = "terraform/2-aws-remote-state/terraform.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "./secrets/credentials"
    profile                 = "curso-terraform"
  }
}
