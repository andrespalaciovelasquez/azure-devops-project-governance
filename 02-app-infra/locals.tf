# ==============================================================================
# PROPÓSITO: Variables locales calculadas y etiquetas (tags) unificadas
# ==============================================================================

locals {
  prefix = "${var.project_name}-${var.environment}"  
  rg_name      = "rg-${local.prefix}-${var.location}"

  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Repo        = "infra-app-ecommerce"
  }
}