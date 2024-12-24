output "AZURE_COGNITIVE_KEY" {
  sensitive   = true
  value       = azurerm_cognitive_account.CA-USNYTPythonTwitterBot.primary_access_key
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COGNITIVE_SEARCH_KEY" {
  sensitive   = true
  value       = azurerm_search_service.Search-USNYTPythonTwitterBot.primary_key
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COGNITIVE_ENDPOINT" {
  sensitive   = true
  value       = azurerm_cognitive_account.CA-USNYTPythonTwitterBot.endpoint
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COGNITIVE_SEARCH_SERVICE_URL" {
  description = "URL of the Search Service."
  value       = "https://${azurerm_search_service.Search-USNYTPythonTwitterBot.name}.search.windows.net"
}
