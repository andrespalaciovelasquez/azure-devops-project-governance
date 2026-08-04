# ==============================================================================
# PROPÓSITO: Variables locales calculadas y etiquetas (tags) unificadas
# ==============================================================================

locals {
  prefix = "${var.project_name}-${var.environment}"
  
  rg_name      = "rg-${local.prefix}-${var.location}"
  storage_name = "st${var.project_name}${var.environment}tfstate" 
  container_name = "tfstate-${local.prefix}"

  common_tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
    Repo        = "01-core-identity"
    Layer       = "Platform-Core"
  }
}