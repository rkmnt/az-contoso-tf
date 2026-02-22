variable "env" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
}

variable "this_name" {
  description = "Base name for resources in this module"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the system node pool"
  type        = number
}

variable "node_vm_size" {
  description = "VM size for the system node pool"
  type        = string
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB for each node"
  type        = number
}

variable "subnet_id" {
  description = "Resource ID of the subnet for AKS nodes"
  type        = string
}

variable "network_plugin" {
  description = "Network plugin to use (azure or kubenet)"
  type        = string
}

variable "network_policy" {
  description = "Network policy to use (azure or calico)"
  type        = string
}

variable "service_cidr" {
  description = "CIDR for Kubernetes internal services (must not overlap with any VNet)"
  type        = string
}

variable "dns_service_ip" {
  description = "IP address for the Kubernetes DNS service (must be within service_cidr)"
  type        = string
}

variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
