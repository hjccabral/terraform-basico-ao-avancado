resource "azurerm_storage_account" "az_stg_account" {
  name                     = var.storage_account_azure
  resource_group_name      = azurerm_resource_group.az-resource-group.name
  location                 = azurerm_resource_group.az-resource-group.location
  account_tier             = var.account_tier_azure
  account_replication_type = var.account_replication_type

  blob_properties {
    versioning_enabled = true
  }

  tags = local.common_tags
}

resource "azurerm_storage_container" "az_stg_container" {
  name               = var.storage_container_azure
  storage_account_id = azurerm_storage_account.az_stg_account.id
}
