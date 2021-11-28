variable "number" {
//  type = string
  default = 77
}

output "number" {
  value = var.number
}

variable "string" {
  default = "TF"
}

output "string" {
  value = var.string
}

variable "boolean" {
  default = true
}

output "boolean" {
  value = var.boolean
}

variable "list" {
  default = ["jenkins", 77, "chef", "100", "true"]
}

output "list" {
  value = var.list
}
output "first" {
  value = var.list[0]
}

variable "ITS" {
  default = {
     NAME = "improve"
     IN   = 7
     WHERE = "any"

  }
}

output "var_check" {
  value = var.ITS
}

output "MY_LUCKY_NU" {
  value = var.ITS["IN"]
}