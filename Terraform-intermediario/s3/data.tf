data "terraform_remote_state" "server" {
  backend = "s3"

  config = {
    bucket = "tfstate-964629881076"
    key = "dev/03-data-sources-s3/terraform"
    region = var.aws_region
    profile = var.aws_profile
  }

}