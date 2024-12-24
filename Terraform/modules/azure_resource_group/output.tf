output "resource_group_name" {
  value       = azurerm_resource_group.RG-terraformingvpn.name
  description = "Resource Group name of WG VM related objects"
  sensitive   = true
}

output "resource_group_location" {
  value       = azurerm_resource_group.RG-terraformingvpn.location
  description = "Geographical region of resource group"
  sensitive   = true
}
