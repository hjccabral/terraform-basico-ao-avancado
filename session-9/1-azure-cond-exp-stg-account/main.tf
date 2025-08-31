terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
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