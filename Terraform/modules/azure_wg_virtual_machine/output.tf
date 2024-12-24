output "vm_ssh_private_key" {
  value       = tls_private_key.ssh_key.private_key_openssh
  description = "SSH private key value to access created Azure VM"
  sensitive   = true
}