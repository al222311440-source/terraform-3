variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
  sensitive   = true
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.subscription_id))
    error_message = "Proporciona la suscripción real mediante TF_VAR_subscription_id."
  }
}


variable "service_plan_sku_name" {
  type    = string
  default = "F1"
  validation {
    condition     = var.service_plan_sku_name == "F1"
    error_message = "Esta práctica utiliza únicamente el plan gratuito F1."
  }
}

variable "application_type" {
  description = "Application type for the Azure Application Insights resource"
  type        = string
  default     = "web"
}

variable "node_version" {
  description = "Node.js version for the Azure Linux Web App"
  type        = string
  default     = "24-lts"
}

variable "log_analytics_sku" {
  description = "SKU del espacio de trabajo de Log Analytics"
  type        = string
  default     = "PerGB2018"
}


variable "web_app_name" {
  description = "Nombre de la aplicación web del entorno QA"
  type        = string
  default     = "app-utvt-integradora-web-qa-mxc-al222311440-001"
}

variable "location" {
  description = "Región inferida de mxc en la nomenclatura original y de la práctica anterior."
  type        = string
  default     = "mexicocentral"
}

variable "name_suffix" {
  description = "Sufijo compartido, derivado del nombre QA proporcionado por el profesor."
  type        = string
  default     = "utvt-integradora-web-qa-mxc-001"
}
