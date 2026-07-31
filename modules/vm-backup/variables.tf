variable "vault_name" {
  description = "Name of the Recovery Services Vault"
  type        = string
}

variable "policy_name" {
  description = "Name of the VM backup policy"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the vault"
  type        = string
}

variable "location" {
  description = "Azure region for the vault"
  type        = string
}

variable "vm_ids" {
  description = "Map of VM names to Azure VM resource IDs"
  type        = map(string)
}

variable "tags" {
  description = "Tags applied to the Recovery Services Vault"
  type        = map(string)
}