resource "azurerm_resource_group" "RG-KubernetesPythonTwitterBot" {
  name     = var.AKS_resource_group_name
  location = var.resource_group_location
}