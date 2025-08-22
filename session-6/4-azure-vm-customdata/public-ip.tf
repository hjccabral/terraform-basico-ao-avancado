resource "azurerm_public_ip" "public_ip" {
  name                = "VM_Public_IP"
  resource_group_name = azurerm_resource_group.az-resource-group.name
  location            = azurerm_resource_group.az-resource-group.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = local.common_tags
}