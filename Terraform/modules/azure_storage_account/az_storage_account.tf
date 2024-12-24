resource "azurerm_storage_account" "storage_for_wg_config" {
  name                     = var.Storage_Account_Name_for_WireGuard_VPN_Configs
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container_for_wg_config" {
  storage_account_name  = azurerm_storage_account.storage_for_wg_config.name
  name                  = var.Storage_Container_Name_for_WireGuard_VPN_Configs
  container_access_type = "private"
}

data "azurerm_storage_account_blob_container_sas" "sas_to_upload_configs_to" {
  connection_string = azurerm_storage_account.storage_for_wg_config.primary_connection_string
  container_name    = azurerm_storage_container.container_for_wg_config.name
  https_only        = true

  start  = timestamp()
  expiry = timeadd(timestamp(), "1h")

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = true
    list   = true
  }

  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "text/plain"
}

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "storage_blob_owner_assignment" {
  principal_id                     = data.azurerm_client_config.current.object_id
  role_definition_name             = "Storage Blob Data Owner"
  scope                            = azurerm_storage_container.container_for_wg_config.resource_manager_id
  skip_service_principal_aad_check = true
}