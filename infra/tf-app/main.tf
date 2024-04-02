resource "azurerm_resource_group" "a12_rg" {
  name     = "${var.label_prefix}-a12-rg"
  location = var.region
}

# Define Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.label_prefix}vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.a12_rg.location
  resource_group_name = azurerm_resource_group.a12_rg.name
}

# Define Subnet within the Virtual Network
resource "azurerm_subnet" "subnet" {
  name                 = "${var.label_prefix}subnet"
  resource_group_name  = azurerm_resource_group.a12_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}