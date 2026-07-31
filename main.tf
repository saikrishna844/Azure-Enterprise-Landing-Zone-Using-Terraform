module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.common_tags
}

module "network" {

  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  vnet_name       = var.vnet_name
  address_space   = var.address_space
  subnet_names    = var.subnet_names
  subnet_prefixes = var.subnet_prefixes

  tags = local.common_tags
}

module "web_nsg" {

  source = "./modules/network-security-group"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  nsg_name = "nsg-web"

  tags = local.common_tags

  security_rules = [
    {
      name                       = "Allow-HTTP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-HTTPS"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

module "app_nsg" {

  source = "./modules/network-security-group"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  nsg_name = "nsg-app"

  tags = local.common_tags

  security_rules = [
    {
      name                       = "Allow-RDP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

module "db_nsg" {

  source = "./modules/network-security-group"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  nsg_name = "nsg-db"

  tags = local.common_tags

  security_rules = [
    {
      name                       = "Allow-SQL"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "1433"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

/*source "azurerm_subnet_network_security_group_association" "web" {

  subnet_id = module.network.subnet_ids["subnet-web"]

  network_security_group_id = module.web_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "app" {

  subnet_id = module.network.subnet_ids["subnet-app"] 

  network_security_group_id = module.app_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "db" {

  subnet_id = module.network.subnet_ids["subnet-db"] 

  network_security_group_id = module.db_nsg.id
} */


resource "azurerm_subnet_network_security_group_association" "association" {

  for_each = local.subnet_nsg_map

  subnet_id = module.network.subnet_ids[each.key]

  network_security_group_id = each.value

}

module "web_route_table" {
  source = "./modules/route-table"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  route_table_name = "rt-web"

  tags = local.common_tags

  routes = [
    {
      name                   = "DefaultRoute"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "Internet"
      next_hop_in_ip_address = null
    }
  ]
}

resource "azurerm_subnet_route_table_association" "web" {
  #subnet_id      = module.network.subnet_ids[0] 
  subnet_id      = module.network.subnet_ids["subnet-web"] #Enterprise Method
  route_table_id = module.web_route_table.id
}

/* resource "azurerm_subnet_route_table_association" "app" {

  subnet_id      = module.network.subnet_ids["subnet-app"]
  route_table_id = module.app_route_table.id
}


resource "azurerm_subnet_route_table_association" "db" {

  subnet_id      = module.network.subnet_ids["subnet-db"]
  route_table_id = module.db_route_table.id
}

*/


module "storage_account" {

  source = "./modules/storage-account"

  resource_group_name = module.resource_group.resource_group_name

  location = var.location

  storage_account_name = "stskazure2026xyz"

  tags = local.common_tags
}


module "key_vault" {

  source = "./modules/key-vault"

  key_vault_name = "kvsaikrishna001"

  resource_group_name = module.resource_group.resource_group_name

  location = var.location

  tenant_id = var.tenant_id

  tags = local.common_tags
}


module "monitoring" {

  source = "./modules/monitoring"

  workspace_name = "law-enterprise-dev"

  location = var.location

  resource_group_name = module.resource_group.resource_group_name

  tags = local.common_tags
}


resource "azurerm_monitor_diagnostic_setting" "storage_blob_diag" {
  name = "diag-storage-blob"

  target_resource_id = "${module.storage_account.storage_account_id}/blobServices/default"

  log_analytics_workspace_id = module.monitoring.id

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  enabled_metric {
    category = "Transaction"
  }
}



module "web_vm" {

  source = "./modules/virtual-machine"

  vm_name = "vm-web"

  location = module.resource_group.location

  resource_group_name = module.resource_group.resource_group_name

  subnet_id = module.network.subnet_ids["subnet-web"]

  vm_size = "Standard_B2s"

  admin_username = "azureadmin"

  admin_password = data.azurerm_key_vault_secret.vm_password.value

  storage_account_uri = module.storage_account.primary_blob_endpoint

  tags = local.common_tags

}


module "app_vm" {

  source = "./modules/virtual-machine"

  vm_name = "vm-app"

  location = module.resource_group.location

  resource_group_name = module.resource_group.resource_group_name

  subnet_id = module.network.subnet_ids["subnet-app"]

  vm_size = "Standard_B2s"

  admin_username = "azureadmin"

  admin_password = data.azurerm_key_vault_secret.vm_password.value

  storage_account_uri = module.storage_account.primary_blob_endpoint

  tags = local.common_tags

}

module "db_vm" {

  source = "./modules/virtual-machine"

  vm_name = "vm-db"

  location = module.resource_group.location

  resource_group_name = module.resource_group.resource_group_name

  subnet_id = module.network.subnet_ids["subnet-db"]

  vm_size = "Standard_B2s"

  admin_username = "azureadmin"

  admin_password = data.azurerm_key_vault_secret.vm_password.value

  storage_account_uri = module.storage_account.primary_blob_endpoint

  tags = local.common_tags

}

data "azurerm_key_vault" "personal" {
  provider = azurerm.personal

  name                = "kv-saikrishna-personal"
  resource_group_name = "rg-personal-security"
}

data "azurerm_key_vault_secret" "vm_password" {
  provider = azurerm.personal

  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.personal.id
}

module "vm_backup" {
  source = "./modules/vm-backup"

  vault_name  = "rsv-enterprise-dev"
  policy_name = "bp-enterprise-daily"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  vm_ids = {
    vm-web = module.web_vm.vm_id
    vm-app = module.app_vm.vm_id
    vm-db  = module.db_vm.vm_id
  }

  tags = local.common_tags
}


module "monitor_alerts" {

  source = "./modules/monitor-alerts"

  resource_group_name = module.resource_group.resource_group_name

  location = module.resource_group.location

  action_group_name = "ag-enterprise-dev"

  resource_group_id = module.resource_group.resource_group_id

  email_address = "vemsaikrishna@gmail.com"

  vm_ids = [

    module.web_vm.vm_id,
    module.app_vm.vm_id,
    module.db_vm.vm_id

  ]

  tags = local.common_tags

}

module "bastion" {
  source = "./modules/bastion"

  bastion_name   = "bas-enterprise-dev"
  public_ip_name = "pip-bastion-enterprise-dev"

  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.location
  virtual_network_name = module.network.vnet_name

  tags = local.common_tags
}


module "private_endpoints" {
  source = "./modules/private-endpoints"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  virtual_network_name = module.network.vnet_name
  virtual_network_id   = module.network.vnet_id

  storage_account_id = module.storage_account.storage_account_id
  key_vault_id       = module.key_vault.id

  tags = local.common_tags
}


module "rbac" {
  count  = var.enable_rbac_assignments ? 1 : 0
  source = "./modules/rbac"

  key_vault_id = module.key_vault.id

  vm_principal_ids = {
    vm-web = module.web_vm.principal_id
    vm-app = module.app_vm.principal_id
    vm-db  = module.db_vm.principal_id
  }
}

module "policies" {
  count  = var.enable_policy_assignments ? 1 : 0
  source = "./modules/policies"

  resource_group_id = module.resource_group.resource_group_id

  allowed_locations = [
    "centralindia"
  ]

  allowed_vm_sizes = [
    "Standard_B2s"
  ]

  required_tag_name = "Project"
}