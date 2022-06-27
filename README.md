# AWS VPC Terraform

In this, we will see how to run terraform vpc scripts with terraform commands

## Introduction
Terraform is an infrastructure as code (IaC) tool that allows you to build, change, and version infrastructure safely and efficiently.

## Prerequisites

Download terraform in your local computer [Click here](https://releases.hashicorp.com/terraform/1.0.9/)
- Set up the Environmet Variable PATH after downloading terraform 
- Check the terraform version
```console
$ terraform -v

```

## Steps to run terraform scripts

## 1. Clone the repository and change the directory

```console
$ git clone https://github.com/chaincodechd/fabric-terraform.git

$ cd fabric-terraform/aws/vpc-stack

```

## 2. To change input values
Default values for all required variables are given, if you want to change the input values,
Change the values in [test.tfvars](./test.tfvars) files

## 3. Run terraform init 
The terraform init command is used to initialize a working directory containing Terraform configuration files

```console
$ terraform init

```

## 4. Run terraform plan
The terraform plan command evaluates a Terraform configuration to determine the desired state of all the resources it declares, then compares that desired state to the real infrastructure objects being managed with the current working directory and workspace.

```console
$ terraform plan -var-file=test.tfvars

```
## 5. Run terraform apply
The terraform apply command executes the actions proposed in a Terraform plan. It will create all the resources proposed in Terraform plan.

```console
$ terraform apply -var-file=test.tfvars

```
after executing above command, a prompt will appear type yes
or 
if you don't want to type yes every time execute below

```console
$ terraform apply -var-file=test.tfvars -auto-approve

```
## 6. Run terraform destroy
The terraform destroy command terminates resources managed by your Terraform project. This command is the inverse of terraform apply in that it terminates all the resources specified in your Terraform state.

```console
$ terraform destroy -var-file=test.tfvars

```
after executing above command, a prompt will appear type yes
or 
if you don't want to type yes every time execute below

```console
$ terraform destroy -var-file=test.tfvars -auto-approve

```
## Note**

1. If force_destroy value is false then after running terraform destroy it throws error for s3 bucket (Error: bucket not empty) in that case you either you need to make force_destroy to true or manually delete the versions of object.

2. failed to upload state: KMS.NotFoundException: Alias
│ arn:aws:kms:us-east-1:133869124648:alias/terraform-bucket-key is not found.
Ignore the above error as kms key alias has been referred in [backend.tf](./backend.tf) configuration

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="name">name</a> | Name to be used on all resources as prefix. | `string` | `ccl` | yes |
| <a name="aws_profile">aws_profile</a> | Name of aws credential profile | `string` | `cclterraform` | yes |
| <a name="region">region</a> | The region where to deploy this code | `string` | `us-east-1` | yes |
| <a name="s3_bucket_name">s3_bucket_name</a> | Name of S3 bucket to store terraform state file | `string` | `terraform-state-files9` | yes |
| <a name="Object_key_path">Object_key_path</a> | S3 object key path for terraform state file | `string` | `vpcstate/terraform.tfstate` | yes |
| <a name="enable_versioning">enable_versioning</a> | Should be true to enable versioning in S3 bucket | `bool` | `true` | yes |
| <a name="s3_acl">s3_acl</a> | S3 bucket acl | `string` | `private` | yes |
| <a name="force_destroy">force_destroy</a> | Should be true to delete all versions in S3 bucket and bucket too which has been created for terraform state file  | `bool` | `false` | yes |
| <a name="block_public_access">block_public_access</a> | enable block public access to s3 bucket  | `bool` | `true` | yes |
| <a name="user_arn">user_arn</a> | user arn to access to kms keys. | `string` | `arn:aws:iam::133869124648:user/sudhir` | yes |
| <a name="cidr">cidr</a> | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden. | `string` | `10.0.0.0/16` | yes |
| <a name="azs">azs</a> | Name to be used on all resources as prefix. | `list(string)` | `["us-east-1a", "us-east-1b", "us-east-1c"]` | yes |
| <a name="public_subnets">public_subnets</a> | Name to be used on all resources as prefix. | `list(string)` | `["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]` | yes |
| <a name="private_subnets">private_subnets</a> | Name to be used on all resources as prefix. | `list(string)` | `["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]` | yes |
| <a name="enable_dns_hostnames">enable_dns_hostnames</a> | Should be true to enable DNS hostnames in the VPC | `bool` | `true` | yes |
| <a name="enable_dns_support">enable_dns_support</a> | Should be true to enable DNS support in the VPC | `bool` | `true` | yes |
| <a name="enable_nat_gateway">enable_nat_gateway</a> | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `true` | yes |
| <a name="single_nat_gateway">single_nat_gateway</a> | Should be true if you want to provision a single shared NAT Gateway across all of your private networks | `bool` | `true` | yes |
| <a name="public_inbound_acl_rules">public_inbound_acl_rules</a> | Public subnets inbound network ACLs | `list(map(string))` | `cidr_block  = "0.0.0.0/0"` | no |
| <a name="public_outbound_acl_rules">public_outbound_acl_rules</a> | Public subnets outbound network ACLs | `list(map(string))` | `cidr_block  = "0.0.0.0/0"` | no |
| <a name="private_inbound_acl_rules">private_inbound_acl_rules</a> | Private subnets inbound network ACLs | `list(map(string))` | `cidr_block  = "0.0.0.0/0"` | no |
| <a name="private_outbound_acl_rules">private_outbound_acl_rules</a> | Private subnets outbound network ACLs | `list(map(string))` | `cidr_block  = "0.0.0.0/0"` | no |
|<a name="tags">tags</a> | Name to be used on all resources as prefix. | `map(string)` | `{"env" = "dev"}` | yes |
