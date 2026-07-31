output "vm_id" {
  value = azurerm_windows_virtual_machine.this.id
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.this.name
}

output "nic_id" {
  value = azurerm_network_interface.this.id
}

output "principal_id" {
  description = "Object ID of the VM system-assigned managed identity"
  value       = azurerm_windows_virtual_machine.this.identity[0].principal_id
}