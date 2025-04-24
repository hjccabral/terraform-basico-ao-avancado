output "hjcc_storage_account_id" {
  description = "Output of informations about ID storage account"
  value       = azurerm_storage_account.hjcc_storage_account.id
}

output "hjcc_storage_account_pAk" {
  description = "Output of informations about primary access key"
  value       = azurerm_storage_account.hjcc_storage_account.primary_access_key
  sensitive   = true
}