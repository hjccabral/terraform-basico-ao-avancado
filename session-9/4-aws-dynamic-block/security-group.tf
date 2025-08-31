resource "aws_security_group" "security_group" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic from anywhere"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "vpc-terraform-hjcc-security-group"
  }

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  from_port         = 0
  to_port           = 0
}