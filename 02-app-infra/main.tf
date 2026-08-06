# ==============================================================================
# PROPÓSITO: Crear los recursos para el proyecto ecommerce
# ==============================================================================

resource "azurerm_resource_group" "rg_app" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags

}