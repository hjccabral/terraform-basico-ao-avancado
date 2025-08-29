resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "vpc-${var.environment}"
  }
}