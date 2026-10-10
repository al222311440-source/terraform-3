locals {
  suffix   = var.name_suffix
  location = var.location
  tags = {
    organization = "utvt"
    project      = "integradora"
    workload     = "web"
    environment  = "qa"
    owner        = "Felipe de Jesús Serrano Hurtado"
    managed_by   = "terraform"
    practice     = "terraform-3"
  }
}
