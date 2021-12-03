provider "aws" {
  region = "us-east-1"
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
