resource "aws_key_pair" "key-pair-hjcc" {
  key_name   = "hjcc-key-novachave"
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

  lifecycle {
    // prevent_destroy = true
    replace_triggered_by = [ aws_s3_bucket.bucket ]
  }

}