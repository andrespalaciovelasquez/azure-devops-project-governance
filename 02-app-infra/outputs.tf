# ==============================================================================
# PROPÓSITO: Mostrar los resultados y exportar IDs necesarios para Azure DevOps
# ==============================================================================

output "ecommerce_resource_group_name" {
  value       = azurerm_resource_group.rg_app.name
  description = "Nombre del grupo de recursos de producción para Ecommerce"
}