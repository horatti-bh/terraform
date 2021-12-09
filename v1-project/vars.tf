variable "GIT_USER" {}
variable "GIT_PASS" {}
variable "SSH_USER" {}
variable "SSH_PASS" {}
variable "COMPONENTS" {
  default = [ "frontend", "dispatch", "payment", "ratings". "shipping", "user","catalogue","cart","rabbitmq","mysql","redis","mongodb"]
}