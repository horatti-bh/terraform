module "simple_module1" {
  source = "./simple_module"
}

module "remote_check" {
  source = "./remote_check"
}

#variable "git_user" {}
#variable "git_pass" {}