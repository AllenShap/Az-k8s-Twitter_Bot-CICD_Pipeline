output "login_server" {
  sensitive   = true
  value       = module.az_container_registry_create.login_server
  description = "ACR login server endpoint"
}

output "admin_username" {
  sensitive   = true
  value       = module.az_container_registry_create.admin_username
  description = "Admin username to login to ACR"
}

output "admin_password" {
  sensitive   = true
  value       = module.az_container_registry_create.admin_password
  description = "Admin password to login to ACR"
}

output "AKS_resource_group_name" {
  sensitive   = true
  value       = module.az_AKS_resource_group_create.AKS_resource_group_name
  description = "Resource Group name of AKS/ACR"
}

output "aks_cluster_name" {
  sensitive   = true
  value       = module.az_kubernetes_cluster_create.aks_cluster_name
  description = "Name of AKS cluster"
}

output "AZURE_COSMOS_DB_CONTAINER_NAME" {
  sensitive   = true
  value       = module.az_cosmos_db_create.AZURE_COSMOS_DB_CONTAINER_NAME
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COSMOS_DB_ENDPOINT" {
  value       = module.az_cosmos_db_create.AZURE_COSMOS_DB_ENDPOINT
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
  sensitive   = true
}

output "AZURE_COSMOS_DB_DATABASE_NAME" {
  sensitive   = true
  value       = module.az_cosmos_db_create.AZURE_COSMOS_DB_DATABASE_NAME
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COSMOS_DB_CREDENTIAL" {
  sensitive   = true
  value       = module.az_cosmos_db_create.AZURE_COSMOS_DB_CREDENTIAL
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COGNITIVE_KEY" {
  sensitive   = true
  value       = module.az_cognitive_services_create.AZURE_COGNITIVE_KEY
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COGNITIVE_SEARCH_KEY" {
  sensitive   = true
  value       = module.az_cognitive_services_create.AZURE_COGNITIVE_SEARCH_KEY
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "application_insights_connection_string" {
  sensitive   = true
  value       = module.az_logging_services_create.application_insights_connection_string
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COGNITIVE_ENDPOINT" {
  sensitive   = true
  value       = module.az_cognitive_services_create.AZURE_COGNITIVE_ENDPOINT
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COGNITIVE_SEARCH_SERVICE_URL" {
  sensitive   = true
  description = "URL of the Search Service."
  value       = module.az_cognitive_services_create.AZURE_COGNITIVE_SEARCH_SERVICE_URL
}

output "WG_Storage_Account_Name" {
  value       = module.az_storage_account_create.WG_Storage_Account_Name
  description = "Storage Account name where WireGuard VPN configs are stored"
  sensitive   = true
}

output "WG_Storage_Container_Name" {
  value       = module.az_storage_account_create.WG_Storage_Container_Name
  description = "Storage Container name where WireGuard VPN configs are stored"
  sensitive   = true
}

