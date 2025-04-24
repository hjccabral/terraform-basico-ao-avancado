resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "vpc-terraform-hjcc-gateway"
  }
}