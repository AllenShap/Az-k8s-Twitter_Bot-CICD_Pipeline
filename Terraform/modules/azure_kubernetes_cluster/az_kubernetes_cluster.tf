resource "azurerm_kubernetes_cluster" "AKS-KubernetesPythonTwitterBot" {
  name                = var.kubernetes_cluster_name
  location            = var.resource_group_location
  resource_group_name = var.AKS_resource_group_name
  dns_prefix          = "${var.kubernetes_cluster_name}-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "standard_D4s_v3"
    max_pods   = 30
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "ACR-PullRoleAssignment" {
  principal_id                     = azurerm_kubernetes_cluster.AKS-KubernetesPythonTwitterBot.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}
