# ==============================================================================
# PROPÓSITO: Configuración de la conexión con la nube de Azure
# ==============================================================================

provider "azurerm" {
  features {}
  storage_use_azuread = true
}