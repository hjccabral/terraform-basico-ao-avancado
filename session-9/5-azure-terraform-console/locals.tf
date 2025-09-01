locals {
  common_tags = {
    org        = "hjcc"
    course     = "Terraform - Do Basico ao Avancado"
    managed-by = "Terraform"
    location   = var.region_azure
  }
}