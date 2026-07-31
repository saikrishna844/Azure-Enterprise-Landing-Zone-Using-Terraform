output "action_group_id" {

  value = azurerm_monitor_action_group.this.id

}

output "cpu_alert_id" {

  value = azurerm_monitor_metric_alert.cpu_alert.id

}

output "resource_group_delete_alert_id" {
  description = "ID of the Resource Group deletion Activity Log Alert"
  value       = azurerm_monitor_activity_log_alert.resource_group_delete.id
}
