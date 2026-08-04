# ==============================================================================
# PROPÓSITO: Parámetros de entrada configurables y catálogo de proyectos
# ==============================================================================

variable "location" {
  type        = string
  description = "Región principal de Azure para desplegar la infraestructura base"
  default     = "westeurope"
}

variable "environment" {
  type        = string
  description = "Entorno del sistema (core)"
  default     = "core"
}

variable "project_name" {
  type        = string
  description = "Nombre del proyecto global"
  default     = "gov"
}

variable "azure_devops_org" {
  type        = string
  description = "Nombre de tu organización en Azure DevOps"
  default     = "andrespalaciovelasquez"
}

variable "azure_devops_project" {
  type        = string
  description = "Nombre del proyecto en Azure DevOps donde vive el Repo Core"
  default     = "SandboxPalacio"
}

variable "azure_devops_repo" {
  type        = string
  description = "Nombre del repositorio Git del Core en Azure DevOps"
  default     = "01-core-identity"
}

# CATÁLOGO DE PROYECTOS (GitOps - Fase 2)
variable "projects" {
  type = map(object({
    azure_devops_project = string
    azure_devops_repo    = string
    service_connection   = string
  }))
  description = "Mapa de proyectos que requieren identidades y permisos WIF"
  default = {}
}