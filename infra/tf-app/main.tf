variable "labelPrefix" {
  type        = string
  description = "Your college username. This will form the beginning of various resource names."
}

variable "region" {
  default = "westus3"
  type    = string
}


resource "azurerm_resource_group" "a12-rg" {
  name     = "${var.labelPrefix}-a12-rg"
  location = var.region
}