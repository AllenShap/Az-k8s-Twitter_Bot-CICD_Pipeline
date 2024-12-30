module "az_resource_group_create" {
  source                  = "./modules/azure_resource_group"
  resource_group_location = var.resource_group_location
  resource_group_name     = var.resource_group_name
}

module "az_AKS_resource_group_create" {
  source                  = "./modules/AKS_azure_resource_group"
  resource_group_location = var.resource_group_location
  AKS_resource_group_name = var.AKS_resource_group_name
}

module "az_storage_account_create" {
  depends_on                                       = [module.az_resource_group_create]
  source                                           = "./modules/azure_storage_account"
  resource_group_location                          = var.resource_group_location
  resource_group_name                              = var.resource_group_name
  Storage_Account_Name_for_WireGuard_VPN_Configs   = var.Storage_Account_Name_for_WireGuard_VPN_Configs
  Storage_Container_Name_for_WireGuard_VPN_Configs = var.Storage_Container_Name_for_WireGuard_VPN_Configs
}

module "az_virtual_network_create" {
  depends_on              = [module.az_resource_group_create]
  source                  = "./modules/azure_virtual_network"
  resource_group_location = var.resource_group_location
  resource_group_name     = var.resource_group_name
}

module "az_subnet_create" {
  depends_on              = [module.az_resource_group_create, module.az_virtual_network_create]
  source                  = "./modules/azure_subnet"
  resource_group_location = var.resource_group_location
  resource_group_name     = var.resource_group_name
}

module "az_virtual_machine_create" {
  depends_on                = [module.az_resource_group_create, module.az_virtual_network_create, module.az_subnet_create]
  source                    = "./modules/azure_wg_virtual_machine"
  nic_id                    = module.az_subnet_create.nic_for_vm
  resource_group_location   = var.resource_group_location
  resource_group_name       = var.resource_group_name
  sas_url_for_azcopy        = module.az_storage_account_create.sas_url_to_upload_to
  WG_Storage_Account_Name   = module.az_storage_account_create.WG_Storage_Account_Name
  WG_Storage_Container_Name = module.az_storage_account_create.WG_Storage_Container_Name
  outboundip                = module.az_kubernetes_cluster_create.outboundip
}

module "az_key_vault_create" {
  depends_on                               = [module.az_resource_group_create, module.az_virtual_network_create, module.az_subnet_create, module.az_virtual_machine_create]
  source                                   = "./modules/azure_key_vault"
  resource_group_location                  = var.resource_group_location
  resource_group_name                      = var.resource_group_name
  SSH_key_value_to_store_in_kv             = module.az_virtual_machine_create.vm_ssh_private_key
  Additional_Object_ID_For_KeyVault_Access = var.Additional_Object_ID_For_KeyVault_Access
}

module "az_container_registry_create" {
  depends_on              = [module.az_AKS_resource_group_create]
  source                  = "./modules/azure_container_registry"
  container_registry_name = var.container_registry_name
  resource_group_location = module.az_AKS_resource_group_create.resource_group_location
  AKS_resource_group_name = module.az_AKS_resource_group_create.AKS_resource_group_name
}

module "backend_az_resource_group_create" {
  source                  = "./modules/azure_storage_services"
  resource_group_location = var.resource_group_location
  resource_group_name     = var.backend_resources_RG_name
}

module "az_cosmos_db_create" {
  depends_on                          = [module.backend_az_resource_group_create]
  source                              = "./modules/azure_cosmos_db_services"
  resource_group_location             = module.backend_az_resource_group_create.resource_group_location
  resource_group_name                 = module.backend_az_resource_group_create.resource_group_name
  azurerm_cosmosdb_account_name       = var.azurerm_cosmosdb_account_name
  azurerm_cosmosdb_sql_container_name = var.azurerm_cosmosdb_sql_container_name
  azurerm_cosmosdb_sql_database_name  = var.azurerm_cosmosdb_sql_database_name
}

module "az_cognitive_services_create" {
  depends_on                     = [module.backend_az_resource_group_create]
  source                         = "./modules/azure_cognitive_services"
  resource_group_location        = module.backend_az_resource_group_create.resource_group_location
  resource_group_name            = module.backend_az_resource_group_create.resource_group_name
  azurerm_cognitive_account_name = var.azurerm_cognitive_account_name
  azurerm_search_service_name    = var.azurerm_search_service_name
}

module "az_logging_services_create" {
  depends_on                           = [module.backend_az_resource_group_create]
  source                               = "./modules/azure_logging_services"
  resource_group_location              = module.backend_az_resource_group_create.resource_group_location
  resource_group_name                  = module.backend_az_resource_group_create.resource_group_name
  azurerm_application_insights_name    = var.azurerm_application_insights_name
  azurerm_log_analytics_workspace_name = var.azurerm_log_analytics_workspace_name
}

module "az_kubernetes_cluster_create" {
  depends_on              = [module.az_AKS_resource_group_create, module.az_container_registry_create]
  source                  = "./modules/azure_kubernetes_cluster"
  kubernetes_cluster_name = var.kubernetes_cluster_name
  resource_group_location = module.az_AKS_resource_group_create.resource_group_location
  AKS_resource_group_name = module.az_AKS_resource_group_create.AKS_resource_group_name
  acr_id                  = module.az_container_registry_create.acr_id
}
