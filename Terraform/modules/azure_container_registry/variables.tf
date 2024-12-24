variable "container_registry_name" {
  description = "Name of Azure Container Registry"
  type        = string
  sensitive   = true
}

variable "resource_group_location" {
  description = "Geographical region where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "AKS_resource_group_name" {
  description = "Name of AKS Resource Group where all AKS/ACR resources will be deployed"
  type        = string
  sensitive   = true
}