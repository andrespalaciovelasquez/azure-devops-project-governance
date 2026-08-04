# ==============================================================================
# PROPÓSITO: Crear el Resource Group de Administración y el Backend del State
# ==============================================================================

resource "azurerm_resource_group" "rg_core" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_storage_account" "sa_tfstate" {
  name                     = local.storage_name
  resource_group_name      = azurerm_resource_group.rg_core.name
  location                 = azurerm_resource_group.rg_core.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  allow_nested_items_to_be_public = false
  shared_access_key_enabled = false # Seguridad: Forzamos Azure AD (WIF)

  tags = local.common_tags
}

resource "azurerm_storage_container" "sc_infra_state" {
  name                  = local.container_name
  storage_account_name  = azurerm_storage_account.sa_tfstate.name
  container_access_type = "private"
} 