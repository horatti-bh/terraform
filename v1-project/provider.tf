provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraformchecks3"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state_lock_check"
  }
}

