# Configure the Terraform runtime requirements.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # Azure Resource Manager provider and version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

variable "labelPrefix" {
  type        = string
  description = "Your college username. This will form the beginning of various resource names."
}

variable "region" {
  default = "westus3"
  type    = string
}


#resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.labelPrefix}-githubactions-rg"
  location = var.region
}

resource "azurerm_storage_account" "storageacconut" {
  name                     = "${var.labelPrefix}githubactions"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}