variable "resource_group_location" {
  description = "Geographical region where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of Azure Resource Group where resources will be deployed to"
  type        = string
  sensitive   = true
}
