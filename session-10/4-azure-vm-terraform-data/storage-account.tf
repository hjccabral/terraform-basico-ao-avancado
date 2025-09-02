resource "azurerm_storage_account" "sa-hjcc" {
  name                     = "hjccstorageacct3"
  resource_group_name      = var.resource_group_azure
  location                 = var.region_azure
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.common_tags
}