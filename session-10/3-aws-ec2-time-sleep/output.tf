output "ec2_ip" {
  description = "Public IP of the EC2 instance 1"
  value       = aws_instance.vm_1.public_ip
}

output "ec2_ip_2" {
  description = "Public IP of the EC2 instance 2"
  value       = aws_instance.vm_2.public_ip
}