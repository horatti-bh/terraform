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
  default = "true"
}

output "boolean" {
  value = var.boolean
}