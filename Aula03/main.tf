terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

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
  subnet_id   = aws_subnet.my_subnet.id

  tags = var.instance_tags
}