resource "azurerm_cosmosdb_account" "USNYTPythonTwitterBotCDBAccount" {
  name                = var.azurerm_cosmosdb_account_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }
  geo_location {
    location          = var.resource_group_location
    failover_priority = 0
  }
  capabilities {
    name = "EnableServerless"
  }
  backup {
    type = "Continuous"
    tier = "Continuous7Days"
  }
}

resource "azurerm_cosmosdb_sql_database" "USNYTPythonTwitterBotCDB" {
  name                = var.azurerm_cosmosdb_sql_database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.USNYTPythonTwitterBotCDBAccount.name
}

resource "azurerm_cosmosdb_sql_container" "USNYTPythonTwitterBotCDBContainer" {
  name                = var.azurerm_cosmosdb_sql_container_name
  resource_group_name = var.resource_group_name

  account_name          = azurerm_cosmosdb_account.USNYTPythonTwitterBotCDBAccount.name
  database_name         = azurerm_cosmosdb_sql_database.USNYTPythonTwitterBotCDB.name
  partition_key_paths   = ["/categoryId"]
  partition_key_version = 2
  indexing_policy {
    indexing_mode = "consistent"

    included_path {
      path = "/*"
    }
    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
}
