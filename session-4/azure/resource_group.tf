resource "azurerm_resource_group" "hjcc_resource_group" {
  name     = var.hjcc_resource_group_name
  location = "East US"
  tags     = local.common_tags
}