variable "resource_group_location" {
  description = "Geographical region where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of Azure Resource Group where all resources will be deployed to"
  type        = string
  sensitive   = true
}

variable "Storage_Account_Name_for_WireGuard_VPN_Configs" {
  description = "This is the Storage Account name for which WireGuard VPN configuration information will be stored. The configs are uploaded from the WG VPN using AzCopy"
  type        = string
  sensitive   = true
}

variable "Storage_Container_Name_for_WireGuard_VPN_Configs" {
  description = "This is the Storage Container name for which WireGuard VPN configuration information will be stored. The configs are uploaded from the WG VPN using AzCopy"
  type        = string
  sensitive   = true
}