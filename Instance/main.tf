provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "terraformchecks3"
    key    = "ec/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state_lock_check"
  }
}

resource "aws_instance" "ec2frmtf" {
  ami = var.AMI
  instance_type = var.instance
  tags = {
    Name = "Ansible_Server"
  }
}

variable "AMI" {
}

variable "instance" {
}