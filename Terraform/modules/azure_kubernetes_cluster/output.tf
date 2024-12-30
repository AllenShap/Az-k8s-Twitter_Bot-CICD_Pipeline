output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.AKS-KubernetesPythonTwitterBot.name
  description = "Name of AKS cluster"
  sensitive   = true
}

output "outboundip" {
  value = data.azurerm_public_ip.PIP-Associated_With_AKS_Cluster.ip_address
}
