resource "azurerm_monitor_action_group" "this" {

  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = "alerts"

  email_receiver {
    name                    = "EnterpriseAdmin"
    email_address           = var.email_address
    use_common_alert_schema = true
  }

  tags = var.tags
}


resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = "High-CPU-Alert"
  resource_group_name = var.resource_group_name
  scopes              = var.vm_ids

  description = "Alert when average CPU exceeds 80 percent"
  severity    = 2
  enabled     = true

  frequency   = "PT5M"
  window_size = "PT5M"

  target_resource_type     = "Microsoft.Compute/virtualMachines"
  target_resource_location = var.location

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.this.id
  }

  tags = var.tags
}


resource "azurerm_monitor_activity_log_alert" "resource_group_delete" {
  name                = "Resource-Group-Deletion-Alert"
  resource_group_name = var.resource_group_name
  location            = "global"

  scopes      = [var.resource_group_id]
  description = "Notify administrators when the enterprise resource group is deleted."
  enabled     = true

  criteria {
    category       = "Administrative"
    operation_name = "Microsoft.Resources/subscriptions/resourceGroups/delete"
    status         = "Succeeded"
  }

  action {
    action_group_id = azurerm_monitor_action_group.this.id
  }

  tags = var.tags
}