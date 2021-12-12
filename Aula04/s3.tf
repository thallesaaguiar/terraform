resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags
}

resource "aws_s3_bucket" "manual" {
  bucket = "terraformthalles"

  tags = {
    data = "08/12/21"
    importador = "12/12/21"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_object" "this" {
  bucket = aws_s3_bucket.this.bucket
  key    = "config/${local.ip_filepatch}"
  source = local.ip_filepatch
  etag   = filemd5(local.ip_filepatch)
  content_type =  "application/json"

  tags = local.common_tags

}

resource "aws_s3_bucket_object" "random" {
  bucket = aws_s3_bucket.this.bucket
  key    = "config/${random_pet.bucket.id}.json"
  source = local.ip_filepatch
  etag   = filemd5(local.ip_filepatch)
  content_type =  "application/json"

  tags = local.common_tags

}