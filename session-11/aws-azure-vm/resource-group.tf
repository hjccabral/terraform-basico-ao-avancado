resource "azurerm_resource_group" "rg" {
  name     = "hjcc-rg-pipeline"
  location = var.azure_region

  tags = local.common_tags
}