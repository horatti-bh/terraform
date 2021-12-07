provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "terraformchecks3"
    key    = "sg/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_state_lock_check"
  }
}


resource "aws_security_group" "allow_ssh-public" {
  name        = "allow_ssh-public"
  description = "allow_ssh-public"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

tags = {
  Name = "allow_ssh-public"
}
}

output "sg" {
  value = aws_security_group.allow_ssh-public.id
}