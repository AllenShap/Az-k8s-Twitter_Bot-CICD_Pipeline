output "nic_for_vm" {
  value       = azurerm_network_interface.nic_for_vm.id
  description = "ID of network interface card which has a public IP associated for use on the VM"
  sensitive   = true
}

output "public_ip_address" {
  value       = azurerm_public_ip.az_public_ip.ip_address
  description = "Public IP address which is associated with NIC"
  sensitive   = true
}
