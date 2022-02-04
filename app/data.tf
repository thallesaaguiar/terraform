terraform {
  backend "s3" {
    bucket = "thalles.aguiar"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}