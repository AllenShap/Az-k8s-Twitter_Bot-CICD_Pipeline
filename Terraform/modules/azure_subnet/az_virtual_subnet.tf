resource "azurerm_subnet" "azure_subnet_for_vnet" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = "vnet-for-vm"
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "az_public_ip" {
  name                = "pip-for-nic"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
  sku_tier            = "Regional"
}

resource "azurerm_network_interface" "nic_for_vm" {
  name                = "nic-for-vm"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  accelerated_networking_enabled = true
  ip_forwarding_enabled          = false

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.azure_subnet_for_vnet.id
    private_ip_address_allocation = "Static"
    private_ip_address_version    = "IPv4"
    private_ip_address            = "10.0.0.11"
    public_ip_address_id          = azurerm_public_ip.az_public_ip.id
  }
}

resource "azurerm_network_security_group" "allow-inbound-ssh-and-wg-connections-only" {
  name                = "virtualMachineSecurityGroup"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Open-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Allow-default-wg-port"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "55525"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "associate_nsg_to_nic" {
  network_interface_id      = azurerm_network_interface.nic_for_vm.id
  network_security_group_id = azurerm_network_security_group.allow-inbound-ssh-and-wg-connections-only.id
}
