data "azurerm_policy_definition" "allowed_locations" {
  display_name = "Allowed locations"
}

data "azurerm_policy_definition" "allowed_vm_sizes" {
  display_name = "Allowed virtual machine size SKUs"
}

data "azurerm_policy_definition" "require_tag" {
  display_name = "Require a tag on resources"
}

resource "azurerm_resource_group_policy_assignment" "allowed_locations" {
  name                 = "allowed-locations"
  display_name         = "Allowed Locations"
  description          = "Restrict resources to approved Azure regions."
  resource_group_id    = var.resource_group_id
  policy_definition_id = data.azurerm_policy_definition.allowed_locations.id

  parameters = jsonencode({
    listOfAllowedLocations = {
      value = var.allowed_locations
    }
  })

  non_compliance_message {
    content = "Resources must be deployed only in approved Azure regions."
  }
}

resource "azurerm_resource_group_policy_assignment" "allowed_vm_sizes" {
  name                 = "allowed-vm-skus"
  display_name         = "Allowed Virtual Machine Sizes"
  description          = "Restrict virtual machines to approved cost-conscious SKUs."
  resource_group_id    = var.resource_group_id
  policy_definition_id = data.azurerm_policy_definition.allowed_vm_sizes.id

  parameters = jsonencode({
    listOfAllowedSKUs = {
      value = var.allowed_vm_sizes
    }
  })

  non_compliance_message {
    content = "The selected VM size is not approved for this environment."
  }
}

resource "azurerm_resource_group_policy_assignment" "require_project_tag" {
  name                 = "require-project-tag"
  display_name         = "Require Project Tag"
  description          = "Require the Project tag on resources."
  resource_group_id    = var.resource_group_id
  policy_definition_id = data.azurerm_policy_definition.require_tag.id

  parameters = jsonencode({
    tagName = {
      value = var.required_tag_name
    }
  })

  non_compliance_message {
    content = "Resources must contain the required Project tag."
  }
}