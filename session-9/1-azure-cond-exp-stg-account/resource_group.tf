resource "azurerm_resource_group" "hjcc_resource_group" {
  name     = "rg-${var.environment}"
  location = "East US"
  tags     = local.common_tags
}