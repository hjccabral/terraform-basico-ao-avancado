terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
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

provider "azurerm" {
  features {}
  client_id       = local.azure_credentials.client_id
  client_secret   = local.azure_credentials.client_secret
  tenant_id       = local.azure_credentials.tenant_id
  subscription_id = local.azure_credentials.subscription_id
}

locals {
  azure_credentials = jsondecode(file("${path.module}/secrets/credentials.json"))
}