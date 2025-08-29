
resource "azurerm_linux_virtual_machine" "vm" {
  depends_on            = [azurerm_subnet_network_security_group_association.snsga]
  name                  = "vm-tf-hjcc-${var.environment}"
  resource_group_name   = azurerm_resource_group.az-resource-group.name
  location              = azurerm_resource_group.az-resource-group.location
  size                  = "Standard_B1s"
  admin_username        = "admtf"
  network_interface_ids = [azurerm_network_interface.network_interface.id]

  admin_ssh_key {
    username   = "admtf"
    public_key = file("~/.ssh/id_rsa.pub")
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