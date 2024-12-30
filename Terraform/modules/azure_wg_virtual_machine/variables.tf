variable "resource_group_location" {
  description = "Geographical region where the resource group will be created"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Name of Azure Resource Group where all resources will be deployed"
  type        = string
  sensitive   = true
}

variable "nic_id" {
  description = "Name of Azure Resource Group where all resources will be deployed"
  type        = string
  sensitive   = true
}

variable "sas_url_for_azcopy" {
  description = "SAS url for a storage container which wireguard configs will be uploaded"
  type        = string
  sensitive   = true
}

variable "WG_Storage_Account_Name" {
  description = "Storage Account name where WireGuard VPN configs are stored"
  type        = string
  sensitive   = true
}

variable "WG_Storage_Container_Name" {
  description = "Storage Container name where WireGuard VPN configs are stored"
  type        = string
  sensitive   = true
}

variable "outboundip" {
  type        = string
  description = "aks ip"
}
