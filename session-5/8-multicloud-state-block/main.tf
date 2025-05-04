terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "hjcc-rg-terraform-remote-state"
    storage_account_name = "hjccstgacctfstate"
    container_name       = "hjcc-stg-cont"
    key                  = "terraform/8-state-lock/terraform.tfstate"
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
