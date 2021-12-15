terraform {
  required_version = "1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}