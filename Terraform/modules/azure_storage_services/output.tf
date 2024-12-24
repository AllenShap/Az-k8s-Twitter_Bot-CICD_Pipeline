output "resource_group_name" {
  value       = azurerm_resource_group.RG-USNYTPythonTwitterBot.name
  description = "Name of Azure Resource Group which will contain resources that support the backend of the AKS Python Tweet Bot (dbs, apis, logging, ai)"
  sensitive   = true
}

output "resource_group_location" {
  value       = azurerm_resource_group.RG-USNYTPythonTwitterBot.location
  description = "Geographical region where the resource group was created"
  sensitive   = true
}