data "aws_ami" "instance" {
   name_regex  = "^Cent"
   most_recent = true
   owners      = ["self"]
}
