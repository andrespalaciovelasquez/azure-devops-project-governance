# ==============================================================================
# PROPÓSITO: Configuración de la conexión con la nube de Azure
# ==============================================================================

provider "azurerm" {
  features {}
  use_oidc = true
  storage_use_azuread = true
}