variable "region" {
  default       = "us-east-1"
  description   = "AWS Region"
  type          = string
}

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}


#VPC Name

variable "vpc_name" {
  
}

variable "vpc_environment" {
  
}

variable "vpc-cidr" {
  default       = "10.0.0.0/16"
  description   = "VPC CIDR Block"
  type          = string
}
