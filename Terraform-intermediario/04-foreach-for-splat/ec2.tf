data "aws_ami" "linux" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "linux"
}

resource "aws_instance" "this" {
  for_each = {
    web = {
      name = "Web server"
      type = "t2.micro"
    }

    ci_cd = {
      name = "CI/CD server"
      type = "t2.small"
    }
  }
  ami           = data.aws_ami.linux.id
  instance_type = lookup(each.value, "type", null)
  subnet_id     = aws_subnet.my_subnet.id

  tags = {
    Project = "Curso AWS com Terraform"
    Name    = "${each.key}: ${lookup(each.value, "type", null)}"
    Lesson  = "Forecah , For, Splat"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = "vpc-0c6e878a1d1e6cff7"
  cidr_block        = "172.31.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "sub-A"
  }
}
