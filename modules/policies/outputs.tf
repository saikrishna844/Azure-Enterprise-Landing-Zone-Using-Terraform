output "allowed_locations_assignment_id" {
  value = azurerm_resource_group_policy_assignment.allowed_locations.id
}

output "allowed_vm_sizes_assignment_id" {
  value = azurerm_resource_group_policy_assignment.allowed_vm_sizes.id
}

output "require_project_tag_assignment_id" {
  value = azurerm_resource_group_policy_assignment.require_project_tag.id
}