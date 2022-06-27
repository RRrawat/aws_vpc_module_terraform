terraform {
  backend "s3" {
    profile = "default"
    bucket = "terraform-state-files9"
    key    = "vpcstate/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state"
  }
}
