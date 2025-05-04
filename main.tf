provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Fetch the existing resource group (do NOT recreate)
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
}

output "vnet_subnet_id" {
  value = module.vnet.vnet_subnet_id
}

terraform {
  backend "azurerm" {}
}
