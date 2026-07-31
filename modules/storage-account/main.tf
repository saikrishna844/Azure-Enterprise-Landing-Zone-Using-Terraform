resource "azurerm_storage_account" "this" {

  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  account_kind = "StorageV2"

  min_tls_version = "TLS1_2"

  https_traffic_only_enabled = true

  shared_access_key_enabled = true

  public_network_access_enabled = true

  tags = var.tags
}