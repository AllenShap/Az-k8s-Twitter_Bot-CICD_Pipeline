resource "azurerm_log_analytics_workspace" "LogAnalyticsWS-USNYTPythonTwitterBot" {
  name                = var.azurerm_log_analytics_workspace_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "AppInsights-USNYTPythonTwitterBot" {
  name                = var.azurerm_application_insights_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.LogAnalyticsWS-USNYTPythonTwitterBot.id
}