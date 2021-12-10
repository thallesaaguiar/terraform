locals {
  ip_filepatch = "ips.json"

  common_tags = {
    Name        = "My bucket"
    Environment = var.environment
    Managedby   = "Terraform"
    Owner       = "Thalles"
  }
}
