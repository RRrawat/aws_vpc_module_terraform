provider "aws" {
  region = "us-east-1"
  AWS_ACCESS_KEY = var.AWS_ACCESS_KEY
  AWS_SECRET_KEY = var.AWS_SECRET_KEY
}

resource "aws_vpc" "vpc_test" {
  cidr_block              = "10.0.0.0/16"
}
