resource "azurerm_resource_group" "rg1" {
  name     = "rg-${var.env}-${var.this_name}"
  location = var.location

  tags = var.common_tags
}

resource "azurerm_kubernetes_cluster" "aks1" {
  name                = "aks-${var.env}-${var.this_name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg1.name
  dns_prefix          = "aks-${var.env}-${var.this_name}"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = "system"
    node_count      = var.node_count
    vm_size         = var.node_vm_size
    vnet_subnet_id  = var.subnet_id
    os_disk_size_gb = var.os_disk_size_gb
    type            = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  node_provisioning_profile {
    mode = "Manual"
  }

  tags = var.common_tags
}
