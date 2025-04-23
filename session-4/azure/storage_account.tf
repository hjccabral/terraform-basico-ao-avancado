resource "azurerm_storage_account" "hjcc_storage_account" {
  name                     = var.hjcc_storage_account_name
  resource_group_name      = azurerm_resource_group.hjcc_resource_group.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = local.common_tags
}

resource "azurerm_storage_container" "hjcc_storage_container" {
  name                 = var.hjcc_storage_container
  storage_account_name = azurerm_storage_account.hjcc_storage_account.name
}