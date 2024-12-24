output "sas_url_to_upload_to" {
  value       = data.azurerm_storage_account_blob_container_sas.sas_to_upload_configs_to.sas
  description = "SAS url which will be used with azcopy to upload wg configs"
  sensitive   = true
}

output "WG_Storage_Account_Name" {
  value       = azurerm_storage_account.storage_for_wg_config.name
  description = "Storage Account name where WireGuard VPN configs are stored"
  sensitive   = true
}

output "WG_Storage_Container_Name" {
  value       = azurerm_storage_container.container_for_wg_config.name
  description = "Storage Container name where WireGuard VPN configs are stored"
  sensitive   = true
}
