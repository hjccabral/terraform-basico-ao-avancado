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
    key     = "terraform/session-8/4-aws-provider-vpc/terraform.tfstate"
    region  = "us-east-1"
    profile = "curso-terraform"
  }
}

provider "aws" {
  alias   = "australia"
  region  = "ap-southeast-2"
  profile = "curso-terraform"
  default_tags {
    tags = {
      curso      = "Terraform - Basico ao Avançado"
      managed-by = "Terraform"
    }
  }
}

provider "aws" {
  alias   = "brasil"
  region  = "sa-east-1"
  profile = "curso-terraform"
  default_tags {
    tags = {
      curso      = "Terraform - Basico ao Avançado"
      managed-by = "Terraform"
    }
  }
}

module "vpc" {
  providers = {
    aws.provider_1 = aws.brasil
    aws.provider_2 = aws.australia
  }
  source = "./vpc"

}