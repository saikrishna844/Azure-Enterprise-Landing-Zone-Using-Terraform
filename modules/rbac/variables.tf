variable "key_vault_id" {
  description = "Scope of the Lab8 Key Vault"
  type        = string
}

variable "vm_principal_ids" {
  description = "Map of VM names to managed identity principal IDs"
  type        = map(string)
}