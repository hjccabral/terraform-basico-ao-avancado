resource "aws_subnet" "subnet1" {
  count = terraform.workspace == "prod" ? 3 : 1
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "vpc-terraform-${terraform.workspace}-${count.index}"
  }
}