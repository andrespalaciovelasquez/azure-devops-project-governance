# ==============================================================================
# PROPÓSITO: Crear los recursos para el proyecto ecommerce
# ==============================================================================

resource "azurerm_resource_group" "rg_app" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_container_registry" "acr" {
  name                = local.acr_name
  resource_group_name = azurerm_resource_group.rg_app.name
  location            = azurerm_resource_group.rg_app.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = local.common_tags
}