variable "resource_group_name" {
  description = "Azure resource group where resources will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "route_table_name" {
  description = "Route Table were Routing will happend from one subnet to other or one vnet to other or vnet to internet"
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "routes" {
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
}