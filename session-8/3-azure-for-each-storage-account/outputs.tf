output "hjcc_storage_account_id1" {
  description = "Output of informations about ID storage account"
  value       = azurerm_storage_account.hjcc_storage_account["europe"].id
}

output "hjcc_storage_account_id2" {
  description = "Output of informations about ID storage account"
  value       = azurerm_storage_account.hjcc_storage_account["eua"].id
}

output "hjcc_storage_account_id3" {
  description = "Output of informations about ID storage account"
  value       = azurerm_storage_account.hjcc_storage_account["asia"].id
}

output "hjcc_storage_account_id4" {
  description = "Output of informations about ID storage account"
  value       = azurerm_storage_account.hjcc_storage_account["brasil"].id
}

output "hjcc_storage_account_pak1" {
  description = "Output of informations about primary access key"
  value       = azurerm_storage_account.hjcc_storage_account["europe"].primary_access_key
  sensitive   = true
}

output "hjcc_storage_account_pak2" {
  description = "Output of informations about primary access key"
  value       = azurerm_storage_account.hjcc_storage_account["eua"].primary_access_key
  sensitive   = true
}

output "hjcc_storage_account_pak3" {
  description = "Output of informations about primary access key"
  value       = azurerm_storage_account.hjcc_storage_account["asia"].primary_access_key
  sensitive   = true
}

output "hjcc_storage_account_pak4" {
  description = "Output of informations about primary access key"
  value       = azurerm_storage_account.hjcc_storage_account["brasil"].primary_access_key
  sensitive   = true
}