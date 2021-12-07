resource "aws_instance" "instance" {
  count                  = 1
  ami                    = data.aws_ami.instance.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-08eee104cf5e5f8fd"]
  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = var.SSH_USER
      password = var.SSH_PASS
    }
    inline = [
      "sudo yum install git"]
  }
}