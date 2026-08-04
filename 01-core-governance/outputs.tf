# ==============================================================================
# PROPÓSITO: Mostrar los resultados y exportar IDs necesarios para Azure DevOps
# ==============================================================================

output "core_resource_group" {
  value = azurerm_resource_group.rg_core.name
}

output "core_storage_account" {
  value = azurerm_storage_account.sa_tfstate.name
}

# 1. OUTPUTS ESTÁTICOS (DÍA 0)
output "uami_platform_admin_client_id" {
  description = "Client ID de la UAMI Core (Para el pipeline del propio Repo 1)"
  value       = azurerm_user_assigned_identity.uami_platform_admin.client_id
}

output "uami_platform_admin_tenant_id" {
  value = azurerm_user_assigned_identity.uami_platform_admin.tenant_id
}

# 2. OUTPUTS DINÁMICOS (DÍA 1 EN ADELANTE - FASE 2)
output "projects_uami_client_ids" {
  description = "Mapa con los Client IDs de todas las UAMIs de los proyectos"
  # Itera sobre todas las UAMIs creadas y devuelve un mapa: { "ecommerce" = "client-id-xyz" }
  value       = { for key, uami in azurerm_user_assigned_identity.uami_projects : key => uami.client_id }
}