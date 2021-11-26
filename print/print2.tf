output "instance_ips" {
  value = aws_instance.web.*.public_ip
}

output "lb_address" {
  value = aws_alb.web.public_dns
}
