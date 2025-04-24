output "id_subnet_terraform" {
  description = "value of subnet id"
  value = aws_subnet.subnet1.id
}

output "id_security_group_terraform" {
  description = "value of security group id"
  value = aws_security_group.security_group.id
}