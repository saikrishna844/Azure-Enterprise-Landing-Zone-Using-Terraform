resource "azurerm_recovery_services_vault" "this" {
  name                = var.vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku = "Standard"

  tags = var.tags
}

resource "azurerm_backup_policy_vm" "this" {
  name                = var.policy_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.this.name

  timezone = "India Standard Time"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }

  retention_weekly {
    count    = 4
    weekdays = ["Sunday"]
  }

  retention_monthly {
    count    = 3
    weekdays = ["Sunday"]
    weeks    = ["Last"]
  }
}

resource "azurerm_backup_protected_vm" "this" {
  for_each = var.vm_ids

  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.this.name

  source_vm_id     = each.value
  backup_policy_id = azurerm_backup_policy_vm.this.id
}