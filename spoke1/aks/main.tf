module "aks" {
  for_each = var.aks_clusters
  source   = "../../modules/aks"

  env                = var.env
  this_name          = each.key
  location           = var.location
  kubernetes_version = each.value.kubernetes_version
  node_count         = each.value.node_count
  node_vm_size       = each.value.node_vm_size
  os_disk_size_gb    = each.value.os_disk_size_gb
  subnet_id          = data.terraform_remote_state.networking.outputs.subnet_ids["backend"]
  network_plugin     = each.value.network_plugin
  network_policy     = each.value.network_policy
  service_cidr       = each.value.service_cidr
  dns_service_ip     = each.value.dns_service_ip
  common_tags        = var.common_tags
}
