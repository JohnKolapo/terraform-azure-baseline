provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
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

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-bumima-dev"
    storage_account_name = "tfstatejohnkolapo" # FIXED THIS
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}


