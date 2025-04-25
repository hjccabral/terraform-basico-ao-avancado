output "ec2_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.vpc.public_ip
}