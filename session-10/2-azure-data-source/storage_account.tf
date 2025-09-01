resource "azurerm_storage_account" "storage" {
  name                     = "hjccstgacctdatasource"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.common_tags
}

resource "azurerm_storage_container" "container" {
  name = "imagens"
  //storage_account_id = azurerm_storage_account.storage.id
  storage_account_name  = azurerm_storage_account.storage.name #Deprecated
  container_access_type = "blob"
}

data "azurerm_storage_account_blob_container_sas" "sas_token" {
  connection_string = azurerm_storage_account.storage.primary_connection_string
  container_name    = azurerm_storage_container.container.name
  https_only        = true

  ip_address = "191.251.32.217"

  start  = "2025-09-01"
  expiry = "2025-09-02"

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }

}