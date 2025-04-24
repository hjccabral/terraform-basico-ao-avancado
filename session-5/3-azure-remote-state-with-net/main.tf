terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = var.resource_group_azure.name
    storage_account_name = var.storage_account_azure.name
    container_name       = var.storage_container_azure.name
    key                  = "terraform/3-azure-remote-state-with-net/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}