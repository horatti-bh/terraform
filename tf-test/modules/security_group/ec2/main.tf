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

#provider "aws" {
#  region = "us-east-1"
#}

data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "terraformchecks3"
    key    = "sg/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ec2" {
  ami = var.AMI
  instance_type = var.instance
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.sg]
  tags = {
    Name = "Ansible_Server"
  }
}

variable "AMI" {
}

variable "instance" {
}
