resource "azurerm_network_interface" "network_interface" {
  name                = "az-nic-1"
  location            = azurerm_resource_group.az-resource-group.location
  resource_group_name = azurerm_resource_group.az-resource-group.name

  ip_configuration {
    name                          = "VM_Public_IP"
    subnet_id                     = data.terraform_remote_state.network.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  dns_servers = ["168.63.129.16"]
  tags        = local.common_tags
}