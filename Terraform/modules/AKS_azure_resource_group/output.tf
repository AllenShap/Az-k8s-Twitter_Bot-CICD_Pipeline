output "AKS_resource_group_name" {
  value       = azurerm_resource_group.RG-KubernetesPythonTwitterBot.name
  description = "Resource Group name of AKS/ACR"
  sensitive   = true
}

output "resource_group_location" {
  value       = azurerm_resource_group.RG-KubernetesPythonTwitterBot.location
  description = "Geographical region of resource group"
  sensitive   = true
}
