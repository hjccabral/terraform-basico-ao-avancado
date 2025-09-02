resource "terraform_data" "variable_trigger" {
  input = var.infra_version
}





resource "terraform_data" "data" {
  triggers_replace = [
    azurerm_storage_account.sa-hjcc.id,
    azurerm_linux_virtual_machine.vm.id
  ]

  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.vm.public_ip_address
    user        = "admtf"
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "echo \"Storage Account Key: ${azurerm_storage_account.sa-hjcc.primary_access_key}\" >> /tmp/sa_hjcc.txt"
    ]
  }
}

resource "null_resource" "null" {
  triggers = {
    storage_account = azurerm_storage_account.sa-hjcc.id,
    virtual_machine = azurerm_linux_virtual_machine.vm.id
  }

  connection {
    type        = "ssh"
    host        = azurerm_linux_virtual_machine.vm.public_ip_address
    user        = "admtf"
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "echo \"Storage Connection String: ${azurerm_storage_account.sa-hjcc.primary_connection_string}\" >> /tmp/sa_cs_hjcc.txt"
    ]
  }
}