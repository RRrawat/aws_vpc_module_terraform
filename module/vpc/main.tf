provider "aws" {
  region     = var.region 
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
