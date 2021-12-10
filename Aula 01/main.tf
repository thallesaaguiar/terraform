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
  region  = "us-east-1" # Brasil -> us-east-1
  profile = "default"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket19091997"
  acl    = "private"


  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}