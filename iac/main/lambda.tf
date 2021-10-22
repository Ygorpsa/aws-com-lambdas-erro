module "lambda_document_list" {
  for_each = local.functions
  source   = "terraform-aws-modules/lambda/aws"
  version  = "~> 2.0"

  function_name = "${var.project}-${var.env_name}-${each.key}" 
  description   = "My awesome lambda function"
  handler       = each.value.handler
  runtime       = "nodejs14.x"
  hash_extra    = each.key

  source_path = each.value.source_path
  kms_key_arn = aws_kms_key.lambda_environment.arn
  publish     = true

  allowed_triggers = {
    AllowExecutionFromAPIGateway = {
      service    = "apigateway"
      source_arn = "${module.api_gateway.apigatewayv2_api_execution_arn}/*/*/*"
    }
  }

  environment_variables = each.value.environment_variables
  tags = var.tags
}

// script do lambda a parte

data "archive_file" "toctoc_api_artefact" {
output_path = "files/toctoc-api-artefact.zip"
type = "zip"
source_file = "${local.lambdas_path}/toctoc-api/index.js" 
}


resource "aws_lambda_function" "toctoc_api" {
    function_name = "toctoc_api"
    handler = "index.handler"
    role = aws_iam_role.toctoc_api_lambda.arn
    runtime = "nodejs14.x"  

    filename = data.archive_file.toctoc_api_artefact.output_path
    source_code_hash = data.archive_file.toctoc_api_artefact.output_base64sha256 #assim o terraform vai saber quando o arquivo foi atualizado e enviar uma nova versão pra aws quando modificarem a API

    timeout     = 5
    memory_size = 128 

    layers = ["aws_lambda_layer_version.got.policy_arn"]

    tags = local.common_tags
}
