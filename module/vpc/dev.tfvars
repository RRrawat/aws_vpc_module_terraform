name = "xyz-vpc"
aws_profile = "default"
region = "us-east-1"
s3_bucket_name = "terraform-state-files9"
Object_key_path = "vpcstate/terraform.tfstate"
enable_versioning = true
s3_acl = "private"
# prevent_destroy = true
force_destroy = false
block_public_access = true
user_arn = "arn:aws:iam::133869124648:user/sudhir"
cidr = "10.0.0.0/16"
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnets = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
private_subnets = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
enable_dns_hostnames = true
enable_dns_support = true
enable_nat_gateway = true
single_nat_gateway = true

public_inbound_acl_rules = [ {
  rule_number = 100
  rule_action = "allow"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_block  = "0.0.0.0/0"
} ]
public_outbound_acl_rules = [ {
  rule_number = 100
  rule_action = "allow"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_block  = "0.0.0.0/0"
} ]
private_inbound_acl_rules = [ {
  rule_number = 100
  rule_action = "allow"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_block  = "0.0.0.0/0"
} ]
private_outbound_acl_rules = [ {
  rule_number = 100
  rule_action = "allow"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_block  = "0.0.0.0/0"
} ]
tags = {
    "env" = "dev"
}
