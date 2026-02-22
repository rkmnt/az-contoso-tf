variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "aks_clusters" {
  description = "Map of AKS clusters to create. Key is used as the cluster name."
  type = map(object({
    kubernetes_version = string
    node_count         = number
    node_vm_size       = string
    os_disk_size_gb    = number
    network_plugin     = string
    network_policy     = string
    service_cidr       = string
    dns_service_ip     = string
  }))
}

variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
