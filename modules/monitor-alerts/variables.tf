variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "action_group_name" {
  type = string
}

variable "email_address" {
  type = string
}

variable "vm_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "resource_group_id" {
  description = "Azure resource ID of the resource group to monitor"
  type        = string
}