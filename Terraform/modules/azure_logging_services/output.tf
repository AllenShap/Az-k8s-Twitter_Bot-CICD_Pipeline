output "application_insights_connection_string" {
  sensitive   = true
  value       = azurerm_application_insights.AppInsights-USNYTPythonTwitterBot.connection_string
  description = "Output value which will be passed into the environmental variables of the AKS pod for the Python Tweet Bot through a GitHub Actions Workflow"
}