data "azurerm_network_security_group" "nsg" {
  name                = azurerm_network_security_group.security_group.name
  resource_group_name = var.resource_group_azure
}