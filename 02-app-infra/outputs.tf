# ==============================================================================
# PROPÓSITO: Mostrar los resultados y exportar IDs necesarios para Azure DevOps
# ==============================================================================

output "ecommerce_resource_group_name" {
  value       = azurerm_resource_group.rg_app.name
  description = "Nombre del grupo de recursos de producción para Ecommerce"
}

output "acr_login_server" {
  value       = azurerm_container_registry.acr.login_server
  description = "URL del servidor del Container Registry"
}

output "acr_name" {
  value       = azurerm_container_registry.acr.name
  description = "Nombre único del Azure Container Registry"
}