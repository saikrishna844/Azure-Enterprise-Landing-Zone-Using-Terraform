output "recovery_services_vault_id" {
  description = "ID of the Recovery Services Vault"
  value       = azurerm_recovery_services_vault.this.id
}

output "recovery_services_vault_name" {
  description = "Name of the Recovery Services Vault"
  value       = azurerm_recovery_services_vault.this.name
}

output "backup_policy_id" {
  description = "ID of the VM backup policy"
  value       = azurerm_backup_policy_vm.this.id
}

output "protected_vm_ids" {
  description = "IDs of the VM backup protection resources"
  value = {
    for name, protected_vm in azurerm_backup_protected_vm.this :
    name => protected_vm.id
  }
}

