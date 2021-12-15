terraform {
  required_version = "1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-964629881076"
    key = "dev/03-data-sources-s3/terraform"
    region = "us-east-1"
    profile = "default"

  }
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}