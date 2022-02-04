output "s3_bucket_id" {
  value       = aws_s3_bucket.my_bucket.id
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.my_bucket.arn
}


output "api_id" {
  value = aws_api_gateway_rest_api.cardapio.id
}
output "stage_name" {
value = aws_api_gateway_stage.cardapio.stage_name
}
