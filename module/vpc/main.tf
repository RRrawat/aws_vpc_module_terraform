provider "aws" {
  region     = var.region 
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../modules/vpc"

  name = var.name
  cidr = var.cidr
  s3_bucket_name = var.s3_bucket_name
  Object_key_path = var.Object_key_path
  block_public_access = var.block_public_access
  # region = var.region

  azs                 = var.azs
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets

  # manage_default_route_table = true
  # default_route_table_tags   = { DefaultRouteTable = true }

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  #public nacl
  public_inbound_acl_rules = var.public_inbound_acl_rules
  public_outbound_acl_rules = var.public_outbound_acl_rules

  #private nacl
  private_inbound_acl_rules = var.private_inbound_acl_rules
  private_outbound_acl_rules = var.private_outbound_acl_rules


  # Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  stack = var.stack
  enviroment = var.enviroment
  additional_tags = var.additional_tags
}

