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
