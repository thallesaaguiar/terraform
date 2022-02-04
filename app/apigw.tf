resource "aws_api_gateway_rest_api" "cardapio" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "example"
      version = "1.0"
    }
    paths = {
      "/path1" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
    }
  })

  name = "cardapio"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "cardapio" {
  rest_api_id = aws_api_gateway_rest_api.cardapio.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.cardapio.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "cardapio" {
  deployment_id = aws_api_gateway_deployment.cardapio.id
  rest_api_id   = aws_api_gateway_rest_api.cardapio.id
  stage_name    = "cardapio"
}
