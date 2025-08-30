resource "aws_subnet" "subnet1" {
  vpc_id     = module.vpc.vpc_id_default
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "vpc-terraform-hjcc-subnet"
  }
}

resource "aws_subnet" "brasil" {
  provider   = aws.brasil
  vpc_id     = module.vpc.vpc_id_provider_1
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "vpc-terraform-hjcc-subnet-brasil"
  }
}


resource "aws_subnet" "australia" {
  provider   = aws.australia
  vpc_id     = module.vpc.vpc_id_provider_2
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "vpc-terraform-hjcc-subnet-australia"
  }
}