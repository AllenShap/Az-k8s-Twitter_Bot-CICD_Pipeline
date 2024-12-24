output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.AKS-KubernetesPythonTwitterBot.name
  description = "Name of AKS cluster"
  sensitive   = true
}
