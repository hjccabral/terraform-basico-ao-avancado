resource "azurerm_network_security_group" "security_group" {
  name                = "hjcc-nsg-1-${var.environment}"
  location            = azurerm_resource_group.az-resource-group.location
  resource_group_name = azurerm_resource_group.az-resource-group.name

  security_rule {
    name                       = "Rule01-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Regra de saída para internet
  security_rule {
    name                       = "Allow-Internet-Outbound"
    priority                   = 200
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "Internet"
  }

  tags = local.common_tags
}

resource "azurerm_subnet_network_security_group_association" "snsga" {
  subnet_id                 = module.network.vnet_subnets[0]
  network_security_group_id = azurerm_network_security_group.security_group.id
}