resource "azurerm_cognitive_account" "CA-USNYTPythonTwitterBot" {
  name                = var.azurerm_cognitive_account_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  kind                = "TextAnalytics"
  sku_name            = "S"

  custom_question_answering_search_service_id  = azurerm_search_service.Search-USNYTPythonTwitterBot.id
  custom_question_answering_search_service_key = azurerm_search_service.Search-USNYTPythonTwitterBot.primary_key
}

resource "azurerm_search_service" "Search-USNYTPythonTwitterBot" {
  name                = var.azurerm_search_service_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = "standard"
}
