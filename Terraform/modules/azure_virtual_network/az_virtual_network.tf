resource "azurerm_virtual_network" "vnet-for-vm" {
  name                = "vnet-for-vm"
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}
