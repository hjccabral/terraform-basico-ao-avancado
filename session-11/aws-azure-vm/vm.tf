resource "azurerm_public_ip" "public_ip" {
  name                = "public_ip_vm_terraform"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azure_region
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

resource "azurerm_network_interface" "nic" {
  name                = "vm-terraform-nic"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "nic-configuration"
    subnet_id                     = data.terraform_remote_state.vpc.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.nic
  network_security_group_id = data.terraform_remote_state.network.outputs.network_security_group.id
}