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
