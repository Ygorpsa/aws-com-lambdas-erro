terraform {
  required_version = "1.0.6"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "3.59.0"
    }
  }
}

provider "aws" {
    region = var.aws_region
    profile = var.aws_profile
  
}
