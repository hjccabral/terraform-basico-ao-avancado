locals {
  common_tags = {
    org        = "hjcc"
    course     = "Terraform - Do Basico ao Avancado"
    managed-by = "Terraform"
  }
}

locals {
  azure_credentials = jsondecode(file("${path.module}/secrets/credentials.json"))
}