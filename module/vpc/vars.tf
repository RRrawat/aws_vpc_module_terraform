variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "ccl"
}

variable "s3_bucket_name" {
  description = "Name of S3 bucket"
  default     = ""
}

variable "Object_key_path" {
  description = "S3 object key path"
  default     = ""
}

variable "enable_versioning" {
  description = "Should be true to enable versioning in S3 bucket "
  type = bool
}

variable "user_arn" {
  description = "user arn to access to kms keys"
  default     = ""
}

variable "s3_acl" {
  description = "Enter S3 bucket acl"
  default = ""
}

variable "force_destroy" {
  description = "Should be true to delete all versions in S3 bucket "
  type = bool
}

variable "region" {
  description = "The region where to deploy this code (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Name of aws credential profile"
  default     = ""
}
variable "block_public_access" {
  description = "enable block public access to s3 bucket"
  default     = ""
}

# variable "region" {
#   description = "The region where to deploy this code (e.g. us-east-1)."
#   default     = "us-east-1"
# }

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = ""
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "default_route_table_tags" {
  description = "Additional tags for the default route table"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "public_inbound_acl_rules" {
  description = "Public subnets inbound network ACLs"
  type        = list(map(string))

  default = [{}]
}

variable "public_outbound_acl_rules" {
  description = "Public subnets outbound network ACLs"
  type        = list(map(string))

  default = [{}]
}

variable "private_inbound_acl_rules" {
  description = "Private subnets inbound network ACLs"
  type        = list(map(string))

  default =[{}]
}

variable "private_outbound_acl_rules" {
  description = "Private subnets outbound network ACLs"
  type        = list(map(string))

  default = [{}]
}

/**********************************************************
* Common tags variable 
*************************************************************/

/*
variable "name" {
	type = string
	description = "Name of the provider resource"
}*/
variable "stack" {
    type = string
	description	= "Provide resource stack"
}

variable "enviroment" {
    type = string
	description	= "Provide environment (DEV/TEST/PRD)"
}

variable "additional_tags"{
	type = map(string)
	default = null
	description = "If user wants to add any other additional tags to resource"
}
