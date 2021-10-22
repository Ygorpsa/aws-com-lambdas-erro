resource "aws_kms_key" "lambda_environment" {
  description             = "Lambda environment"
  deletion_window_in_days = 10
}