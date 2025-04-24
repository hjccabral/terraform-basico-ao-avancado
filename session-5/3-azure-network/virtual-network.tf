resource "azurerm_network_security_group" "network_security_group" {
  name                = "network_seurity_group"
  location            = azurerm_resource_group.az-resource-group.location
  resource_group_name = azurerm_resource_group.az-resource-group.name
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "virtual_network"
  location            = azurerm_resource_group.az-resource-group.location
  resource_group_name = azurerm_resource_group.az-resource-group.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = local.common_tags
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.az-resource-group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]
}