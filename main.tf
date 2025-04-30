provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "vnet-bumima-dev"
  address_space       = "10.0.0.0/16"
  subnet_name         = "subnet-core"
  subnet_prefix       = "10.0.1.0/24"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

