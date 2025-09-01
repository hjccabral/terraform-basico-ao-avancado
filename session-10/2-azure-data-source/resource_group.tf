resource "azurerm_resource_group" "rg" {
  name     = "rg-datasource"
  location = "West Europe"

  tags = local.common_tags
}
