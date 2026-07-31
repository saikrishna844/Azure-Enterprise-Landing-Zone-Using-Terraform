output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}

output "storage_private_endpoint_id" {
  value = azurerm_private_endpoint.storage_blob.id
}

output "storage_private_ip_address" {
  value = azurerm_private_endpoint.storage_blob.private_service_connection[0].private_ip_address
}

output "key_vault_private_endpoint_id" {
  value = azurerm_private_endpoint.key_vault.id
}

output "key_vault_private_ip_address" {
  value = azurerm_private_endpoint.key_vault.private_service_connection[0].private_ip_address
}