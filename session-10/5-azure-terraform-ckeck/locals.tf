locals {
  common_tags = {
    org        = "hjcc"
    course     = "Terraform - Do Basico ao Avancado"
    managed-by = "Terraform"
  }

  nsg_ports = [
    "22",
    "80",
    "443",
    "8080"
  ]

}

