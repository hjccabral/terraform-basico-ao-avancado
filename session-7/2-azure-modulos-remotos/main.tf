terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "hjcc-rg-terraform-remote-state"
    storage_account_name = "hjccstgacctfstate"
    container_name       = "hjcc-stg-cont"
    key                  = "terraform/session-7/2-azure-modulos-remotos/terraform.tfstate"
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

module "network" {
  depends_on              = [azurerm_resource_group.az-resource-group]
  source                  = "Azure/network/azurerm"
  version                 = "5.3.0"
  resource_group_name     = var.resource_group_azure
  resource_group_location = var.region_azure
  use_for_each            = true
  subnet_names            = var.subnet_names
  tags                    = local.common_tags
  vnet_name               = var.vnet_name
}