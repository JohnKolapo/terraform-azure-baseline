variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "rg-bumima-dev"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "client_id" {
  type        = string
  description = "Azure client ID"
}

variable "client_secret" {
  type        = string
  description = "Azure client secret"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}

