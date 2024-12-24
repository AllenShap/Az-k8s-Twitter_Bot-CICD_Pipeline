variable "kubernetes_cluster_name" {
  description = "Name of AKS cluster"
  type        = string
  sensitive   = true
}

variable "resource_group_location" {
  description = "Geographical region where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "AKS_resource_group_name" {
  description = "Name of AKS Resource Group where all AKS resources will be deployed"
  type        = string
  sensitive   = true
}

variable "acr_id" {
  description = "ID of Azure Container Registry where Docker images & Helm artifacts will be stored"
  type        = string
  sensitive   = true
}
