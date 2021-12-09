provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "example" {
  most_recent = true
  name_regex = "^Cent"
  owners = [ "973714476881" ]
}

output "AMI_ID" {
  value = "data.aws_ami.example.id"
}