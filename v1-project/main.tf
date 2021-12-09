resource "aws_instance" "instance" {
  count                  = length(var.COMPONENTS)
  ami                    = data.aws_ami.instance.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-08eee104cf5e5f8fd"]
  iam_instance_profile   = "ec2-s3-admin-access-role"
  tags                   = {
     Name                = element(var.COMPONENTS, count.index)
  }
  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = var.SSH_USER
      password = var.SSH_PASS
    }
    inline = [
      "sudo yum install ansible -y",
      "echo localhost >/tmp/hosts",
       "ansible-pull -i /tmp/hosts -U https://${var.GIT_USER}:${var.GIT_PASS}@github.com/horatti-bh/ansible-project.git setup.yml -t ${element(var.COMPONENTS, count.index)}"
    ]
  }
}