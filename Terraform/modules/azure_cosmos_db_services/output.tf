output "AZURE_COSMOS_DB_CONTAINER_NAME" {
  value       = azurerm_cosmosdb_sql_container.USNYTPythonTwitterBotCDBContainer.name
  sensitive   = true
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COSMOS_DB_ENDPOINT" {
  value       = azurerm_cosmosdb_account.USNYTPythonTwitterBotCDBAccount.endpoint
  sensitive   = true
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COSMOS_DB_DATABASE_NAME" {
  value       = azurerm_cosmosdb_sql_database.USNYTPythonTwitterBotCDB.name
  sensitive   = true
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}

output "AZURE_COSMOS_DB_CREDENTIAL" {
  value       = azurerm_cosmosdb_account.USNYTPythonTwitterBotCDBAccount.primary_key
  sensitive   = true
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}