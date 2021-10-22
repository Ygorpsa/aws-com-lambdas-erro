variable "function_root" {
  type = string
}

variable "db_dbname" {
  type = string
}

variable "db_username" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "env_name" {
  type = string
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}
variable "aws_profile" {
  type = string
  default = "ft014"
}

