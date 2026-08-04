# ==============================================================================
# PROPÓSITO: Configurar la Federación de Identidad sin contraseñas (WIF)
# ==============================================================================

# 1. WIF ESTÁTICO PARA LA IDENTIDAD CORE (Llave Maestra para el Repo 1)
# Permite que el pipeline del Repo 1 asuma la identidad uami_platform_admin
resource "azurerm_federated_identity_credential" "wif_core" {
  name                = "fic-azuredevops-core-main"
  resource_group_name = azurerm_resource_group.rg_core.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://vstoken.dev.azure.com/${var.azure_devops_org}"
  parent_id           = azurerm_user_assigned_identity.uami_platform_admin.id
  
  # Nota: Reemplaza "NOMBRE_PROYECTO_DEVOPS" por el nombre del proyecto donde vive tu Repo 1
  subject             = "sc://https://dev.azure.com/${var.azure_devops_org}/${var.azure_devops_project}/repo/${var.azure_devops_repo}"
}

# 2. WIF DINÁMICO PARA LOS PROYECTOS (Llaves de Inquilinos)
# Se crean automáticamente cuando se añade un proyecto al catálogo en variables.tf
resource "azurerm_federated_identity_credential" "wif_projects_main" {
  for_each            = var.projects

  name                = "fic-azuredevops-${each.key}-main"
  resource_group_name = azurerm_resource_group.rg_core.name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://vstoken.dev.azure.com/${var.azure_devops_org}"
  parent_id           = azurerm_user_assigned_identity.uami_projects[each.key].id
  
  subject             = "sc://https://dev.azure.com/${var.azure_devops_org}/${each.value.azure_devops_project}/repo/${each.value.azure_devops_repo}"
}