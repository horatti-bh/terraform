resource "null_resource" "sample1" {
  provisioner "local-exec" {
    command= "print URL = ${var.URL}"
  }
}

variable "URL" {}