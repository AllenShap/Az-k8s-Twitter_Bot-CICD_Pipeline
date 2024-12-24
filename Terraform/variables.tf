variable "resource_group_location" {
  description = "Geographical region where all resource groups will be created"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of Azure Resource Group where all WG VPN resources will be deployed to"
  type        = string
  sensitive   = true
}

variable "kubernetes_cluster_name" {
  description = "Name of AKS cluster"
  type        = string
  sensitive   = true
}

variable "container_registry_name" {
  description = "Name of ACR"
  type        = string
  sensitive   = true
}

variable "AKS_resource_group_name" {
  description = "Name of Azure Resource Group where all Azure Kubernetes resources will be deployed to"
  type        = string
  sensitive   = true
}

variable "backend_resources_RG_name" {
  description = "Name of Azure Resource Group which will contain resources that support the backend of the AKS Python Tweet Bot (dbs, apis, logging, ai)"
  type        = string
  sensitive   = true
}

variable "azurerm_cosmosdb_account_name" {
  description = "Name of Cosmos DB Account which will be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}

variable "azurerm_cosmosdb_sql_database_name" {
  description = "Name of Cosmos SQL DB which will be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}

variable "azurerm_cosmosdb_sql_container_name" {
  description = "Name of Cosmos SQL DB Container which will be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}

variable "azurerm_cognitive_account_name" {
  description = "Name of Cognitive Account to be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}

variable "azurerm_search_service_name" {
  description = "Name of Cognitive Search Service to be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}

variable "azurerm_log_analytics_workspace_name" {
  description = "Name of Log Analytics Workspace to be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}

variable "azurerm_application_insights_name" {
  description = "Name of Application Insights service to be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}

variable "Additional_Object_ID_For_KeyVault_Access" {
  description = "Since the GitHub Actions workflow uses a provisioned Service Account to deploy the Azure infra, It will not allow anyone else to view secrets in the KV which is useful for troubleshooting purposes."
  type        = string
  sensitive   = true
}

variable "Storage_Account_Name_for_WireGuard_VPN_Configs" {
  description = "This is the Storage Account name for which WireGuard VPN configuration information will be stored. The configs are uploaded from the WG VPN using AzCopy"
  type        = string
  sensitive   = true
}

variable "Storage_Container_Name_for_WireGuard_VPN_Configs" {
  description = "This is the Storage Container name for which WireGuard VPN configuration information will be stored. The configs are uploaded from the WG VPN using AzCopy"
  type        = string
  sensitive   = true
}