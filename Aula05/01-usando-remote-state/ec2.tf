resource "aws_subnet" "my_subnet" {
  vpc_id            = "vpc-0c6e878a1d1e6cff7"
  cidr_block        = "172.31.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "sub-A"
  }
}

resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my_subnet.id


  tags = {
    Name = "Remote State"
    Env  = "dev"
  }
}
