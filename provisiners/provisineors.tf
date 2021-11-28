variable "URL" {
  default = "google.com"
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "print Hello from ${var.URL} > C:/Users/DELL/Desktop/a"
  }
}