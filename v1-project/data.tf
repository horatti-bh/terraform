data "aws_ami" "instance" {
   name_regex  = "^Cent"
   most_recent = true
   owners      = ["973714476881"]
}
