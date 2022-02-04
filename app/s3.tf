resource "aws_s3_bucket" "my_bucket" {
  bucket = "thalles.aguiar"
  acl    = "private"


  tags = {
    Name        = "My bucket"
    Environment = "DEV"
    Managedby   = "Terraform"
  }
}