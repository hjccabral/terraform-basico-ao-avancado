resource "aws_key_pair" "ssh_key" {
  key_name   = "pub_key"
  public_key = var.aws_pub_key
}

resource "aws_instance" "ec2_instance" {
  ami                         = "ami-0e449927258d45bc4"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ssh_key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.id_subnet_terraform
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.id_security_group_terraform]
  associate_public_ip_address = true

  tags = {
    Name = "ec2-instance-pipeline"
  }
}