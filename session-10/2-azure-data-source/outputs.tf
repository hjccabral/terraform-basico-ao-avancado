output "sas_url_query_string" {
  description = "SAS Toke to image container"
  value       = data.azurerm_storage_account_blob_container_sas.sas_token.sas
  sensitive   = true
}

output "container_url" {
  description = "URL of the image container"
  value       = azurerm_storage_container.container.id
}