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

variable "MAP" {
  default = {
     NAME = "improve"
     IN   = 7
     WHERE = "any"

  }
}

output "var_check" {
  value = var.MAP
}

output "MY_LUCKY_NU" {
  value = var.MAP["IN"]
}

variable "empty_test" {}
output "testing_empty_var" {
  value = var.empty_test
}

#variable "image_id" {
#  type        = string
#  description = "The id of the machine image (AMI) to use for the server."
#
#  validation {
#    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
#    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
#  }
#}

variable "nu" {
  default = "06"
}

output "nnum" {
  value = "gk = ${var.nu}"
}
