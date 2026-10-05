terraform {
  backend "azurerm" {
    use_oidc         = true
    use_azuread_auth = true

    resource_group_name  = "rg-azure-databricks"
    storage_account_name = "sttfstateazuredb"
    container_name       = "tfstate"
    key                  = "azure-databricks-production.tfstate"
  }
}