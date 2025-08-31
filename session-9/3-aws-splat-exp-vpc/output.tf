output "id_subnet" {
  description = "value of subnets"
  value       = aws_subnet.subnet[*].id
}