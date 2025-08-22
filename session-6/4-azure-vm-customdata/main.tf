terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "hjcc-rg-terraform-remote-state"
    storage_account_name = "hjccstgacctfstate"
    container_name       = "hjcc-stg-cont"
    key                  = "terraform/session6/4-azure-vm-customdata/terraform.tfstate"
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

data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name  = "hjcc-rg-terraform-remote-state"
    storage_account_name = "hjccstgacctfstate"
    container_name       = "hjcc-stg-cont"
    key                  = "terraform/3-azure-remote-state-with-net/terraform.tfstate"
  }
}


