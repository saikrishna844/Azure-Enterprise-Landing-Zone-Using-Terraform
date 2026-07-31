variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  default = "vnet-enterprise-dev"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_names" {
  default = [
    "subnet-web",
    "subnet-app",
    "subnet-db"
  ]
}

variable "subnet_prefixes" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

/* variable "admin_password" {
  description = "Administrator password for Windows VMs"
  type        = string
  sensitive   = true
} */

variable "enable_rbac_assignments" {
  description = "Create Azure role assignments when the deploying identity has RBAC administration permission"
  type        = bool
  default     = false
}

variable "enable_policy_assignments" {
  description = "Enable Azure Policy assignments in environments where permissions allow them"
  type        = bool
  default     = false
}

variable "admin_password" {
  description = "Administrator password for Windows virtual machines"
  type        = string
  sensitive   = true
}