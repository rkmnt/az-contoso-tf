env      = "dev"
location = "northeurope"

aks_clusters = {
  contoso = {
    kubernetes_version = "1.32"
    node_count         = 1
    node_vm_size       = "Standard_B2s"
    os_disk_size_gb    = 30
    network_plugin     = "azure"
    network_policy     = "azure"
    service_cidr       = "10.0.0.0/16"
    dns_service_ip     = "10.0.0.10"
  }
  # contoso2 = {
  #   kubernetes_version = "1.32"
  #   node_count         = 2
  #   node_vm_size       = "Standard_D2s_v3"
  #   os_disk_size_gb    = 50
  #   network_plugin     = "azure"
  #   network_policy     = "azure"
  #   service_cidr       = "10.2.0.0/16"
  #   dns_service_ip     = "10.2.0.10"
  # }
}

common_tags = {
  environment = "dev"
  project     = "contoso"
  managed_by  = "terraform"
}
