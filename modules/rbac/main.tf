resource "azurerm_role_assignment" "vm_key_vault_secrets_user" {
  for_each = var.vm_principal_ids

  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = each.value
}