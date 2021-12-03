provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ec2frmtf" {
  name_regex       = "^CentOS"
  owners           = ["self"]
  most_recent =  true
}

output "AMI_ID" {
  value = "data.aws_ami.ec2frmtf.id"
}