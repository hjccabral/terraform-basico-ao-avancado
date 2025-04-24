resource "azurerm_resource_group" "az-resource-group" {
  name     = var.resource_group_azure
  location = var.region_azure
  tags     = local.common_tags
}