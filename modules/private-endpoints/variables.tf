variable "resource_group_name" {
  description = "Resource group where private endpoint resources are created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the existing virtual network"
  type        = string
}

variable "virtual_network_id" {
  description = "ID of the existing virtual network"
  type        = string
}

variable "storage_account_id" {
  description = "ID of the Storage Account"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}

