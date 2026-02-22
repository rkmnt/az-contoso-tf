output "cluster_id" {
  description = "Resource ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks1.id
}

output "cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks1.name
}

output "kubeconfig" {
  description = "Raw kubeconfig for cluster access"
  value       = azurerm_kubernetes_cluster.aks1.kube_config_raw
  sensitive   = true
}

output "node_resource_group" {
  description = "Auto-created resource group for AKS node resources"
  value       = azurerm_kubernetes_cluster.aks1.node_resource_group
}

output "identity_principal_id" {
  description = "Principal ID of the AKS system-assigned identity"
  value       = azurerm_kubernetes_cluster.aks1.identity[0].principal_id
}

output "resource_group_name" {
  description = "Name of the created resource group"
  value       = azurerm_resource_group.rg1.name
}
