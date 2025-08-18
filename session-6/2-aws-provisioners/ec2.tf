resource "aws_key_pair" "key-pair-hjcc" {
  key_name   = "hjcc-key-tf-course"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "vpc" {
  ami                         = "ami-0e449927258d45bc4"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key-pair-hjcc.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.id_subnet_terraform
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.id_security_group_terraform]
  associate_public_ip_address = true
  tags = {
    Name = "hjcc-ec2-instance"
  }
  
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo subnet_id ${data.terraform_remote_state.vpc.outputs.id_subnet_terraform} >> ~/subnet_ids.txt",
      "echo security_groups ${data.terraform_remote_state.vpc.outputs.id_security_group_terraform} >> ~/securitygroup_ids.txt"
    ]
  }

  provisioner "file" {
    source      = "./private_ips.txt"
    destination = "~/ips.txt"
  }

}
