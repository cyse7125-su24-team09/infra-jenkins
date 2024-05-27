resource "aws_vpc" "custom-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name= "jenkins"
  }
}

resource "aws_subnet" "subnet-a" {
  vpc_id     = aws_vpc.custom-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "jenkins"
  }
}