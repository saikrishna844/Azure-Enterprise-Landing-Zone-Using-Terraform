variable "resource_group_name" {
  description = "Azure Resource Group where resources will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "nsg_name" {
  description = "Azure resources nsg-name"
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "security_rules" {
  description = "NSG security rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

