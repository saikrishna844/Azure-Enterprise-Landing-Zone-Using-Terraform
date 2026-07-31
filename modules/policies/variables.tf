variable "resource_group_id" {
  description = "Resource group scope for the policy assignments"
  type        = string
}

variable "allowed_locations" {
  description = "Azure regions permitted in the project resource group"
  type        = list(string)
}

variable "allowed_vm_sizes" {
  description = "Virtual machine SKUs permitted by policy"
  type        = list(string)
}

variable "required_tag_name" {
  description = "Tag name required on resources"
  type        = string
}