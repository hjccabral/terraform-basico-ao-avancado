resource "azurerm_network_security_group" "security_group" {
  name                = "hjcc-nsg-1"
  location            = azurerm_resource_group.az-resource-group.location
  resource_group_name = azurerm_resource_group.az-resource-group.name
}

resource "azurerm_network_security_rule" "security_rule" {
  for_each = toset(local.nsg_ports)

  name                        = "Porta-${each.key}"
  priority                    = index(local.nsg_ports, each.key) + 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.key
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.security_group.name
  resource_group_name         = azurerm_resource_group.az-resource-group.name
}