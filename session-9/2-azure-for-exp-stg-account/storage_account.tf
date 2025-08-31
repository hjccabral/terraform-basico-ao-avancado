resource "azurerm_storage_account" "hjcc_storage_account" {

  for_each = azurerm_resource_group.hjcc_resource_group

  name                     = "stghjcc${each.key}"
  resource_group_name      = each.value.name
  location                 = each.value.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = local.common_tags
}

resource "azurerm_storage_container" "hjcc_storage_container" {

  for_each = azurerm_storage_account.hjcc_storage_account

  name                  = "imagens-${each.key}"
  storage_account_id    = each.value.id
  container_access_type = "private"
}