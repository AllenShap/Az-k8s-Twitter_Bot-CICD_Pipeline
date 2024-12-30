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

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}

resource "azurerm_role_assignment" "ACR-PullRoleAssignment" {
  principal_id                     = azurerm_kubernetes_cluster.AKS-KubernetesPythonTwitterBot.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}

data "azurerm_public_ip" "PIP-Associated_With_AKS_Cluster" {
  name                = split("/",tolist(azurerm_kubernetes_cluster.AKS-KubernetesPythonTwitterBot.network_profile[0].load_balancer_profile[0].effective_outbound_ips)[0])[8]
  resource_group_name = split("/",tolist(azurerm_kubernetes_cluster.AKS-KubernetesPythonTwitterBot.network_profile[0].load_balancer_profile[0].effective_outbound_ips)[0])[4]
}
