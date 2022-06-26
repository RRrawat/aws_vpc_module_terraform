provider "aws" {
  #access_key = "${var.AWS_ACCESS_KEY}
  #secret_key = "${var.AWS_SECRET_KEY}
  region     = "us-east-1"
}


resource "aws_vpc" "vpc_test" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true #gives you an internal host name

  tags      = {
    Name    = "${var.vpc_name}"
    Environment = "${var.vpc_environment}"
  
  }

}
