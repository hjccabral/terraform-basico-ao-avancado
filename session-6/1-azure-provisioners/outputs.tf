output "vm_ip" {
  description = "Public IP of the Azure VM"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "subnet_id" {
  value       = data.terraform_remote_state.network.outputs.subnet_id
  description = "Subnet ID from the remote state"
}

output "network_security_group_id" {
  value       = data.terraform_remote_state.network.outputs.network_security_group_id
  description = "Network Security Group ID from the remote state"
}