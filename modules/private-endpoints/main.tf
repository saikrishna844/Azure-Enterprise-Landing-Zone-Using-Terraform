resource "azurerm_subnet" "private_endpoints" {
  name                 = "subnet-private-endpoints"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name

  address_prefixes = [
    "10.0.4.0/24"
  ]

  private_endpoint_network_policies = "Disabled"
}

resource "azurerm_private_dns_zone" "storage_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone" "key_vault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "storage_blob" {
  name = "link-storage-blob-to-vnet"

  #resource_group_name   = var.resource_group_name
  #private_dns_zone_name = azurerm_private_dns_zone.storage_blob.name
  virtual_network_id  = var.virtual_network_id
  private_dns_zone_id = azurerm_private_dns_zone.storage_blob.id

  registration_enabled = false

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "key_vault" {
  name = "link-key-vault-to-vnet"

  #resource_group_name   = var.resource_group_name
  #private_dns_zone_name = azurerm_private_dns_zone.key_vault.name
  virtual_network_id  = var.virtual_network_id
  private_dns_zone_id = azurerm_private_dns_zone.key_vault.id

  registration_enabled = false

  tags = var.tags
}


resource "azurerm_private_endpoint" "storage_blob" {
  name                = "pe-storage-blob-enterprise-dev"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.private_endpoints.id

  private_service_connection {
    name                           = "psc-storage-blob"
    private_connection_resource_id = var.storage_account_id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name = "storage-blob-dns-zone-group"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.storage_blob.id
    ]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "key_vault" {
  name                = "pe-key-vault-enterprise-dev"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.private_endpoints.id

  private_service_connection {
    name                           = "psc-key-vault"
    private_connection_resource_id = var.key_vault_id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name = "key-vault-dns-zone-group"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.key_vault.id
    ]
  }

  tags = var.tags
}


