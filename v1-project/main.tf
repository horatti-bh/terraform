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
      "ansible-pull -i /tmp/hosts -U https://${var.GIT_USER}:${var.GIT_PASS}@github.com/horatti-bh/ansible-project.git setup.yml -t ${element(var.COMPONENTS, count.index)} -e RABBITMQ_HOST=rabbitmq.${var.DOMAIN_NAME} -e CATALOGUE_HOST=catalogue.${var.DOMAIN_NAME} -e MYSQL_HOST=mysql.${var.DOMAIN_NAME} -e USER_HOST=user.${var.DOMAIN_NAME} -e CART_HOST=cart.${var.DOMAIN_NAME} -e SHIPPING_HOST=shipping.${var.DOMAIN_NAME} -e PAYMENT_HOST=payment.${var.DOMAIN_NAME} -e RATINGS_HOST=ratings.${var.DOMAIN_NAME} -e REDIS_HOST=redis.${var.DOMAIN_NAME} -e MONGO_HOST=mongodb.${var.DOMAIN_NAME}"
    ]
  }
}

resource "aws_route53_record" "all" {
  count   = length(var.COMPONENTS)
  zone_id = "Z07536541ZG5UC6G7FHUC"
  name    = "${element(var.COMPONENTS, count.index)}.${var.DOMAIN_NAME}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.instance.*.private_ip, count.index )]
}