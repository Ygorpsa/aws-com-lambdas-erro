module "api_gateway" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  name          = "${var.project}-${var.env_name}-documents"
  description   = "My awesome document management microservice"
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  create_api_domain_name = false

  body = templatefile("${var.function_root}/../openapi.yaml", zipmap(
    [ for fn_name, fn_config in local.functions : "arn_${fn_name}" ],
    [ for fn_name, fn_config in local.functions : "arn:aws:lambda:us-east-1:${data.aws_caller_identity.current.account_id}:function:${var.project}-${var.env_name}-${fn_name}" ]))

  tags = var.tags
}

data "aws_caller_identity" "current" {}
