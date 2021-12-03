provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraformchecks3"
    key    = "remote_state/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state_lock_check"
  }
}

resource "null_resource" "s3check" {
  provisioner "local-exec" {
    command = "dir"
  }
}