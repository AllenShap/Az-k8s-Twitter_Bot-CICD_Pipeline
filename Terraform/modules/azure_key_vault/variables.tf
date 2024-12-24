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

variable "SSH_key_value_to_store_in_kv" {
  description = "SSH private key value to access created Azure VM"
  type        = string
  sensitive   = true
}

variable "Additional_Object_ID_For_KeyVault_Access" {
  description = "Since the GitHub Actions workflow uses a provisioned Service Account to deploy the Azure infra, It will not allow me to view Secrets in the KV which is useful for troubleshooting purposes."
  type        = string
  sensitive   = true
}
