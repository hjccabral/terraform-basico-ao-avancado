resource "azurerm_resource_group" "resource_group" {
  name     = "rg-vnet"
  location = var.region_azure

  tags = local.common_tags
}