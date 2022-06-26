################################################################################
# VPC
################################################################################
resource "aws_vpc" "this" {
  count = var.create_vpc ? 1 : 0

  cidr_block                       = var.cidr
  instance_tenancy                 = var.instance_tenancy
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support

  tags = module.tags.commontags
}


#comman tags
module "tags" {
    source = "../../../common/common_tags"

    stack = var.stack
    name = var.name
    enviroment = var.enviroment
    additional_tags = var.additional_tags
}
