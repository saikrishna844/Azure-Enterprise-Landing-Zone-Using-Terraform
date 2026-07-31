output "bastion_id" {
  value = azurerm_bastion_host.this.id
}

output "bastion_name" {
  value = azurerm_bastion_host.this.name
}

output "bastion_subnet_id" {
  value = azurerm_subnet.bastion.id
}

output "bastion_public_ip_id" {
  value = azurerm_public_ip.bastion.id
}