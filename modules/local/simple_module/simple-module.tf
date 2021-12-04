resource "null_resource" "module_checking00" {
 provisioner "local-exec" {
   command = "dir"
 }
}
