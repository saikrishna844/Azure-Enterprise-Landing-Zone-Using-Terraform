output "vm_key_vault_role_assignment_ids" {
  description = "Role assignment IDs for VM managed identities"
  value = {
    for name, assignment in azurerm_role_assignment.vm_key_vault_secrets_user :
    name => assignment.id
  }
}  