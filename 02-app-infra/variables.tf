# ==============================================================================
# PROPÓSITO: Parámetros de entrada configurables y catálogo de proyectos
# ==============================================================================

variable "location" {
  type        = string
  description = "Región principal de Azure para desplegar la infraestructura de Ecommerce"
  default     = "westeurope"
}

variable "environment" {
  type        = string
  description = "Entorno del sistema (ej. prod, dev, stg)"
  default     = "prod"
}

variable "project_name" {
  type        = string
  description = "Nombre del proyecto"
  default     = "ecommerce"
}