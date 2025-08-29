output "id_subnet_0_terraform" {
  description = "value of subnet id 0"
  value       = aws_subnet.subnet[0].id
}

output "id_subnet_1_terraform" {
  description = "value of subnet id 1"
  value       = aws_subnet.subnet[1].id
}

output "id_subnet_2_terraform" {
  description = "value of subnet id 2"
  value       = aws_subnet.subnet[2].id
}