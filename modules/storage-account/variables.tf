variable "resource_group_name" {
  description = "Azure resource group where resources will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "storage_account_name" {
  description = "This is storage account name"
  type        = string
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "tags" {
  type = map(string)
}