output "vm_ip" {
  description = "Public IP of the Azure VM"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}