resource "azurerm_resource_group" "hjcc_resource_group" {
  for_each = var.location
  name     = "rg-${each.key}"
  location = each.value
  tags     = local.common_tags
}