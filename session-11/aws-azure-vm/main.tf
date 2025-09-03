terraform {
  required_version = ">= 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.11.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }

  backend "s3" {
    bucket  = "hilton-tf-state"
    key     = "terraform/session-11/aws-azure-vm/terraform.tfstate"
    region  = "us-east-1"
    profile = "curso-terraform"
  }

}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  default_tags {
    tags = {
      Owner       = "Hilton"
      Environment = "dev-pipeline"
      Project     = "terraform-aws-azure-vm"
      ManagedBy   = "Terraform"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = local.azure_credentials.client_id
  client_secret   = local.azure_credentials.client_secret
  tenant_id       = local.azure_credentials.tenant_id
  subscription_id = local.azure_credentials.subscription_id
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "hilton-tf-state"
    key     = "terraform/2-aws-remote-state/terraform.tfstate"
    region  = var.aws_region
    profile = var.aws_profile
  }
}

data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name  = "hjcc-rg-terraform-remote-state"
    storage_account_name = "hjccstgacctfstate"
    container_name       = "hjcc-stg-cont"
    key                  = "terraform/3-azure-remote-state-with-net/terraform.tfstate"
  }
}