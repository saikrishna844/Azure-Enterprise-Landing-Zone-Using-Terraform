output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

/* output "subnet_ids" {
  value = azurerm_subnet.this[*].id
} */

output "subnet_ids" {
  description = "Map of subnet names to subnet IDs"

  value = {
    for subnet in azurerm_subnet.this :
    subnet.name => subnet.id
  }
}
