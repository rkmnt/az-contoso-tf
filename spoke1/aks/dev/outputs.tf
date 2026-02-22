output "cluster_names" {
  description = "Map of AKS cluster names"
  value       = { for k, v in module.aks : k => v.cluster_name }
}

output "kubeconfigs" {
  description = "Map of kubeconfigs for each AKS cluster"
  value       = { for k, v in module.aks : k => v.kubeconfig }
  sensitive   = true
}
