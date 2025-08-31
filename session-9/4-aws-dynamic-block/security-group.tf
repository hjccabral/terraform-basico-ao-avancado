resource "aws_security_group" "security_group" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic from anywhere"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "vpc-terraform-hjcc-security-group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
}