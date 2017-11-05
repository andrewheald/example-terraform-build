provider "aws" {}

terraform {
  backend "s3" {
    bucket = "terraform-state"
    key = "build/terraform.tfstate"
    encrypt = true
    dynamodb_table = "terraform-state"
  }
}

data "aws_region" "region" {
  current = true
}

variable "tags" {
  description = "Default tags for all resources"
  type = "map"
  default = {
    Name = "build"
    ConfigurationManagement = "Terraform"
    Environment = "build"
    CostAllocation = "DevOps"
  }
}
