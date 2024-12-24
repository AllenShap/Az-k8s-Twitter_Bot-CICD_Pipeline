resource "azurerm_resource_group" "RG-terraformingvpn" {
  name     = var.resource_group_name
  location = var.resource_group_location
}