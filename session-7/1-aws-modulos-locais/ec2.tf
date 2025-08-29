resource "aws_key_pair" "key-pair-hjcc-new" {
  key_name   = "hjcc-key-${var.environment}"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "vpc" {
  ami                         = "ami-0e449927258d45bc4"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key-pair-hjcc-new.key_name
  subnet_id                   = module.network.id_subnet_terraform
  vpc_security_group_ids      = [module.network.id_security_group_terraform]
  associate_public_ip_address = true
  tags = {
    Name = "hjcc-${var.environment}"
  }
}