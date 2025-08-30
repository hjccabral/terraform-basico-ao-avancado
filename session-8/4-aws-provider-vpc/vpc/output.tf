output "vpc_id_default" {
  description = "value of default id"
  value       = aws_vpc.default.id
}

output "vpc_id_provider_1" {
  description = "value of provider 1"
  value       = aws_vpc.provider_1.id
}

output "vpc_id_provider_2" {
  description = "value of provider 2"
  value       = aws_vpc.provider_2.id
}