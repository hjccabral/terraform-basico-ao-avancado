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
    subnet_id                     = data.terraform_remote_state.network.outputs.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = local.common_tags

}

resource "azurerm_network_interface_security_group_association" "nsga" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = data.terraform_remote_state.network.outputs.network_security_group_id
}


resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-ubuntu"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azure_region
  size                = "Standard_B1s"
  admin_username      = "admtf"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "admtf"
    public_key = var.azure_pub_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = local.common_tags
}