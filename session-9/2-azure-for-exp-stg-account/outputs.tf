output "hjcc_storage_account_id" {
  description = "Output of informations about ID storage account"
  value       = [for sa in azurerm_storage_account.hjcc_storage_account : sa.id]
}

output "hjcc_storage_account_pak" {
  description = "Output of informations about primary access key"
  value       = { for key, sa in azurerm_storage_account.hjcc_storage_account : key => sa.primary_access_key }
  sensitive   = true
}
