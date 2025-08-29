resource "azurerm_network_interface" "network_interface" {
  name                = "az-nic-1-${var.environment}"
  location            = azurerm_resource_group.az-resource-group.location
  resource_group_name = azurerm_resource_group.az-resource-group.name

  ip_configuration {
    name                          = "VM_Public-IP-${var.environment}"
    subnet_id                     = module.network.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = local.common_tags
}