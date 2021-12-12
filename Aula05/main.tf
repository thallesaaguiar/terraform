terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

data "aws_caller_identity" "current"{}

resource "aws_s3_bucket_object" "remote-state" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

 versioning {
   enabld = true
}
   tags = {

     description = "Stores terraform remote state files"
     ManagedBy = "terraform"
     Owner = "Thalles"
     CreatedAt = "12/12/2021"

   }
}



output "remote_state_bucket"{
  value = aws_s3_bucket.remote-state.bucket

}

output "remote_state_bucket_arn"{
  value = aws_s3_bucket.remote-state.bucket

}