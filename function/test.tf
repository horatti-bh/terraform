variable "url" {
  default = "https://google.com/india/map"

}

locals {
  URL_SPLIT=split("/", var.url )
  LENGTH= length(local.URL_SPLIT)-1
}

output "url" {
  value = element(local.URL_SPLIT, local.LENGTH)
}