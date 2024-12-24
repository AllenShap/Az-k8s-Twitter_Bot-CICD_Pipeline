output "login_server" {
  value       = azurerm_container_registry.ACR-KubernetesPythonTwitterBot.login_server
  description = "ACR login server endpoint"
  sensitive   = true
}

output "admin_username" {
  value       = azurerm_container_registry.ACR-KubernetesPythonTwitterBot.admin_username
  description = "Admin username to login to ACR"
  sensitive   = true
}

output "admin_password" {
  sensitive   = true
  value       = azurerm_container_registry.ACR-KubernetesPythonTwitterBot.admin_password
  description = "Admin password to login to ACR"
}

output "acr_id" {
  sensitive   = true
  value       = azurerm_container_registry.ACR-KubernetesPythonTwitterBot.id
  description = "ID of ACR"
}
