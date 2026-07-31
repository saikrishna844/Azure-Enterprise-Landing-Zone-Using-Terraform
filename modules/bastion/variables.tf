variable "bastion_name" {
  description = "Name of the Azure Bastion host"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Bastion public IP"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "tags" {
  type = map(string)
}