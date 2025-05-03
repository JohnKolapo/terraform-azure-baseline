variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "client_id" {
  type        = string
  description = "Azure SP client ID"
}

variable "client_secret" {
  type        = string
  description = "Azure SP client secret"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources into"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "subnet_prefix" {
  description = "Address prefix for the Subnet"
  type        = list(string)
}
