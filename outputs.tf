output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = " ID of the Resource Group"
  value       = module.resource_group.resource_group_id
}

output "resource_group_location" {
  value = module.resource_group.location
}

output "vnet_name" {
  value = module.network.vnet_name
}

output "vnet_id" {
  description = "ID of the vnet"
  value       = module.network.vnet_id
}

output "subnet_ids" {
  description = "ID of the subnet"
  value       = module.network.subnet_ids
}

output "web_nsg_name" {
  value = module.web_nsg.name
}

output "web_nsg_id" {
  description = "ID of web-nsg"
  value       = module.web_nsg.id
}

output "app_nsg_id" {
  description = "ID of app-nsg"
  value       = module.app_nsg.id
}

output "db_nsg_id" {
  description = "ID of db-nsg"
  value       = module.db_nsg.id
}

output "web_route_table_name" {
  value = module.web_route_table.name
}

output "web_route_table_id" {
  description = "ID of web_route_table"
  value       = module.web_route_table.id
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  description = "ID of Storage Account"
  value       = module.storage_account.storage_account_id
}

output "primary_blob_endpoint" {
  value = module.storage_account.primary_blob_endpoint
}

output "key_vault_name" {
  value = module.key_vault.name
}

output "key_vault_uri" {
  value = module.key_vault.vault_uri
}

output "log_analytics_workspace_id" {
  value = module.monitoring.id
}

output "log_analytics_workspace_name" {
  value = module.monitoring.name
}

output "web_vm_id" {
  value = module.web_vm.vm_id
}

output "app_vm_id" {
  value = module.app_vm.vm_id
}

output "db_vm_id" {
  value = module.db_vm.vm_id
}

output "recovery_services_vault_name" {
  value = module.vm_backup.recovery_services_vault_name
}

output "backup_policy_id" {
  value = module.vm_backup.backup_policy_id
}

output "monitor_action_group_id" {
  value = module.monitor_alerts.action_group_id
}

output "high_cpu_alert_id" {
  value = module.monitor_alerts.cpu_alert_id
}

output "resource_group_delete_alert_id" {
  value = module.monitor_alerts.resource_group_delete_alert_id
}

output "bastion_name" {
  value = module.bastion.bastion_name
}

output "bastion_id" {
  value = module.bastion.bastion_id
}

output "storage_private_ip_address" {
  value = module.private_endpoints.storage_private_ip_address
}

output "key_vault_private_ip_address" {
  value = module.private_endpoints.key_vault_private_ip_address
}

