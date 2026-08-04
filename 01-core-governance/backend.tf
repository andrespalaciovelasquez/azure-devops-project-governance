# ==============================================================================
# PROPÓSITO: Configurar el backend remoto en Azure Blob Storage (State Centralizado)
# ==============================================================================

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-gov-core-westeurope"
    storage_account_name = "stgovcoretfstate"
    container_name       = "tfstate-gov-core"
    key                  = "core-bootstrap.tfstate"
    use_azuread_auth     = true
  }
}