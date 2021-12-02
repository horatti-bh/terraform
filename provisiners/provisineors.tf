variable "URL" {
  default = "gooooogle.com"
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "print Hello from ${var.URL} > C:/Users/DELL/Desktop/a"
  }
}