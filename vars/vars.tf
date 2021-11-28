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
  default = ["jenkins", "ansible", "chef", "100", "true"]
}

output "list" {
  value = var.list
}