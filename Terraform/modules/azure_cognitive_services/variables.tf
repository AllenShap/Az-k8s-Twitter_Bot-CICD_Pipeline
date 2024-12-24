variable "resource_group_location" {
  description = "Geographical region where all resource groups will be created"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of Azure Resource Group which will contain resources that support the backend of the AKS Python Tweet Bot (dbs, apis, logging, ai)"
  type        = string
  sensitive   = true
}

variable "azurerm_cognitive_account_name" {
  description = "Name of Cognitive Account to be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}

variable "azurerm_search_service_name" {
  description = "Name of Cognitive Search Service to be used by the AKS Python Tweet Bot"
  type        = string
  sensitive   = true
}