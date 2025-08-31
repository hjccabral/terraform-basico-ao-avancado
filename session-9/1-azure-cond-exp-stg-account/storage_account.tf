resource "azurerm_storage_account" "hjcc_storage_account" {
  count = var.environment == "dev" ? 0 : 1

  name                     = "hjcc${var.environment}stg"
  resource_group_name      = azurerm_resource_group.hjcc_resource_group.name
  location                 = var.location
  account_tier             = var.environment == "prod" ? "Premium" : "Standard"
  account_replication_type = var.environment != "prod" ? "LRS" : "RAGZRS"
  tags                     = local.common_tags
}