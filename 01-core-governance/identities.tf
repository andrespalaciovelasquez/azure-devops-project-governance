# ==============================================================================
# PROPÓSITO: Creación de UAMIs y Asignación de Permisos (RBAC)
# ==============================================================================

data "azurerm_subscription" "current" {}

# 1. IDENTIDAD CORE (Admin de Plataforma)
resource "azurerm_user_assigned_identity" "uami_platform_admin" {
  name                = "uami-platform-admin"
  resource_group_name = azurerm_resource_group.rg_core.name
  location            = azurerm_resource_group.rg_core.location
  tags                = local.common_tags
}

resource "azurerm_role_assignment" "admin_contributor" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.uami_platform_admin.principal_id
}

# 2. IDENTIDADES DINÁMICAS POR PROYECTO (Ej: ecommerce)
resource "azurerm_user_assigned_identity" "uami_projects" {
  for_each            = var.projects
  
  name                = "uami-pipeline-${each.key}"
  resource_group_name = azurerm_resource_group.rg_core.name
  location            = azurerm_resource_group.rg_core.location
  tags                = merge(local.common_tags, { Project = each.key })
}

resource "azurerm_role_assignment" "projects_contributor" {
  for_each             = var.projects
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.uami_projects[each.key].principal_id
}

resource "azurerm_role_assignment" "projects_storage_blob_owner" {
  for_each             = var.projects
  scope                = azurerm_storage_account.sa_tfstate.id
  role_definition_name = "Storage Bl ob Data Owner"
  principal_id         = azurerm_user_assigned_identity.uami_projects[each.key].principal_id
}