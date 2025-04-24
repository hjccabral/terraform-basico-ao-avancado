output "subnet_id" {
  description = "value of subnet id"
  value       = azurerm_subnet.subnet1.id
}

output "network_security_group_id" {
  description = "value of network security group id"
  value       = azurerm_network_security_group.network_security_group.id
}