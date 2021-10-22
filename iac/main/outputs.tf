output "layers" {
  value = [{
    got = {
      arn         = aws_lambda_layer_version.got.arn
      name        = aws_lambda_layer_version.got.layer_name
      version     = aws_lambda_layer_version.got.version
      description = aws_lambda_layer_version.got.description
      created_at  = aws_lambda_layer_version.got.created_date
    }
  }]
}

output "lambdas" {
  value = [{
    arn           = aws_lambda_function.toctoc_api.arn
    name          = aws_lambda_function.toctoc_api.function_name
    description   = aws_lambda_function.toctoc_api.description
    version       = aws_lambda_function.toctoc_api.version
    last_modified = aws_lambda_function.toctoc_api.last_modified
  }]
}
