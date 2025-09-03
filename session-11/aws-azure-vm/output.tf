output "azure_public_ip_vm_terraform" {
  description = "The public IP address of the Azure VM"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "aws_public_ip_vm_terraform" {
  description = "The public IP address of the AWS EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

