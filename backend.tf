terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-backend"
    storage_account_name = "sttfstatesai310726"
    container_name       = "tfstate"
    key                  = "azure-enterprise-landing-zone.tfstate"

    subscription_id = "31e04be6-4545-4ac3-88c4-cc79f284f7ac"
    tenant_id       = "d77ec4e8-c88b-431b-8d7f-77755a4bbefc"
    #use_azuread_auth = true
  }
}